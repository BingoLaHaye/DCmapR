#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'
#--------------------------------------------------------------
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Welcome to DCmapR")
}

#' Get the dataframe or shapefile of precincts in DC
#' @rdname get_Precinct
#' @param dataframe Put TRUE for a dataframe, FALSE for a shapeFile
#' @examples
#' bingo <- get_Precinct(dataframe = TRUE)
#' bongo <- get_Precinct(dataframe = FALSE)
#' @export
get_Precinct <- function(dataframe = TRUE) {
  if(dataframe == TRUE) {
    return(Precincts)
  } else if(dataframe == FALSE) {
    return(PrecinctShape)
  } else if(dataframe != TRUE | FALSE) {
    stop("Only select if dataframe is true or false")
  }
}
