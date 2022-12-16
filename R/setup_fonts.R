
#------------------------------------------------------------------------------#
# covid-delays: Code Repository for the "COVID-19 Delays" Paper
#
# Author: Pedro Nascimento de Lima
# See LICENSE.txt and README.md for information on usage and licensing
#------------------------------------------------------------------------------#

library(showtext)
library(ggplot2)
g_font <- "Noto Sans" # "Roboto", "Open Sans" "PT Sans", "Roboto Mono", "Source Code Pro", "IBM Plex Mono", "Space Mono"
mono_font <- "Roboto Mono"

font_add_google(name = g_font,family = g_font)
font_add_google(name = mono_font,family = mono_font)

base_theme <- randplot::theme_rand(font = g_font) + theme(axis.text = element_text(family = mono_font),
                                                          legend.position="top",
                                                          legend.spacing.x = unit(0, 'cm'),
                                                          panel.spacing.y=unit(0.5, "lines"),
                                                          panel.grid.minor=element_blank(),
                                                          panel.grid.major=element_blank())
showtext_auto()
n_models = 2
#models_colors = randplot::RandCatPal[c(9,2,4,6)][1:n_models]
# From color brewer:
# https://colorbrewer2.org/#type=sequential&scheme=BuPu&n=3
models_colors = c("#8856a7", "#9ebcda")
