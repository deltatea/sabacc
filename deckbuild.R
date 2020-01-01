
#deckbuilding

suits1 <- c("Sabers", "Flasks", "Coins", "Staves")
cards1 <- c("One", "Two", "Three", "Four", "Five", "Six",
           "Seven", "Eight", "Nine", "Ten", "Eleven",
           "Commander", "Mistress", "Master", "Ace")
deck1 <- data.frame(suits1 = character(0), cards1 = character(0))

  for (i in suits1){
    for (j in cards1){
      deck1 <- rbind.data.frame(deck1, cbind.data.frame(j, i))
    }
  }

val1 <- rep(1:15, 4)
deck1 <- cbind(deck1, val1)
colnames(deck1) <- c("card", "suit", "val")

suits2 <- c("Face", "Face")
cards2 <- c("The Star", "The Evil One", "Moderation", "Demise",
            "Balance", "Endurance", "Queen of Air and Darkness",
            "Idiot")
deck2 <- data.frame(suits2 = character(0), cards2 = character(0))

  for (i in suits2){
    for (j in cards2){
      deck2 <- rbind.data.frame(deck2, cbind.data.frame(j, i))
    }
  }

val2 <- rep(c(-17, -15, -14, -13, -11, -8, -2, 0), 2)
deck2 <- cbind(deck2, val2)
colnames(deck2) <- c("card", "suit", "val")

deck <- rbind(deck1, deck2)

remove(cards1, cards2, i, j, suits1, suits2, val1, val2, deck1, deck2)
