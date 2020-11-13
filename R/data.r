#' All importent keys to translate aoe2api stuff to humanreadable code.
#'
#' @format A list containing stuff
#' \describe{
#' Used internaly to translate Ids to names of maps, civs, play_modes etc.
#' }
#' @source \url{https://aoe2.net/api/strings?game=aoe2de&language=en}
#'
"lobby_translation"


#' All civs in aoe2de.
#'
#'
#' @format A list containing stuff
#' \describe{
#' Used internaly to translate Ids to names of maps, civs, play_modes etc.
#' }
#' @source \url{https://aoe2.net/api/strings?game=aoe2de&language=en}
#'
"match_translation"


# # #Code to generate the Data
# data <- jsonlite::fromJSON("https://aoe2.net/api/strings?game=aoe2de&language=en")
#
# "match_translation"
#
# match_translation <- data$civ
#
# "lobby_translation"
# data$starting_age <- data$age
# data$ending_age <- data$age
# data$leaderboard_id <- data$leaderboard
# data$leaderboard <- NULL
# data$age <- NULL
# data$language <- NULL
# data$civ <- NULL
#
# lobby_translation <- data
#
# usethis::use_data(match_translation, lobby_translation, overwrite = T, internal = T)
