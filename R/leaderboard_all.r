#' leaderboard_all
#'
#' This function gives you a list object with the current leaderboard standing.
#' The list contains $total, $leaderboard_id, $start, $count and most important $leaderboard
#'
#' More Information about aoe2.net api at https://aoe2.net/#api
#' @param game Default is aoe2de since the api is mostly used for that.
#' @param leaderboard_id Default is 3 for 1v1 Random Map, 4 is Team Random Map.
#' @keywords leaderboard_all
#' @export
#' @examples
#' #Top5
#' leaderboard_all()
#'

leaderboard_all <- function(game="aoe2de", leaderboard_id=3) {

  start=1
  count=10000

  data <- leaderboard(start = start, count = count, game="aoe2de", leaderboard_id=3)$leaderboard

  data_part <- data

  while (nrow(data_part) == count) {
    data_part <-  leaderboard(start = start, count = count, game="aoe2de", leaderboard_id=3)$leaderboard
    data <- rbind(data, data_part)
    start <- start + count
  }
  data
}
