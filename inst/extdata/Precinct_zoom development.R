library(rgeos)
library(raster)
Just <- over(PrecinctSF, Ward1SF, returnList = TRUE)
Just2 <- gIntersection(Ward1SF, PrecinctSF)
Just3 <- gContains(Ward1SF, PrecinctSF, byid = TRUE)
Just4 <- PrecinctDF[Just3, ]
ggplot() +
  geom_polygon(data = Just2, aes(x = long, y = lat, group = group), fill = "white", col = "black") +
  coord_quickmap()


#from the vignette
#Trim to ward 8, I'm not sure why its polygon number is 1
PrecinctSF <- get_Precinct(dataframe = FALSE)
Ward1SF <- WardsSF[1,]
Just1 <- PrecinctSF[Ward1SF, ]
ggplot() +
  geom_polygon(data = Ward1SF, aes(x = long, y =  lat, group = group)) +
  coord_quickmap()
#Use over to get the overlapping datapoints
PrecinctSF <- get_Precinct(dataframe = FALSE)
ggplot() +
  geom_polygon(data = Ward1SF, aes(x = long, y =  lat, group = group), fill = "white") +
  geom_polygon(data = Just1, aes(x= long, y = lat, group = group), fill = NA, col = "black") +
  coord_quickmap()
