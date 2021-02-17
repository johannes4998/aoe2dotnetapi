length(x[["players"]][[1]])


test <- as.data.frame(matrix(nrow = length(x[["players"]])*2, ncol=24),stringsAsFactors=F)
s <- seq(1,length(x[["players"]])*2, 2)
s2 <- seq(2,length(x[["players"]])*2, 2)
i=1




for (i in 1:length(x[["players"]])) {
  test[c(s[i], s2[i]),1:18] <- matrix(unlist(x[i,][["players"]]),ncol=18, byrow = F)
  test[c(s[i], s2[i]), 19:24] <- x[i,c("match_id", "version", "map_type", "server", "started", "finished")]
}


test[c(1,2),] <- matrix(unlist(x[["players"]][[1]]),ncol=18, byrow = F)


