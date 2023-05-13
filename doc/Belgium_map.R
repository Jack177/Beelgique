# library(remotes)
# install_github("rOpenGov/giscoR")
# install.packages("giscoR")
library(ggplot2)
library(giscoR)
library(dplyr)
library(Cairo)


be <- gisco_get_countries(resolution = "03", country = "Belgium")
ggplot(be) +
  geom_sf(fill = "white", size = 1.5) + 
  theme(panel.background = element_rect(fill = "white"),
        panel.grid = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank()) 


ggsave(filename = "Output/Belgium_map.svg")
ggsave(filename = "Output/Belgium_map.png")
