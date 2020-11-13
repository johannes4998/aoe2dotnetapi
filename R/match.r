#' match
#'
#' This function gives you list of the match settings and match details.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param match_id Either match_id or uuid of the match. match_id is the same as the Lobby code. Function takes either value and changes the api call accordingly.
#' @keywords match
#' @export
#' @examples
#' #Hera vs Liereyy Champions League
#' match(match_id=47634872)
#' #Hera vs Liereyy Champions League
#' match(match_id="39b80e7a-e4df-974e-90f0-cf4fe2be6561")

match <- function(match_id) {

  id <- if (!grepl("[a-z]", match_id)) {
    paste0("&match_id=",match_id)
  } else{
    paste0("uuid=",match_id)
  }

  jsonlite::fromJSON(
    paste0("https://aoe2.net/api/",
                     "match?",id)
                     )

}
