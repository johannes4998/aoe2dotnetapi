#' aoe2_match
#'
#' This function gives you list of the match settings and match details.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param match_id Either match_id or uuid of the match. match_id is the same as the Lobby code. Function takes either value and changes the api call accordingly.
#' @param id_to_text Translates columns with number code to humanreadable text. Like civ ids to civ names.
#' @keywords aoe2_match
#' @export
#' @examples
#' #Hera vs Liereyy Champions League
#' aoe2_match(match_id=47634872)
#' #Hera vs Liereyy Champions League
#' aoe2_match(match_id="39b80e7a-e4df-974e-90f0-cf4fe2be6561")

aoe2_match <- function(match_id, id_to_text = TRUE) {

  id <- if (!grepl("[a-z]", match_id)) {
    paste0("&match_id=",match_id)
  } else{
    paste0("uuid=",match_id)
  }

  data <- jsonlite::fromJSON(
    paste0("https://aoe2.net/api/",
                     "match?",id)
                     )

  data[sapply(data, is.null)] <- NA
  match_data <- data.frame(matrix(unlist(data[1:40]), ncol=length(data[1:40]), byrow=T))
  colnames(match_data) <- names(data[1:40])

  match_data$players <- data[41]

  data <- match_data

  if (id_to_text == TRUE) {

    names_list <- names(lobby_translation)
    n_values <- length(names_list)

    for (i in 1:n_values) {
      data <- merge(lobby_translation[[i]], data, by.x ="id", by.y = names_list[i])

      colnames(data)[colnames(data)=="string"] <- names_list[i]
      data["id"] <- NULL
    }

    for (i in 1:nrow(data)) {
      data$players[[i]] <- merge(match_translation, data$players[[i]], by.x="id", by.y="civ")
      colnames(data$players[[i]])[2] <- "civ"
    }

    data
  }
  else {
    data
  }

}
