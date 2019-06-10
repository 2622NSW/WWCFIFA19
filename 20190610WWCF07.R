library(ggplot2)
library(ggrepel)
p1 <- ggplot(df, aes(ATM, GTM, label = Country)) +
  geom_point(size = 3, colour = "firebrick") +
  geom_label_repel(size=3) +
  labs(title = "Women's World Cup 2019: Referee Country of Origin", subtitle = "Ball in Play (Minutes)",
       x = "Actual Time in Minutes (FIFA)", y = "Total Game Time in Minutes (FIFA)") +
  theme_minimal()
p1
p2 <- ggplot(df, aes(Hum, ATM, label = Country)) +
  geom_point(size = 3, colour = "black") +
  geom_label_repel(size=3) +
  labs(title = "Women's World Cup 2019: Referee Country of Origin", 
       subtitle = "Humidity and Ball in Play (Minutes)",
       x = "Humidity (as %)", y = "Actual Time in Minutes (FIFA)") +
  theme_minimal()
p2
p3 <- ggplot(df, aes(Fouls, ATM, label = Game)) +
  geom_point(size = 3, colour = "black") +
  geom_label_repel(size=3) +
  labs(title = "Women's World Cup 2019", 
       subtitle = "Fouls and Actual Time in Play",
       x = "Fouls (Game Total)", y = "Actual Time in Minutes (FIFA)") +
  theme_minimal()
p3
p4 <- ggplot(df, aes(Temp, ATM, label = Game)) +
  geom_point(size = 3, colour = "black") +
  geom_label_repel(size=3) +
  labs(title = "Women's World Cup 2019", 
       subtitle = "Temperature and Actual Time in Play",
       x = "Temperature (FIFA)", y = "Actual Time in Minutes (FIFA)") +
  theme_minimal()
p4
