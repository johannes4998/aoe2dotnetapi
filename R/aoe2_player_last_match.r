#' aoe2_player_last_match
#'
#' This function gives you data.frame of the player rating if the player has been active in the last 28 days.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param player_id Either profile_id or 64 bit steam id. Function takes either value and changes the api call accordingly
#' @param game Default is aoe2de since the api is mostly used for that.
#' @param id_to_text Translates columns with number code to humanreadable text. Like civ ids to civ names.
#' @keywords aoe2_player_rating
#' @export
#' @examples
#' #Last Match of GL. TheViper with profile_id
#' aoe2_player_last_match(player_id=196240)
#' #Last Match of GL. TheViper with steam_id
#' aoe2_player_last_match(player_id=76561197984749679)

aoe2_player_last_match <- function(player_id, game="aoe2de", id_to_text = .pkgenv$id_to_text) {

  id <- if (nchar(player_id)!=17) {
    paste0("&profile_id=",player_id)
  } else{
    paste0("&steam_id=",player_id)
  }

  data <- jsonlite::fromJSON(
    paste0("https://aoe2.net/api/player/lastmatch",
                     "?game=",game,
                     id)
    )$last_match

  data[sapply(data, is.null)] <- NA
  match_data <- data.frame(matrix(unlist(data[1:40]), ncol=length(data[1:40]), byrow=T))
  colnames(match_data) <- names(data[1:40])

  match_data$players <- data[41]

  data <- match_data

  id_to_text(data=data,id_to_text=id_to_text)
}
