
# Monocle 3
# devtools::install_url('https://cran.r-project.org/src/contrib/Archive/Matrix.utils/Matrix.utils_0.9.7.tar.gz')
BiocManager::install('cole-trapnell-lab/monocle3', update = TRUE, ask = FALSE, force = TRUE, quiet = TRUE)

# SnapATAC
BiocManager::install('plot3D', update = TRUE, ask = FALSE, force = TRUE, quiet = TRUE)
#BiocManager::install('r3fang/SnapATAC', update = TRUE, ask = FALSE, force = TRUE, quiet = TRUE)

# cisTopic
BiocManager::install('aertslab/cisTopic', update = TRUE, ask = FALSE, force = TRUE, quiet = TRUE)

# seurat-wrapper
BiocManager::install('satijalab/seurat-wrappers', update = TRUE, ask = FALSE, force = TRUE, quiet = TRUE)

# cerebroApp
BiocManager::install('romanhaa/cerebroApp', update = TRUE, ask = FALSE, force = TRUE, quiet = TRUE)

# metacell
BiocManager::install('metacell', site_repository = 'tanaylab.bitbucket.io/repo', quiet = TRUE)

# loomR
BiocManager::install('itertools', update = TRUE, ask = FALSE, force = TRUE, quiet = TRUE)
BiocManager::install('mojaveazure/loomR', ref = 'develop', dependencies = TRUE, quiet = TRUE)

# cellassign
tensorflow::install_tensorflow(extra_packages = 'tensorflow-probability')
BiocManager::install('Irrationone/cellassign', update = TRUE, ask = FALSE, force = TRUE, quiet = TRUE)

# Cicero
BiocManager::install('Gviz', update = TRUE, ask = FALSE, force = TRUE, quiet = TRUE)
devtools::install_github('cole-trapnell-lab/cicero-release', ref = 'monocle3')

# Signac
BiocManager::install('timoast/signac')