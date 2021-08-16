#' aoe2_online
#'
#' This function checks if aoe2.net is available.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @keywords aoe2_online
#' @export
#' @examples
#' aoe2_online()
#'

aoe2_online <- function() {
  url <- "https://aoe2.net/"
  x <- httr::GET(url)$status_code

  if (x==200L){
    return(T)
  } else {
    return(F)
  }

}

