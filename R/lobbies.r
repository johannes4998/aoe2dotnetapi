#' lobbies
#'
#' This function gives you list of open Lobbies.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param game Default is aoe2de since the api is mostly used for that.
#' @keywords lobbies
#' @export
#' @examples
#' #List of open Lobbies
#' lobbies()

lobbies <- function(game="aoe2de") {
  jsonlite::fromJSON(
    paste0("https://aoe2.net/api/lobbies",
                     "?game=",game)
    )
}
