
#------------------------------------------------------------------------------#
# covid-delays: Code Repository for the "COVID-19 Delays" Paper
#
# Author: Pedro Nascimento de Lima
# See LICENSE.txt and README.md for information on usage and licensing
#------------------------------------------------------------------------------#

# Dependencies ------------------------------------------------------------
library(showtext)
library(curl)
library(dplyr)
library(tidyr)
library(purrr)
library(readxl)
library(ggplot2)
library(patchwork)
library(janitor)
library(forcats)
# source necessary functions:
invisible(sapply(X = paste0(list.files(path = "./R/funs/", pattern = "*.R",full.names = T)),FUN = source, echo = F)) 


# 

# Load libraries:


# Read results:
full_results_wide <- read.csv("./input/full_results_wide.csv")
full_results_wide_sensitivity <- read.csv("./input/full_results_wide_sensitivity.csv")

# Define colors:
colors <- c("CRCSPIN" = models_colors[1], "MISCAN" = models_colors[2])

# Main Figure 1:

r$fig_01 <- r$full_results_wide %>%
  filter(COL_sens == "High", max_LY_lost * ldg_coeff >= 2) %>%
  gg_dot_plot_LY_lost(., colors = colors) 

r$fig_01

# S Figure 1

r$fig_02 <- r$full_results_wide %>%
  filter(COL_sens == "High", max_LY_lost * ldg_coeff < 2) %>%
  gg_dot_plot_LY_lost(., colors = colors)

r$fig_02

# S Figure 2

r$fig_03 <- r$full_results_wide %>%
  filter(COL_sens == "Low", max_LY_lost * ldg_coeff >= 2) %>%
  gg_dot_plot_LY_lost(., colors = colors)

r$fig_03

# S Figure 3

r$fig_04 <- r$full_results_wide %>%
  filter(COL_sens == "Low", max_LY_lost * ldg_coeff < 2) %>%
  gg_dot_plot_LY_lost(., colors = colors)

r$fig_04

# S Figure 4

line_45_lyg <- data.frame(x = min(round(r$full_results_wide_sensitivity$LYG_screening_High)):max(round(r$full_results_wide_sensitivity$LYG_screening_High)))

r$fig_05 <- r$full_results_wide_sensitivity %>%
  ggplot(mapping = aes(x = LYG_screening_High, y = LYG_screening_Low)) + 
  geom_point(mapping = aes(color = model)) + 
  geom_line(data = line_45_lyg, mapping = aes(x = x, y = x)) + 
  base_theme + 
  ylab("LYG under Low-Sensitivity Assumptions") + 
  xlab("LYG under High-Sensitivity Assumptions") + 
  scale_color_manual(values = models_colors) + 
  theme(legend.position = c(0.8, 0.1))

line_45 <- data.frame(x = min(round(r$full_results_wide_sensitivity$LY_lost_pandemic_High)):max(round(r$full_results_wide_sensitivity$LY_lost_pandemic_High)))

# S figure 5

r$fig_06 <- r$full_results_wide_sensitivity %>%
  ggplot(mapping = aes(x = LY_lost_pandemic_High, y = LY_lost_pandemic_Low)) + 
  geom_point(mapping = aes(color = model)) + 
  geom_line(data = line_45, mapping = aes(x = x, y = x)) + 
  base_theme + 
  ylab("LY Lost under Low-Sensitivity Assumptions") + 
  xlab("LY Lost under High-Sensitivity Assumptions") + 
  scale_color_manual(values = models_colors) + 
  theme(legend.position = c(0.8, 0.1))

r$fig_06

# Save Figures:
devices = c("png", "pdf", "eps")

for(device in devices) {
  ggsave(r$fig_01,filename = paste0("./output/fig_01.",device) ,device = device, width = 6, height = 7, dpi = 96, bg = "white")
  ggsave(r$fig_02,filename = paste0("./output/fig_02.",device) ,device = device, width = 6, height = 7, dpi = 96, bg = "white")
  ggsave(r$fig_03,filename = paste0("./output/fig_03.",device) ,device = device, width = 6, height = 7, dpi = 96, bg = "white")
  ggsave(r$fig_04,filename = paste0("./output/fig_04.",device) ,device = device, width = 6, height = 7, dpi = 96, bg = "white")
  
  ggsave(r$fig_05,filename = paste0("./output/fig_05.",device) ,device = device, width = 6, height = 6, dpi = 96, bg = "white")
  ggsave(r$fig_06,filename = paste0("./output/fig_06.",device) ,device = device, width = 6, height = 6, dpi = 96, bg = "white")
}
