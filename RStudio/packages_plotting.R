source('/Rscripts/install_packages_function.R')

# packages for plotting
packages_to_install <- c(
  'alluvial',
  'beeswarm',
  'circlize',
  'ComplexHeatmap',
  'cowplot',
  'vankesteren/firatheme',
  'chrisamiller/fishplot',
  'ggalluvial',
  'gganimate',
  'ggbeeswarm',
  'ggbio', 
  'ggdendro',
  'ggExtra',
  'ggforce',
  'thomasp85/ggfx',
  'erocoar/gghalves',
  'ggpointdensity',
  'ggpubr',
  'ggraph',
  'ggrastr', 
  'ggrepel',
  'ggridges',
  'ggsci',
  'ggsignif',
  'ggthemes',
  'heatmaps', 
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
  'wesanderson',
  'karyoploteR'
)

install_packages(packages_to_install)

devtools::install_github(c(
         "VPetukhov/ggrastr")) # Still config error for Cairo
