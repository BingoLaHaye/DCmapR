#' get the Ward shape or Dataframe
#' @rdname get_Ward
#' @param dataframe Either TRUE or FALSE
#' @examples
#' get_Ward(dataframe = TRUE)
#' get_Ward(dataframe = FALSE)
#' @export
get_Ward <- function(dataframe = TRUE) {
  if (dataframe == TRUE) {
    return(Wards)
  } else if(dataframe == FALSE) {
    return(WardShape)
  } else if(dataframe != TRUE | FALSE) {
    stop("Only select if dataframe is true or false")
  }
}
