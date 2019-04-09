library(ggplot2)
library(hexSticker)
p <- ggplot() +
  geom_polygon(data = WardsDF, aes(x = long, y = lat, group = group, fill = factor(Ward)),
               col  = "black", alpha = 0.3, size = 1) +
  coord_quickmap()
p <- p + theme_void() + theme(legend.position = "none")
sticker(p, package="DCmapR", p_size=18, s_x=1, s_y=.75, s_width=1.3, s_height=1,
        filename="inst/DCmapR.png")
