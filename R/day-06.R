# Hope Wilcox
# GEOG 176A
# 12 Aug 20
# Daily Assignment 06



library(tidyverse)

url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'

covid = read_csv(url)

# Question 1

top_states = covid %>%
  filter(date ==max(date)) %>%
  group_by(state) %>%
  summarize(cases=sum(cases, na.rm=T)) %>%
  ungroup() %>%
  slice_max(cases, n=6) %>%
  pull(state)

covid %>%
  filter(state %in% top_states) %>%
  group_by(state, date) %>%
  summarize(cases=sum(cases)) %>%
  ungroup() %>%
  ggplot(aes(x=date, y=cases, color=state)) +
  geom_line(size=2) +
  facet_wrap(~state) +
  ggthemes::theme_light() +
  theme(legend.position='NA') +
  labs(title="Cummulative Case Counts",
       subtitle="Data Source: NY Times",
       x="Date",
       y="Cases",
       caption="Daily Exercise 06")

# Question 2
covid %>%
  group_by(date) %>%
  summarize(cases = sum(cases)) %>%
  ggplot(aes(x = date, y = cases)) +
  geom_col(fill = "darkgray", color = "darkgray", alpha = .25) +
  geom_line(color = "darkgray", size = 3) +
  ggthemes::theme_gdocs() +
  labs(title = "National Cummulative Case Counts",
       x = "Date",
       y = "Cases",
       caption = "Daily Exercise 06")
