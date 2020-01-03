

truthtable <- matrix(c(0), nrow=1, ncol=9)
truthtable[1, 3] <- 2/uplim
truthtable[1, 4] <- 15/uplim
truthtable[1, 5] <- 40/uplim
truthtable[1, 6] <- 92/uplim
truthtable[1, 7] <- 136/uplim
truthtable[1, 8] <- 207/uplim
truthtable[1, 9] <- 288/uplim

colnames(truthtable) <- c("One", "Two", "Three", "Four",
                          "Five", "Six", "Seven", "Eight",
                          "Nine")



ggplot(tot, aes(x = val, fill = as.character(hand))) +
  geom_point(data = as.data.frame(truthtable), aes=(x = [0, ])) +
geom_density(alpha = 0.2) +
  geom_vline(xintercept = 23, linetype = "dashed", color = "red") + 
  geom_vline(xintercept = -23, linetype = "dashed", color = "red") +
  geom_text(aes(x = 23, label = "Val = 23", y = 0.05), color = "red", 
            angle = 90, vjust = 1.2) +
  geom_text(aes(x = -23, label = "Val = -23", y = 0.05), color = "red", 
            angle = 90, vjust = 1.2) +
  labs(title = "Hand value likelihood by number of cards drawn in Sabacc",
       caption = "n = 10,000 hands",
       fill = "Cards drawn")


             