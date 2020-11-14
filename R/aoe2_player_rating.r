#' aoe2_player_rating
#'
#' This function gives you data.frame of the player rating if the player has been active in the last 28 days.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param player_id Either profile_id or 64 bit steam id. Function takes either value and changes the api call accordingly
#' @param leaderboard_id Default is 3 for 1v1 Random Map, 4 is Team Random Map.
#' @param game Default is aoe2de since the api is mostly used for that.
#' @keywords aoe2_player_rating
#' @export
#' @examples
#' #Rating of GL. TheViper with profile_id
#' aoe2_player_rating(player_id=196240)
#' #Rating of GL. TheViper with steam_id
#' aoe2_player_rating(player_id=76561197984749679)

aoe2_player_rating <- function(player_id, leaderboard_id=3, game="aoe2de") {

  id <- if (nchar(player_id)!=17) {
    paste0("&profile_id=",player_id)
  } else{
    paste0("&steam_id=",player_id)
  }

  jsonlite::fromJSON(
    paste0("https://aoe2.net/api/leaderboard",
                     "?game=",game,
                     "&leaderboard_id=",leaderboard_id,
                     id)
    )$leaderboard
}
