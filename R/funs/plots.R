

#------------------------------------------------------------------------------#
# Unequal Recovery in Colorectal Cancer Screening code repository
# Author: Pedro Nascimento de Lima
# Copyright (C) 2022
# See README.md for information on usage and licensing
#------------------------------------------------------------------------------#

# Function to plot results

gg_dot_plot_LY_lost <- function(wide_results_data, colors) {
  
  plot_data <-  wide_results_data %>%
    ungroup() %>%
    mutate(screening_pre_pandemic = factor(x = screening_pre_pandemic, levels = c("C","F","f", "U"),ordered = T)) %>%
    mutate(age = recode_factor(age, `50`="50 year-olds", `60`="60 year-olds", `70`="70 year-olds", .ordered = T)) %>%
    arrange(age, screening_pre_pandemic, max_LY_lost) %>%
    mutate(plot_order = row_number()) 
  
  max_width <- max(nchar(as.character(plot_data$scenario)))
  plot_data$scenario <- sprintf(paste0("%-", max_width, "s"), plot_data$scenario)
  
  plot_data <- plot_data %>%
    mutate(scenario = fct_reorder(scenario, plot_order))
  
  plot_data %>%
    ggplot() +
    geom_segment(aes(x=scenario, xend=scenario, y=LY_lost_pandemic_CRCSPIN, yend=LY_lost_pandemic_MISCAN), color="grey") +
    geom_point( aes(x=scenario, y=LY_lost_pandemic_CRCSPIN, color = "CRCSPIN"), size=3 ) +
    geom_point( aes(x=scenario, y=LY_lost_pandemic_MISCAN, color = "MISCAN"), size=3 ) +
    geom_hline(yintercept = 0, color = "grey") +
    coord_flip() + 
    base_theme + 
    scale_color_manual(values = colors) + 
    labs(x = "Scenario",
         y = "Life-years lost per 1000 individuals",
         color = "Model") + 
    scale_y_continuous(
      labels = scales::number_format(accuracy = 1), sec.axis = sec_axis(~.*ldg_coeff, name="Life-days lost per person")) + 
    facet_grid(rows = vars(age),
               scales="free_y",
               space = "free") +
    theme(panel.grid.minor.y=element_blank(),
          panel.grid.major.y=element_blank(),
          #strip.text.y = element_blank()
          ) +
    theme(legend.position = c(1.1, 1)) + 
    theme(axis.text.y = element_text(hjust=0)) +
    theme(panel.background = element_rect(fill = NA, color = "grey")) + 
    theme(panel.spacing = unit(0, "line"))
  
}

