library(tidyverse)
library(ggrepel)
df <- read.csv("WWCGroup.csv")
df1 <- read_csv("WWCKO.csv")
p1 <- ggplot(df, aes(ID, ATM)) +
  geom_point(colour ="firebrick", size=1) +
  annotate("text", x=20, y=70, label = "Median = 55 Minutes Ball in Play") +
  labs(title = "Women's World Cup 2019", subtitle = "Group Stage (36 Games)",
       x= "Game Number", y = "Actual Ball in Play Time in Minutes") +
  ylim= c(40,80) +
  theme_minimal()
p1
p2 <- ggplot(df1, aes(ID, ATM)) +
  geom_point(colour ="darkgreen", size=1) +
  annotate("text", x=44, y=75, label = "Median = 54 Minutes 30 Seconds Ball in Play") +
  labs(title = "Women's World Cup 2019", subtitle = "Knockout Stage (16 Games)",
       x= "Game Number", y = "Actual Ball in Play Time in Minutes") +
  xlim(37,52) +
  ylim(40, 80) +
  theme_minimal()
p2
# https://twitter.com/sharon000/status/1151163792816058368
df3 <- filter(df, between(ATM, 56,70))
df4 <- filter(df1, between(ATM, 55,80))
p3 <- ggplot(df3, aes(ID, ATM)) +
  geom_point(colour ="black", size=1) +
  annotate("text", x=15, y=75, label = "Median = 55 Minutes Ball in Play") +
  labs(title = "Women's World Cup 2019", subtitle = "Group Stage (13 Games Above Median)",
       x= "Game Number", y = "Actual Ball in Play Time in Minutes") +
  geom_hline(yintercept = 55) +
  xlim(0,36) +
  ylim(40, 80) +
  theme_minimal()
p3
p4 <- ggplot(df4, aes(ID, ATM)) +
  geom_point(colour ="darkblue", size=1) +
  annotate("text", x=44, y=78, label = "Median = 54 Minutes 30 Seconds Ball in Play") +
  labs(title = "Women's World Cup 2019", subtitle = "Knockout Stage (8 Games Above Median)",
       x= "Game Number", y = "Actual Ball in Play Time in Minutes") +
  geom_hline(yintercept = 54.5) +
  xlim(37,52) +
  ylim(40, 80) +
  theme_minimal()
p4
p5 <- ggplot(df4, aes(ID, ATM, label = Game)) +
  geom_point(colour ="darkblue", size=1) +
  geom_label_repel() +
  annotate("text", x=44, y=78, label = "Median = 54 Minutes 30 Seconds Ball in Play") +
  labs(title = "Women's World Cup 2019", subtitle = "Knockout Stage (8 Games Above Median)",
       x= "Game Number", y = "Actual Ball in Play Time in Minutes") +
  xlim(37,52) +
  ylim(40, 80) +
  theme_minimal()
p5
p6 <- ggplot(df3, aes(ID, ATM, label = Referee)) +
  geom_point(colour ="darkblue", size=1) +
  geom_label_repel() +
  annotate("text", x= 20, y=78, label = "Median = 55 Minutes Ball in Play") +
  labs(title = "Women's World Cup 2019", subtitle = "Group Stage (Referees in 13 Games Above Median)",
       x= "Game Number", y = "Actual Ball in Play Time in Minutes") +
  ylim(40, 80) +
  theme_minimal()
p6