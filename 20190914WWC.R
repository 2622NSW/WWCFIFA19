setwd("~/Documents")
library(tidyverse)
library(ggrepel)
library(patchwork)
df <- read_csv("RefereesWWC.csv")
colnames(df)
head(df,3)
p1 <- ggplot(df, aes(x = ATM, y = Referee)) +
  geom_point() +
  labs(title = "Referees at the Women's World Cup 2019\nBall In Play (Minutes)", 
       x = "Ball in Play Time (Minutes)", y = "Referee", 
       caption = "https://keithlyons.me/") +
  theme_minimal() 
p1
p2 <- ggplot(df, aes(x = ATM, y = Referee))+
  geom_line(aes(color = "Ball in Play")) +
  geom_point(aes(color = "Referee")) +
  labs(x = "Ball in Play Time (Minutes)", y = "Referee") +
  scale_color_discrete("Type:") +
  theme_minimal ()
p2
p3 <-ggplot(df, aes(x = ATM, y = factor(GTM))) + 
  geom_density_ridges(fill = "lightblue") +
  labs(title = "Referees at the Women's World Cup 2019", 
       subtitle = "Ball In Play (Minutes)", 
       x = "Ball In Play Time (Minutes)", y = "Game Time (Minutes") +
  theme_minimal()
p3
p4 <- ggplot(df, aes(x = ATM, y = Goals)) + 
  geom_point(color = "blue", alpha = 0.9)+
  labs(title = "A generalised additive model", x = "Ball In Play (Minutes)", y = "Goals Scored") +
  annotate("text", x= 60, y=13, label="USA v Thailand") +
  stat_smooth(method = "gam", colour = "black") + 
  theme_minimal() +
  theme(plot.title = element_text(color="black", size=16, face="bold"),
        plot.subtitle = element_text(color="blue", size=14, face="bold"),
        axis.title = element_text(color="black", size=12, face="bold"),
        axis.text = element_text(color="black", size=10))
p4
p5 <- ggplot(df, aes(x = Temperature, y = factor(Goals), fill = ATM)) + 
  geom_density_ridges(stat = "binline", bins = 20, scale = 0.5,
                      draw_baseline = F, show.legend = F) + 
  annotate("text", x= 17.50, y=8.25, label = "USA v Thailand", fontface="bold") +
  annotate("text", x= 19, y=7.25, label = "Sweden v Thailand") +
  annotate("text", x= 28.50, y=7.25, label = "Scotland v Argentina") +
  annotate("text", x= 13.5, y=1.25, label = "Argentina v Japan") +
  annotate("text", x= 23.5, y=1.25, label = "China PR v Spain") +
  labs(x = "Temperature (°C)", y = "Goals") +
  theme_economist()
p5