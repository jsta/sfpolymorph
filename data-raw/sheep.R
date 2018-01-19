# Use **inkscape** to convert SVG to postscript
library(grImport)
library(sf)

PostScriptTrace("data-raw/lamb.svg.ps", "data-raw/lamb.svg.ps.xml")

sheep      <- readPicture("data-raw/lamb.svg.ps.xml")
sheep      <- cbind(sheep@paths$path@x, sheep@paths$path@y)
line_index <- which(row.names(sheep) == "move")
line_index <- cbind(line_index[1:5], cumsum(diff(line_index)))
face  <- sheep[line_index[2,1]:line_index[2,2],]
sheep <- sheep[line_index[1,1]:line_index[1,2],]
sheep <- st_polygon(list(sheep, face))

devtools::use_data(sheep)

# plot(sheep)
