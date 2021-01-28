.onAttach <- function(libname, pkgname) {

  packageStartupMessage("Loading current strings from aoe2.net for translation functions.")

  tryCatch({
    data <- jsonlite::fromJSON("https://aoe2.net/api/strings?game=aoe2de&language=en")

    .pkgenv$match_translation <- data$civ

    # "lobby_translation"
    data$starting_age <- data$age
    data$ending_age <- data$age
    data$leaderboard_id <- data$leaderboard
    data$leaderboard <- NULL
    data$age <- NULL
    data$language <- NULL
    data$civ <- NULL


    .pkgenv$lobby_translation <- data
    .pkgenv$id_to_text <- T
  },
  error = function(e){
    packageStartupMessage("Downloading string data failed!")
    packageStartupMessage("Error Message:")
    packageStartupMessage(e)


    .pkgenv$id_to_text = F
  })


}
