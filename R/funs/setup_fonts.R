
#------------------------------------------------------------------------------#
# Unequal Recovery in Colorectal Cancer Screening code repository
# Author: Pedro Nascimento de Lima
# Copyright (C) 2022
# See README.md for information on usage and licensing
#------------------------------------------------------------------------------#

library(showtext)
library(ggplot2)
g_font <- "Noto Sans" # "Roboto", "Open Sans" "PT Sans", "Roboto Mono", "Source Code Pro", "IBM Plex Mono", "Space Mono"
mono_font <- "Roboto Mono"

font_add_google(name = g_font,family = g_font)
font_add_google(name = mono_font,family = mono_font)

# Plot Theme from The RAND Corporation
# This theme is based on a theme available from randplot
# This is intended to be used by RANDites.
# If you are not affiliated in any way with RAND, I recommend you should use another theme.

base_theme <- randplot::theme_rand(font = g_font) + theme(axis.text = element_text(family = mono_font),
                                                          legend.position="top",
                                                          legend.spacing.x = unit(0, 'cm'),
                                                          panel.spacing.y=unit(0.5, "lines"),
                                                          panel.grid.minor=element_blank(),
                                                          panel.grid.major=element_blank())

showtext_auto()
n_models = 2
# From color brewer:
# https://colorbrewer2.org/#type=sequential&scheme=BuPu&n=3
models_colors = c("#8856a7", "#9ebcda")
