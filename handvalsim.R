library(tidyverse)
library(tidyr)
library(stats)

#Sampling the value of any given card from the deck
deck[ sample(nrow(deck), 1, replace = FALSE),3]

uplim <- 10000
handlim <- 9
tot <- data.frame()

  for(i in 1:uplim){
    trial <- i
    draw <- deck[ sample(nrow(deck), handlim, replace = FALSE), 3]
    val <- cumsum(draw)
    hand <- 1:handlim
    add <- cbind(trial, hand, draw, val)
    tot <- rbind(tot, add)
  }

means <- aggregate(val ~ as.character(hand), tot, mean)

ggplot(tot, aes(x = as.character(hand), y = val)) + 
  geom_violin() +
  geom_boxplot(width = 0.1,
               outlier.shape = NA) +
  stat_summary(fun.y = mean, 
               color = "darkred",
               geom = "point",
               shape = 18,
               size = 3) + 
  geom_text(data = means, aes(label = val, 
                              y = val + 20))


ggplot(tot, aes(x = val, fill = as.character(hand))) +
  geom_histogram(alpha = 0.5) +
  geom_vline(xintercept = 27, linetype = "dashed", color = "red") + 
  geom_vline(xintercept = -27, linetype = "dashed", color = "red") +
  labs(title = "Hand value likelihood by number of cards drawn in Sabacc",
       caption = "n = 10,000 hands",
       fill = "Number of cards drawn")


  