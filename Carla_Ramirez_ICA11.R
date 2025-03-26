install.packages("readr")   # Only do this once
library(readr)              # Load the package
flights <- read_csv("flights.csv")
head(flights)
library(ggplot2)

ggplot(flights, aes(x = year, y = passengers)) +
  geom_line(color = "steelblue", linewidth = 1) +  # <-- changed from size to linewidth
  facet_wrap(~ month) +
  labs(x = "Year", y = "Number of Passengers", title = "Monthly Passenger Trends Over Years") +
  theme_minimal()

