#' aoe2_player_profile_all
#'
#' This function gives you all available ranked player data. (The goal is it to have a function which creates a player object on which it would be easier to perfom regular summary funcitons)
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param player_id Either profile_id or 64 bit steam id. Function takes either value and changes the api call accordingly
#' @param game Default is aoe2de since the api is mostly used for that.
#' @keywords aoe2_player_profile
#' @export
#' @examples
#' #Profile of GL. TheViper with profile_id
#' aoe2_player_profile(player_id=196240)
#' #Profile of GL. TheViper with steam_id
#' aoe2_player_profile(player_id=76561197984749679)

aoe2_player_profile_all <- function(player_id, game="aoe2de") {
  data <- list("Player"=NA,
               "Rating"=list("Random_Map_Rating"=NA,"Team_Random_Map_Rating"=NA),
               "Matches"=list("Random_Map_Matches"=NA,"Team_Random_Map_Matches"=NA))

  data[["Player"]] <- aoe2_player_profile(player_id)
  data[["Rating"]][["Random_Map_Rating"]] <- aoe2_player_rating_history_all(player_id, leaderboard_id = 3)
  data[["Rating"]][["Team_Random_Map_Rating"]] <- aoe2_player_rating_history_all(player_id, leaderboard_id = 4)

  matches <- aoe2_player_match_history_all(player_id, id_to_text = FALSE)
  data[["Matches"]][["Random_Map_Matches"]] <- matches[matches$leaderboard_id=="1v1 Random Map",]
  data[["Matches"]][["Team_Random_Map_Matches"]] <- matches[matches$leaderboard_id=="Team Random Map",]
  return(data)
}
