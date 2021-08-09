#' aoe2_match_rec_search
#'
#' This function checks if a game has recording available and returns an recording
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @keywords aoe2_match_rec_search
#' @export
#' @examples
#' aoe2_match_rec_search()
#'

aoe2_match_rec_search <- function(match_id) {
  game <-  aoe2dotnetapi::aoe2_match(match_id, id_to_text = F)
  game_link <- paste0("https://aoe.ms/replay/?gameId=",match_id,
                      "&profileId=",game$players$players$profile_id)
  game_link <- game_link[sapply(game_link, function (x) !httr::http_error(x))][1]
  if(!is.na(game_link)){
    return(game_link)
  } else
    stop("No recording available!", " Match not found.", return(NA))
}

