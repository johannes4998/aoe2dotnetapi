# load("data/sysdata.rda")
#
# lobby_translation_pre_lotw <- lobby_translation
# match_translation_pre_lotw <- match_translation
#
#
# data <- jsonlite::fromJSON("https://aoe2.net/api/strings?game=aoe2de&language=en")
#
# match_translation <- data$civ
#
# # "lobby_translation"
# data$starting_age <- data$age
# data$ending_age <- data$age
# data$leaderboard_id <- data$leaderboard
# data$leaderboard <- NULL
# data$age <- NULL
# data$language <- NULL
# data$civ <- NULL
#
#
# lobby_translation <- data
#
# rm(data)
#
# save(lobby_translation,lobby_translation_pre_lotw, match_translation, match_translation_pre_lotw, file = "data/sysdata.rda")
#
# rm(list = ls())
