library(ggplot2)
library(dplyr)
library(showtext)

# le chemin d'accès se trouve lorsque l'on clique sur la police dans :
# C:/Windows/Fonts
# Importer la police et lui donner le nom de CMU
font_add(family = "CMU", regular = "C:/Windows/Fonts/cmunsx.ttf")
showtext_auto()

df <- data.frame(value = c(11.2, 11.7, 7.9, 8.4, 6.5, 40.0, 8.9, 5.5),
                 group = c("RE", "CR", "EN", "VU", "NT", "LC", "DD", "NA"))
# Mettre les catégories dans le bons ordres (si non aléatoire)
df$group <- factor(df$group, levels = rev(as.character(df$group)))

# diamètre disque interne du donut
hsize <- 2.5
df <- df %>% 
  mutate(x = hsize)



########################## ggplot  ##########################
ggplot(df, aes(x = hsize, y = value, fill = group)) +
  # taille contour graphique 
  geom_col(color = "black", size = 0.5) +
  # concatener les valeurs et les groupes avec % et /n
  geom_text(aes(label = paste(df$group, paste0(df$value, sep = "%"), sep = "\n")), 
            position = position_stack(vjust = 0.5), family = "CMU", color = "white", size = 3.5, fontface = "bold") +
  coord_polar(theta = "y") +
  xlim(c(0.2, hsize + 0.5)) +
  scale_fill_manual(values = rev(c("#916094", "#B22123", "#F19101", "#F3E61F" , "#7EB02D", "#54784A", "#CCC9C0", "#B7A895")), 
                    labels = rev(c("Régionalement éteint", "En danger critique", "En danger", "Vulnérable", "Quasi menacée", "Préoccupation mineure", "Données insuffisantes", "Non applicable"))) +
  guides(fill = guide_legend(title = "Catégorie IUCN", override.aes = list(color = "black"))) + 
  theme(panel.background = element_rect(fill = "white"),
        panel.grid = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank()) 

ggsave(filename = "Output/Belgium_IUCN.png")
ggsave(filename = "Output/Belgium_IUCN.pdf")

