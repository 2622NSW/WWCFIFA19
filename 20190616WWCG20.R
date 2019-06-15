library(ggplot2)
library(ggrepel)
df <- read.csv("G20.csv")
median(df$Height)
df1 <- subset(df, Height > 150 & Height < 174.5)
df2 <- subset(df, Height > 175 & Height < 200)
p1 <- ggplot(df1, aes(ID, Height, label = Name)) +
  geom_point(size = 2, colour = "firebrick") +
  geom_label_repel(size=3) +
  scale_y_discrete(limits = c(160,165,170,175)) +
  labs(title = "Women's World Cup 2019", 
       subtitle = "Goalkeepers in Twenty Group Games Played",
       x = "Game", y = "Height (cms)") +
  theme_minimal()
p1
p2 <- ggplot(df2, aes(ID, Height, label = Name)) +
  geom_point(size = 2, colour = "blue") +
  geom_label_repel(size=3) +
  scale_y_discrete(limits = c(170,175,180,185)) +
  labs(title = "Women's World Cup 2019", 
       subtitle = "Goalkeepers in Twenty Group Games Played",
       x = "Game", y = "Height (cms)") +
  theme_minimal()
p2
p3 <- ggplot(df1, aes(Country, Height, label = Name)) +
  geom_point(size = 2, colour = "firebrick") +
  geom_label_repel(size=3) +
  scale_y_discrete(limits = c(165,170,175)) +
  labs(title = "Women's World Cup 2019", 
       subtitle = "Goalkeepers By Country in Twenty Group Games Played",
       x = "Country", y = "Height (cms)") +
  theme_minimal()
p3
p4 <- ggplot(df2, aes(Country, Height, label = Name)) +
  geom_point(size = 2, colour = "blue") +
  geom_label_repel(size=3) +
  ylim(175,185) +
  labs(title = "Women's World Cup 2019", 
       subtitle = "Goalkeepers By Country in Twenty Group Games Played",
       x = "Country", y = "Height (cms)") +
  theme_minimal()
p4