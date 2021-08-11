# load("data/sysdata.rda")

# lobby_translation_pre_lotw <- lobby_translation
# match_translation_pre_lotw <- match_translation


# data <- jsonlite::fromJSON("https://aoe2.net/api/strings?game=aoe2de&language=en")

# match_translation <- data$civ

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
# match_translation_dawnOfDukes <- data.frame(id=0:38,string=sort(c(data$civ$string, "Poles", "Bohemians")))
#
# rm(data)
#
# save(lobby_translation,lobby_translation_pre_lotw, match_translation, match_translation_pre_lotw, match_translation_dawnOfDukes, file = "data/sysdata.rda")
#
# rm(list = ls())
