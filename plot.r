
# imports
library(data.table)
library(lubridate)
library(tidyverse)

# data
times = fread("times.csv")
times[, time := min + (sec / 60)]
times[, date := mdy(date)]
fwrite(times, "times.csv")

# plot
ggplot(data = times, aes(x = date, y = time)) +
  geom_point() +
  ylim(0, 50) +
  geom_text(aes(label = food), size = 2, hjust = 0.8, vjust = -0.7) +
  scale_x_date(date_breaks = "2 months" , date_labels = "%b %y") +
  labs(title = "Length of Gourmet Makes videos over time",
       x = "",
       y = "Length (minutes)")

# save
# ggsave("plot.png", width = 8, height = 3.1, units = "in")
ggsave("plot.png", width = 8, height = 6, units = "in")
