#' id_to_text
#'
#' This function translates the values to human readable. eg. map 1= arabia.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param data aoe2.net output
#' @param id_to_text Translates columns with number code to humanreadable text. Like civ ids to civ names.
#' @keywords id_to_text

id_to_text <- function(data=data, id_to_text=id_to_text) {
  if(data$opened >= 1611680400 & (id_to_text == TRUE)) {
    col_names <- colnames(data)
    names_list <- names(lobby_translation)
    n_values <- length(names_list)

    for (i in 1:n_values) {
      data <- merge(lobby_translation[[i]], data, by.x ="id", by.y = names_list[i])

      colnames(data)[colnames(data)=="string"] <- names_list[i]
      data["id"] <- NULL
      data <- data[,col_names]
    }

    col_names <- colnames(data$players[[1]])
    for (i in 1:nrow(data)) {
      data$players[[i]] <- merge(match_translation, data$players[[i]], by.x="id", by.y="civ")
      colnames(data$players[[i]])[2] <- "civ"
      data$players[[1]][,"id"] <- NULL
      data$players[[1]] <- data$players[[1]][,col_names]
    }

    data
  } else if(data$opened < 1611680400 & (id_to_text == TRUE)) {
    col_names <- colnames(data)
    names_list <- names(lobby_translation_pre_lotw)
    n_values <- length(names_list)

    for (i in 1:n_values) {
      data <- merge(lobby_translation_pre_lotw[[i]], data, by.x ="id", by.y = names_list[i])

      colnames(data)[colnames(data)=="string"] <- names_list[i]
      data["id"] <- NULL
      data <- data[,col_names]
    }

    col_names <- colnames(data$players[[1]])
    for (i in 1:nrow(data)) {
      data$players[[i]] <- merge(match_translation_pre_lotw, data$players[[i]], by.x="id", by.y="civ")
      colnames(data$players[[i]])[2] <- "civ"
      data$players[[1]][,"id"] <- NULL
      data$players[[1]] <- data$players[[1]][,col_names]
    }

    data
  } else {
    data
  }
}

#1611680400 timestamp new civs
