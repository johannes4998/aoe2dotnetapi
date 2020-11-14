
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aoe2deapi for aoe2.net

<!-- badges: start -->

<!-- badges: end -->

The goal of aoe2deapi is to provide an easy interface to the aoe2.net
website. Aoe2.net has a lot of player data for Age of Empires 2:
Defenitive Edition. Through its API its easy to get the data needed for
player and game analysis.

`leaderboard()` gives you the current leaderboard standings of aoe2de.
`player_match_history(profile_id="XXXXXXXX", start=0, count=10,
id_to_text=F)`gives you the 10 most recent games of this player.
`player_match_history(profile_id="XXXXXXXX", start=0, count=10,
id_to_text=T)` gives you the 10 most recent games and translates
varibales like civ into humanreadable names

# First package

This is my first attempt at a package

``` r
devtools::install_github("johannes4998/aoe2dotnetapi")
library(aoe2dotnetapi)
```

# Credits

Data from <https://aoe2.net/#api>

Age of Empires II: HD© and Age of Empires II: Definitive Edition©
Microsoft Corporation. aoe2deapi-package was created under Microsoft’s
Game Content Usage Rules Game Content Usage Rules using assets from Age
of Empires II: Definitive Edition, and it is not endorsed by or
affiliated with Microsoft.
