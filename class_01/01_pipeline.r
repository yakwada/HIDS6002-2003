
# Raw R
chicks <- ChickWeight
chicks <- chicks[nrow(chicks)-10:nrow(chicks), ]
chicks <- chicks[chicks$weight <= 300, ]
write.csv(chicks, "class_01/chickweights.csv")


# Tidyverse
library(dplyr)
ChickWeight %>%
  tail(nrow(ChickWeight) - 10) %>%
  filter(weight < 300) %>%
  write.csv("class_01/chickweights.csv")
