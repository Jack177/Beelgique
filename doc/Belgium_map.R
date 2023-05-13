# library(remotes)
# install_github("rOpenGov/giscoR")
# install.packages("giscoR")

library(giscoR)
library(dplyr)
be <- gisco_get_nuts(country = "Belgium", nuts_level = 'all')

ggplot(ITA) +
  geom_sf() +
  geom_sf_text(aes(label = NAME_LATN)) +
  theme(axis.title = element_blank())

be <- gisco_get_countries(resolution = "03", country = "Belgium")
ggplot(be) +
  geom_sf(fill = "tomato") +
  theme_minimal()
