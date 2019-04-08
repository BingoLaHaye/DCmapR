#' Get the centroids of preciencts or wards
#' @rdname get_Centroid
#' @description Get the centroids of either the precincts or wards of DC
#' @param Ward Input True for ward list
#' @param Precinct Input True for precinct list
#' @examples
#' precinctCentroids <- get_centroid(Ward = TRUE)
#' wardCentroids <- get_centroid(Precinct = TRUE)
#' @export
get_centroid <- function(Ward = FALSE, Precinct = FALSE){ # Make centroids for easy labels
  if(Ward == TRUE & Precinct == FALSE){
    return(Wards_Centroids)
  } else if(Precinct == TRUE & Ward == FALSE) {
    return(Precinct_Centroids)
  } else {
    stop("Please add a TRUE to either Ward or Precinct")
  }
}
