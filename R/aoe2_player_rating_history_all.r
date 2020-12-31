#' aoe2_player_rating_history_all
#'
#' This function gives you data.frame of the player rating if the player has been active in the last 28 days.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param player_id Either profile_id or 64 bit steam id. Function takes either value and changes the api call accordingly.
#' @param leaderboard_id Default is 3 for 1v1 Random Map, 4 is Team Random Map.
#' @param game Default is aoe2de since the api is mostly used for that.
#' @keywords aoe2_player_rating_history_all
#' @export
#' @examples
#' #Rating History of GL. TheViper with profile_id
#' aoe2_player_rating_history(player_id=196240, count=5)
#' #Rating History of GL. TheViper with steam_id
#' aoe2_player_rating_history(player_id=76561197984749679, count=5)

aoe2_player_rating_history_all <- function(player_id, game="aoe2de", leaderboard_id = 3) {

  start=0
  count=1000
  player_id = player_id
  game=game
  leaderboard_id = leaderboard_id
  data = NULL


  repeat{
    data_part <-  aoe2dotnetapi::aoe2_player_rating_history(player_id = player_id, start = start, count = count, game="aoe2de", leaderboard_id = 3)
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
