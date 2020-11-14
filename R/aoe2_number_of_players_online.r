#' aoe2_number_of_players_online
#'
#' This function gives you a list of player activity of the last 28 days for every 5min.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param game Default is aoe2de since the api is mostly used for that.
#' @keywords aoe2_number_of_players_online
#' @export
#' @examples
#' aoe2_number_of_players_online()

aoe2_number_of_players_online <- function(game="aoe2de") {

  jsonlite::fromJSON(
    paste0("https://aoe2.net/api/stats/players?",
                     "?game=",game)
    )

}
