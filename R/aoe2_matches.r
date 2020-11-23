#' aoe2_matches
#'
#' This function gives you data.frame of the player rating if the player has been active in the last 28 days.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param date Date either as unix epoch or in this format "2013-09-16 2:13:46 EST"
#' @param count Number of games to download.
#' @param game Default is aoe2de since the api is mostly used for that.
#' @param id_to_text Translates columns with number code to humanreadable text. Like civ ids to civ names.
#' @keywords matches
#' @export
#' @examples
#' aoe2_matches(date="2020-11-09 12:49:39 UTC", count=5)
#' aoe2_matches(date="1596775000", count=5) # recommended way

aoe2_matches <- function(date, count=10, game="aoe2de", id_to_text = TRUE) {

  date1 <- if (grepl("-",date)) {
    paste0("&since=",as.numeric(as.POSIXct(date)))
  } else{
    paste0("&since=",date)
  }

  data <- jsonlite::fromJSON(
    paste0("https://aoe2.net/api/matches",
                     "?game=",game,
                     "&count=",count,
                     date1)
    )

  if (id_to_text == TRUE) {

    names_list <- names(lobby_translation)
    n_values <- length(names_list)

    for (i in 1:n_values) {
      data <- merge(lobby_translation[[i]], data, by.x ="id", by.y = names_list[i])

      colnames(data)[colnames(data)=="string"] <- names_list[i]
      data["id"] <- NULL
    }

    for (i in 1:nrow(data)) {
      data$players[[i]] <- merge(match_translation, data$players[i], by.x="id", by.y="civ")
      colnames(data$players[[i]])[2] <- "civ"
    }

    data
  }
  else {
    data
  }
}
