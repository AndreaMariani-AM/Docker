source('/Rscripts/install_packages_function.R')

# packages for plotting
packages_to_install <- c(
  'alluvial',
  'beeswarm',
  'circlize',
#   'ComplexHeatmap', # has S4Vectors dependency
  'cowplot',
  'vankesteren/firatheme', #works
  'chrisamiller/fishplot', #works
  'ggalluvial',
  'gganimate',
  'ggbeeswarm',
#  'ggbio', # has S4Vectors dependecy and also zlibbioc
  'ggdendro',
  'ggExtra',
  'ggforce'
#   'thomasp85/ggfx', #works
#   'erocoar/gghalves', #works
#   'ggpointdensity',
#   'ggpubr',
#   'ggraph',
#   'ggrastr',
#   'ggrepel',
#   'ggridges',
#   'ggsci',
#   'ggsignif',
#   'ggthemes',
#   'heatmaps',
#   'jcolors',
#   'paletteer',
#   'patchwork',
#   'pheatmap',
#   'plotly',
#   'prismatic',
#   'RColorBrewer',
#   'scico',
#   'UpSetR',
#   'VennDiagram',
#   'viridis',
#   'wesanderson'
)

install_packages(packages_to_install)