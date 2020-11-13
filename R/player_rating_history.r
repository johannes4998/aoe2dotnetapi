#' player_rating_history
#'
#' This function gives you data.frame of the player rating if the player has been active in the last 28 days.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param player_id Either profile_id or 64 bit steam id. Function takes either value and changes the api call accordingly.
#' @param start Match at which to start counting. Default = '0'
#' @param count Number of games to download. Max 1000.
#' @param leaderboard_id Default is 3 for 1v1 Random Map, 4 is Team Random Map.
#' @param game Default is aoe2de since the api is mostly used for that.
#' @keywords player_rating_history
#' @export
#' @examples
#' #Rating History of GL. TheViper with profile_id
#' player_rating_history(player_id=196240, count=5)
#' #Rating History of GL. TheViper with steam_id
#' player_rating_history(player_id=76561197984749679, count=5)

player_rating_history <- function(player_id, start=0, count=10, leaderboard_id=3, game="aoe2de") {

  id = if (nchar(player_id)!=17) {
    paste0("&profile_id=",player_id)
  } else{
    paste0("&steam_id=",player_id)
  }

  count = ifelse(count<1000, count, 1000)

  jsonlite::fromJSON(
    paste0("https://aoe2.net/api/player/ratinghistory",
                     "?game=",game,
                     "&leaderboard_id=",leaderboard_id,
                     id,
                     "&start=",start,
                     "&count=",count)
    )
}
