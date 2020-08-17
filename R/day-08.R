# Hope Wilcox
# GEOG 176A
# Daily Assignment 08
# 17 Aug 2020

# Create a plot of the daily new cases overlaid with a 7-day rolling mean for New Mexico


# Load covid data
library(tidyverse)
library(zoo)
url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'

covid = read_csv(url)

# define state of interest as NM
state.of.interest = "New Mexico"

covid %>%
  filter(state==state.of.interest) %>%
  group_by(date) %>%
  summarise(cases = sum(cases)) %>%
  mutate(newCases=cases-lag(cases),
         roll7 = rollmean(newCases, 7, fill = NA, align="right")) %>%
  ggplot(aes(x = date)) +
  geom_col(aes(y = newCases), col = NA, fill = "#9999CC") +
  geom_line(aes(y = roll7), col = "darkblue", size = 1) +
  ggthemes::theme_economist_white() +
  labs(title = paste("New Reported cases by day in", state.of.interest)) +
  theme(plot.background = element_rect(fill = "White"),
        panel.background = element_rect(fill = "White"),
        plot.title = element_text(size = 14, face = 'bold'))+
  theme(aspect.ratio=0.5)
