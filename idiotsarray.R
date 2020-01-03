library(tidyr)
library(tidyverse)

uplim <- 10000
handlim <- 9
ia <- c("Idiot", "Two", "Three")
tot <- matrix(ncol = handlim)
test <- matrix(ncol = 3)

for(i in 1:uplim){
  draw <- deck[sample(nrow(deck), handlim, replace = FALSE), 1]
  tot <- rbind(tot, as.character(draw))
}
tot <- tot[-1, ]
tot

for(i in 1:uplim){
  test <- rbind(test, ia %in% tot[i, ])
}
test <- test[-1, ]
tot <- cbind(test, tot)
tot

colnames(tot) <- c("Idiot", "Two", "Three", "1", "2", "3", "4", "5", "6", "7", "8", "9")

filter(as.data.frame(tot), 
       Idiot == "TRUE" &
         Two == "TRUE" &
         Three == "TRUE") %>% 
  count()



