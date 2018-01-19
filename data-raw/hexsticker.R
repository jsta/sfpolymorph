library(hexSticker)
library(ggplot2)
library(sf)

data(sheep)
df <-data.frame(a = 1)
sheep <- st_sfc(sheep)
st_geometry(df) <- sheep

(gg <- ggplot(data=df) + geom_sf() + theme_void() + theme_transparent() +
      coord_sf(datum = NA))

sticker(gg, s_x=1, s_y=.8, s_width=1.2, s_height=1,
        filename = "inst/figures/sheep.png", package = "sfpolymorph",
        h_fill = "#00000000", h_color = "grey",
        p_color = sf.colors()[2], p_size = 20,
        p_family = "Aller_Lt")
