#' player_last_match
#'
#' This function gives you data.frame of the player rating if the player has been active in the last 28 days.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param player_id Either profile_id or 64 bit steam id. Function takes either value and changes the api call accordingly
#' @param game Default is aoe2de since the api is mostly used for that.
#' @keywords player_rating
#' @export
#' @examples
#' #Last Match of GL. TheViper with profile_id
#' player_last_match(player_id=196240)
#' #Last Match of GL. TheViper with steam_id
#' player_last_match(player_id=76561197984749679)

player_last_match <- function(player_id, game="aoe2de") {

  id <- if (nchar(player_id)!=17) {
    paste0("&profile_id=",player_id)
  } else{
    paste0("&steam_id=",player_id)
  }

  jsonlite::fromJSON(
    paste0("https://aoe2.net/api/player/lastmatch",
                     "?game=",game,
                     id)
    )
}
