

#------------------------------------------------------------------------------#
# Unequal Recovery in Colorectal Cancer Screening code repository
# Author: Pedro Nascimento de Lima
# Copyright (C) 2022
# See README.md for information on usage and licensing
#------------------------------------------------------------------------------#

# Use this script to install dependencies for this project.

# Alternatively, first install the renv package with install.packages("renv"), 
# then run renv::restore() to install the same package versions we used.

# CRAN packages
packages = c("showtext", "dplyr", "tidyr", "purr", "ggplot2", "writexl", "janitor", "forcats", "remotes")

install.packages(packages)

# github packages
remotes::install_github("https://github.com/RANDCorporation/randplot")
