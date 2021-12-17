# This file contains a general purpose script to run the RStudio server with RStudio Singularity image. https://github.com/rocker-org/rocker-versioned2/issues/105

##===========================================##===========================================##
# Shabang and PBS directives
##===========================================##===========================================##

#!/bin/bash
#PBS -l walltime=12:00:00
#PBS -k oe
#PBS -j oe
#PBS -N RstudioServer

# `-j oe` merge output and error files. Both streams will be merged, intermixed as STDOUT (oe argument)
# `-k oe` defines which of STDOUT and ERR will be retained on the excution host, `o` STDOUT and `e` STDERR will be retained



##===========================================##===========================================##
# Declare path variables
##===========================================##===========================================##

# path of the singularity image to run with studio-server
singularity_image="/hpcnfs/data/DP/Singularity/rstudio_date.sif"

# r version of the singularity image
r_version=version

# Define the home directory
user=`whoami`
home="/hpcnfs/scratch/DP/RstudioServer/${r_version}/home/${user}"

# Define path where R packages will be installed
r_packages="${home}/Rstudio-${r_version}-lib"
mkdir -p ${r_packages}



##===========================================##===========================================##
# Seth variables to run the server
##===========================================##===========================================##

# This generates a pseudo random password of 20 bytes and output as base64 (other outputs are raw o hex)
export PASSWORD=${openssl rand -base64 20}
# Get unused socket https://unix.stackexchange.com/a/132524, 
# this thread explain how to find an unused local port, here (https://en.wikipedia.org/wiki/Port_(computer_networking))
# what a port is

# get the unused socket for tiny race condition between python & singularity commands. Define the variable `PORT` with a 
# python code that gets a unsed socket number.
readonly PORT=$(python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()')

# This prints everything from here to `END` to a file
cat 1>&2 <<END
1. SSH tunnel from workstation using the following command:

	ssh -N -L 8787:${HOSTNAME}:${PORT} ${USER}@192.168.97.161

then open on you web browser the following address

	http://localhsot:8787

2. Log in into RStudio Server with the following commands:

	user: ${USER}
	password: ${PASSWORD}

When you're done w/ RStudio Server, terminate the job by:

1. Exit the RStudio session (click on the "power" button on te top right corner of the RStudio windod)
2. Enter the following command on terminal to end the job

	qdel ${PBS_JOBID}
		or
	qdel -Wforce ${PBS_JOBID}
END

# Packages installed by the User go into their custom home directory
# Also, add User-installed R packages into R_LIBS to force R to load those over the ones in the singularity image.
if [ ! -e {HOME}/.Renviorn ]
then
  printf '\nNOTE: creating ~/.Renviron file\n\n'
  echo "R_LIBS_USER=${r_packages}" >> ${home}/.Renviron
  echo "R_LIBS=${r_packages}:/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library" >> ${home}/.Renviron
fi



##===========================================##===========================================##
# Fixing permission problem with Rocker RStudio 1.4 images
##===========================================##===========================================##

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"



##===========================================##===========================================##
# General notes
##===========================================##===========================================##

# what i'm doing here??

export TMPDIR="${home}/rstudio-tmp"

mkdir -p "$TMPDIR/tmp/rstudio-server"
uuidgen > "$TMPDIR/tmp/rstudio-server/secure-cookie-key"
# uuidgen creates and prints a new universally unique identifier (UUID)
chmod 0600 "$TMPDIR/tmp/rstudio-server/secure-cookie-key"

mkdir -p "$TMPDIR/var/lib"
mkdir -P "$TMPDIR/var/run"



##===========================================##===========================================##
# Run RStudio from singularity containter
##===========================================##===========================================##
# Mount the /hpcnfs/ directory on the host onto the singularity container
# By default the only host file systems mounted within the container are $HOME, /tmp, /proc, /sys, and /dev.
/hpcnfs/software/singularity/3.7.0/bin/singularity exec \
	-H ${home} \
	--bind /hpcnfs/ \
	--bind="$TMPDIR/var/lib:var/lib/rstudio-server" \
	--bind="$TMPDIR/var/run:var/run/rstudio-server" \
	--bind="$TMPDIR/tmp:/tmp" \
	${singularity_image} \
	rserver --www-port ${PORT} --auth-none=0 --auth-pam-helper-path=pam-helper --auth-timeout-minutes=0 --auth-stay-signed-in-days=30

printf 'rserver exited' 1>&2

# --auth-none=0 --auth-pam-helper-path=pam-helper are required to enable password authentication https://www.rocker-project.org/use/singularity/
# --auth-timeout-minutes=0 --auth-stay-signed-in-days=30 these to extend the strict policy of session timeout or rstudio server
#  A per-user /tmp should be bind-mounted when running on a multi-tenant HPC cluster that has singularity configured to bind mount the host /tmp, to avoid an existing /tmp/rstudio-server owned by another user.