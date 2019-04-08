# WardShape Functions
WardShape <- rgdal::readOGR("inst/extdata/Ward_from_2012/Ward_from_2012.shp")
Wards <- ggplot2::fortify(WardShape)
library(dplyr)
Wards <- Wards %>% #add labels to wards
  dplyr::mutate(Ward =
                  dplyr::case_when(
                    group == 0.1 ~ 8,
                    group == 1.1 ~ 6,
                    group == 2.1 ~ 7,
                    group == 3.1 ~ 2,
                    group == 4.1 ~ 1,
                    group == 5.1 ~ 5,
                    group == 6.1 ~ 3,
                    group == 7.1 ~ 4
                  ))
Wards$Ward <- factor(Wards$Ward)
# For Precincts:
PrecinctShape <- rgdal::readOGR("inst/extdata/Voting_Precinct__2012/Voting_Precinct__2012.shp")
Precincts <- ggplot2::fortify(PrecinctShape) # change to dataframe
## Centroids
get_centroid <- function(Ward_or_Precinct){ # Make centroids for easy labels
  if(Ward_or_Precinct == "ward"){
    WardShape <- rgdal::readOGR("inst/extdata/Ward_from_2012/Ward_from_2012.shp") # import
    Wards_Centroids <- rgeos::gCentroid(WardShape, byid = TRUE)
    Wards_Centroids  <- as.data.frame(Wards_Centroids)
    Wards_Centroids <- Wards_Centroids %>% cbind(c(8, 6, 7, 2, 1, 5, 3, 4))
    colnames(Wards_Centroids) <- c("x", "y", "Ward")
    return(Wards_Centroids)
  } else if(Ward_or_Precinct == "precinct") {
    PrecinctShape <- rgdal::readOGR("inst/extdata/Voting_Precinct__2012/Voting_Precinct__2012.shp") #import
    Precincts <- ggplot2::fortify(PrecinctShape)
    idlist <- Precincts %>% group_by(id) %>% summarise()
    Precinct_Centroids <- rgeos::gCentroid(PrecinctShape, byid = TRUE)
    Precinct_Centroids <- as.data.frame(Precinct_Centroids)
    Precinct_Centroids <- Precinct_Centroids %>%
      cbind(idlist$id)
    return(Precinct_Centroids)
  } else {
    warning("Please input either ward or precinct into function")
  }
}
library(dplyr)
Wards_Centroids <- get_centroid("ward")
Precinct_Centroids <- get_centroid("precinct")
usethis::use_data(Precincts, Precinct_Centroids, PrecinctShape,
                  Wards, WardShape, Wards_Centroids, internal = TRUE, overwrite = TRUE)
