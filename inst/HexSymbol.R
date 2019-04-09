library(ggplot2)
library(hexSticker)
library(showtext)
font_add_google("EB Garamond", "beeg")
showtext_auto()
p <- ggplot() +
  geom_polygon(data = WardsDF, aes(x = long, y = lat, group = group, fill = factor(Ward)),
               col  = "black", alpha = 0.3, size = 0.3) +
  coord_quickmap()
p <- p + theme_void() + theme(legend.position = "none")
sticker(p, package="DCmapR", p_size=26, p_y = 1.08, p_x = 1, p_family =  "beeg", p_color = "white",
        s_x=1.1, s_y=.95, s_width=1.8, s_height=1.8,
        h_fill = "#002868", h_color = "#BF0A30", filename="inst/DCmapR.png")
p <- p + theme_void() + theme(legend.position = "none")
sticker(p, package="DCmapR", p_size=12, p_y = 1.08, p_x = 1, p_family =  "beeg", p_color = "white",
        s_x=1.1, s_y=.95, s_width=1.8, s_height=1.8,
        h_fill = "#002868", h_color = "#BF0A30", filename="inst/DCmapRSMALL.png", dpi = 125)
