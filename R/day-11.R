
library(tidyverse)
library(sf)
library(units)


homes = readr::read_csv("C:/Users/hopew/Desktop/github176/geog-176A-labs/data/uscities.csv") %>%
  st_as_sf(coords = c("lng", "lat"),
  crs = 4326) %>%
  filter(city %in% c("Santa Barbara", "Piru"))





st_distance(homes)

st_distance(st_transform(homes, 5070))
st_distance(st_transform(homes, '+proj=eqdc +lat_0=40 +lon_0=-96 +lat_1=20 +lat_2=60 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs'))

(st_distance(homes) %>%
    set_units("km") %>%
    drop_units())
