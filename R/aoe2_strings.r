#' aoe2_strings
#'
#' This function gives you a list with the human readable values to the data downloaded by this package.
#' Eg civs 0='Aztecs', 1='Berbers', ...
#' Eg age 0='standard', 1='Dark Age'
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param language Default is en. Other values are en, de, el, es, es-MX, fr, hi, it, ja, ko, ms, nl, pt, ru, tr, vi, zh, zh-TW
#' @keywords aoe2_strings
#' @export
#' @examples
#' #
#' aoe2_strings(language="de")
#' aoe2_strings(language="lt") #Lithuanian is not supported

aoe2_strings <- function(language= "en") {

  if (language %in% c("en", "de", "el", "es", "es-MX", "fr", "hi", "it", "ja", "ko", "ms", "nl", "pt", "ru", "tr", "vi", "zh", "zh-TW")) {
    jsonlite::fromJSON(
      paste0("https://aoe2.net/api/strings?",
                       "game=aoe2de",
                       "&language=",language)
      )
  } else {
    cat('Sorry',language,'is not supported. Please try c("en", "de", "el", "es", "es-MX", "fr", "hi", "it", "ja", "ko", "ms", "nl", "pt", "ru", "tr", "vi", "zh", "zh-TW")')
  }

}
