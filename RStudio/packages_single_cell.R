source('/Rscripts/install_packages_function.R')

# packages for single cell analysis
# force package multtest to avoid installation error when it's required as dependency
packages_to_install <- c(
  'batchelor',
  'BUStools/BUSpaRse',
  'destiny',
  'cellranger',
  'zhouzilu/DENDRO',
  'diffusionMap',
  'DropletUtils',
  'cole-trapnell-lab/garnett',
  'glmGamPoi',
  'theislab/kBET',
  'MetaNeighbor',
  'monocle',
  'muscat',
  'phateR',
  'Seurat',
  'SC3',
  'scater',
  'ZJUFanLab/scCATCH',
  'scde',
  'scDblFinder',
  'ggjlab/scMCA',
  'scMerge',
  'scran',
  'sctransform',
  'SingleR',
  'slingshot',
  'splatter',
  'multtest',
  'YosefLab/VISION',
  'velocyto-team/velocyto.R'
)

install_packages(packages_to_install)

# alternative location for R packages
place_for_other_libraries <- '/other_R_libraries'
dir.create(place_for_other_libraries, recursive = TRUE)

# Seurat 4.1.1
devtools::install_version(
  'Seurat',
  version = '4.1.1',
  repos = 'http://cran.us.r-project.org',
  lib = place_for_other_libraries,
  quiet = TRUE
)