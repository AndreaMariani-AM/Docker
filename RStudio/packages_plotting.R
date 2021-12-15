source('/Rscripts/install_packages_function.R')

# packages for plotting
packages_to_install <- c(
  'alluvial',
  'beeswarm',
  'circlize',
  # 'ComplexHeatmap', # has S4Vectors dependency
  'cowplot',
  'vankesteren/firatheme',
  'chrisamiller/fishplot',
  'ggalluvial',
  'gganimate',
  'ggbeeswarm',
#  'ggbio', # has S4Vectors dependecy and also zlibbioc
  'ggdendro',
  'ggExtra',
  'ggforce',
  'thomasp85/ggfx',
  'erocoar/gghalves',
  'ggpointdensity',
  'ggpubr',
  'ggraph',
#  'ggrastr', # configuration error
  'ggrepel',
  'ggridges',
  'ggsci',
  'ggsignif',
  'ggthemes',
#  'heatmaps', #zlibbioc, S4Vectors, EBIimage, dependecy problem, same sa always with ccache gcc error.
  'jcolors',
  'paletteer',
  'patchwork',
  'pheatmap',
  'plotly',
  'prismatic',
  'RColorBrewer',
  'scico',
  'UpSetR',
  'VennDiagram',
  'viridis',
  'wesanderson'
)

install_packages(packages_to_install)

devtools::install_github(c(
         "VPetukhov/ggrastr")) # Still config error for Cairo