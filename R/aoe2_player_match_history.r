#' aoe2_player_match_history
#'
#' This function gives you data.frame of the player rating if the player has been active in the last 28 days.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param player_id Either profile_id or 64 bit steam id. Function takes either value and changes the api call accordingly
#' @param start Match at which to start counting. Default = '0'
#' @param count Number of games to download. Max 1000
#' @param game Default is aoe2de since the api is mostly used for that.
#' @param id_to_text Translates columns with number code to humanreadable text. Like civ ids to civ names.
#' @keywords player_rating
#' @export
#' @examples
#' #Rating Match History of GL. TheViper with profile_id
#' player_match_history(player_id=196240, count=5)
#' #Rating Match History of GL. TheViper with steam_id
#' player_match_history(player_id=76561197984749679, count=5)

aoe2_player_match_history <- function(player_id, start=0, count=10, game="aoe2de", id_to_text = TRUE) {

  id = if (nchar(player_id)!=17) {
    paste0("&profile_id=",player_id)
  } else{
    paste0("&steam_id=",player_id)
  }

  count = ifelse(count<1000, count, 1000)

  data <- jsonlite::fromJSON(
    paste0("https://aoe2.net/api/player/matches",
           "?game=",game,
           id,
           "&start=",start,
           "&count=",count)
  )

  id_to_text(data=data,id_to_text=id_to_text)
}
