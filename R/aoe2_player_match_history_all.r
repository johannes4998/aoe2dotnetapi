#' aoe2_player_match_history_all
#'
#' This function gives you data.frame of the player rating if the player has been active in the last 28 days.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param player_id Either profile_id or 64 bit steam id. Function takes either value and changes the api call accordingly
#' @param game Default is aoe2de since the api is mostly used for that.
#' @param id_to_text Translates columns with number code to humanreadable text. Like civ ids to civ names.
#' @keywords aoe2_player_match_history_all
#' @export
#' @examples
#' #Rating Match History of GL. TheViper with profile_id
#' aoe2_player_match_history_all(player_id=196240)
#' #Rating Match History of GL. TheViper with steam_id
#' aoe2_player_match_history_all(player_id="76561197984749679")


aoe2_player_match_history_all <- function(player_id, game="aoe2de", id_to_text = id_to_text) {

  start=0
  count=1000
  player_id = player_id
  id_to_text = id_to_text
  data = NULL

  repeat{
    data_part <-  aoe2dotnetapi::aoe2_player_match_history(player_id = player_id, start = start, count = count, id_to_text = id_to_text)
    data <- rbind(data, data_part)

    start <- start + count

    if(nrow(data_part) < count){
      print(paste(nrow(data), "Matches downloaded. Download finished."))
      return(data)
      break
    }

    print(paste(nrow(data), "Matches downloaded. At least one more round."))
  }
}
