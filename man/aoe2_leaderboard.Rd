% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aoe2_leaderboard.r
\name{aoe2_leaderboard}
\alias{aoe2_leaderboard}
\title{aoe2_leaderboard}
\usage{
aoe2_leaderboard(start = 1, count = 10000, game = "aoe2de", leaderboard_id = 3)
}
\arguments{
\item{start}{Default is 1. Rank at which to start counting down.}

\item{count}{Default is 10'000. Number of players to get from start. Max is 10'000.}

\item{game}{Default is aoe2de since the api is mostly used for that.}

\item{leaderboard_id}{Default is 3 for 1v1 Random Map, 4 is Team Random Map.}
}
\description{
This function gives you a list object with the current leaderboard standing.
The list contains $total, $leaderboard_id, $start, $count and most important $leaderboard
}
\details{
More Information about aoe2.net api at https://aoe2.net/#api
}
\examples{
#Top5
aoe2_leaderboard(start=1, count=5)

}
\keyword{aoe2_leaderboard}
