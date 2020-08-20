library(tidyverse)

#filter usa data to only continuous states
conus = USAboundaries::us_states() %>%
  filter(!state_name %in% c("Puerto Rico",
                            "Alaska",
                            "Hawaii"))

# cast conus into a multilinestring geometry set of 1 feature, preserve internal boundaries
preserved_bound = st_combine(conus) %>%
  st_cast("MULTILINESTRING")
plot(preserved_bound)

# cast conus into a multilinestring geometry set of 1 feature, dissolve internal boundaries

dissolved_bounds = st_union(conus) %>%
  st_cast("MULTILINESTRING")
plot(dissolved_bounds)

