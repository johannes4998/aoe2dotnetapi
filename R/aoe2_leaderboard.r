#' aoe2_leaderboard
#'
#' This function gives you a list object with the current leaderboard standing.
#' The list contains $total, $leaderboard_id, $start, $count and most important $leaderboard
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param start Default is 1. Rank at which to start counting down.
#' @param count Default is 10'000. Number of players to get from start. Max is 10'000.
#' @param game Default is aoe2de since the api is mostly used for that.
#' @param leaderboard_id Default is 3 for 1v1 Random Map, 4 is Team Random Map.
#' @keywords aoe2_leaderboard
#' @export
#' @examples
#' #Top5
#' aoe2_leaderboard(start=1, count=5)
#'

aoe2_leaderboard <- function(start=1, count=10000, game="aoe2de", leaderboard_id=3) {

  count = ifelse(count<10000, count, 10000)

  jsonlite::fromJSON(
    paste0("https://aoe2.net/api/leaderboard?game=",game,
                            "&leaderboard_id=",leaderboard_id,
                            "&start=",start,
                            "&count=",count)
    )
}
