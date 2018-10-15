
# load packages
library(tidyverse)

# load data
health_df <- read_rds("data/health.rds") %>%
  glimpse()

# plot percent w/o health insurance and percent favorable to aca
