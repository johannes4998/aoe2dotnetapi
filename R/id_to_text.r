#' id_to_text
#'
#' This function translates the values to human readable. eg. map 1= arabia.
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param data aoe2.net output
#' @param id_to_text Translates columns with number code to humanreadable text. Like civ ids to civ names.
#' @keywords id_to_text
#' @export

id_to_text <- function(data=data, id_to_text=id_to_text) {
  if (id_to_text) {
    for (i in 1:nrow(data)) {
      if(data$opened[i]>=1611680400){
        col_names <- colnames(data)
        names_list <- names(aoe2dotnetapi::lobby_translation)
        n_values <- length(names_list)


        for (j in 1:n_values) {
          temp <-  merge(aoe2dotnetapi::lobby_translation[[j]], data[i,], by.x ="id", by.y = names_list[j])
          if(nrow(temp)!=0){
          colnames(temp)[colnames(temp)=="string"] <- names_list[j]
          temp["id"] <- NULL
          data[i,] <- temp[,col_names]
          }
        }

        col_names <- colnames(data$players[[1]])
        temp <- merge(aoe2dotnetapi::match_translation, data$players[[i]], by.x="id", by.y="civ")
        colnames(temp)[2] <- "civ"
        temp[,"id"] <- NULL

        if(nrow(temp)!=0){data$players[[i]] <- temp[,col_names]}
      }
      else {
        col_names <- colnames(data)
        names_list <- names(aoe2dotnetapi::lobby_translation_pre_lotw)
        n_values <- length(names_list)

        for (j in 1:n_values) {
          temp <-  merge(aoe2dotnetapi::lobby_translation_pre_lotw[[j]], data[i,], by.x ="id", by.y = names_list[j])
          if(nrow(temp)!=0){
          colnames(temp)[colnames(temp)=="string"] <- names_list[j]
          temp["id"] <- NULL
          data[i,] <- temp[,col_names]
          }
        }

        col_names <- colnames(data$players[[1]])
        temp <- merge(aoe2dotnetapi::match_translation_pre_lotw, data$players[[i]], by.x="id", by.y="civ")
        colnames(temp)[2] <- "civ"
        temp[,"id"] <- NULL

        if(nrow(temp)!=0){data$players[[i]] <- temp[,col_names]}
      }
    }
    return(data)
  } else return(data)
}
