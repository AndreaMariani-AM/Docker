 source('/Rscripts/install_packages_function.R')

# utility packages
packages_to_install <- c(
  'remotes',
  'devtools',
 # 'tidyverse',
 # 'thomasp85/ambient', #doesn't work
 # 'djnavarro/jasmines', #works
 # 'jalvesaq/colorout', #doesn't work
 # 'concaveman',
 # 'corrr',
 # 'dendextend',
 # 'densityClust',
 # 'xiaodaigh/disk.frame' # doens't work
 # 'DT',
 # 'fastcluster',
  # 'foreign',
  # 'future.apply',
  # 'gam',
  # 'glue',
  # 'golem',
  # 'here',
  # 'h2o',
  # 'hdf5r',
  # 'intrinsicDimension',
  # 'lwgeom',
  # 'magrittr',
  # 'openxlsx',
  # 'phylogram',
  # 'pryr',
  # 'renv',
  # 'reshape2',
  # 'reticulate',
  # 'rgdal',
  # 'roxygen2',
  # 'Rtsne',
  # 'scales',
  # 'shiny',
  # 'shinydashboard',
  # 'shinyjs',
  # 'shinythemes',
  'sf',
  'stringi',
  'tensorflow',
  'tsne',
  'umap',
  'uwot',
  'workflowr',
  'XML',
  'xml2'
)

install_packages(packages_to_install)
