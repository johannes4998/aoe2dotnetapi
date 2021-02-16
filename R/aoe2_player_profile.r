#' aoe2_player_profile
#'
#' This function gives you data.frame of the player rating if the player has been active in the last 28 days.
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

aoe2_player_profile <- function(player_id, game="aoe2de") {

  id <- if (nchar(player_id)!=17) {
    paste0("&profile_id=",player_id)
  } else{
    paste0("&steam_id=",player_id)
  }

  data <- jsonlite::fromJSON(
    paste0("https://aoe2.net/api/player/lastmatch",
           "?game=",game,
           id)
  )

  profile <- data.frame(profile_id=NA, steam_id=NA, name=NA, clan=NA, country=NA,stringsAsFactors = F)

  profile$profile_id <- ifelse(is.null(data2[[1]]),NA,data2[[1]])
  profile$steam_id<- ifelse(is.null(data2[[2]]),NA,data2[[2]])
  profile$name <- ifelse(is.null(data2[[3]]),NA,data2[[3]])
  profile$clan <- ifelse(is.null(data2[["clan"]]),NA,data2[["clan"]])
  profile$country <- ifelse(is.null(data2[["country"]]),NA,data2[["country"]])

  return(profile)
}
