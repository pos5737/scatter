
# load packages
library(tidyverse)

# load data
quartet_df <- read_csv("https://gist.githubusercontent.com/ericbusboom/b2ac1d366c005cd2ed8c/raw/c92c66e43d144fa9c29dbd602d5af6988e8db533/anscombes.csv") %>%
  glimpse()

# plot x and y, faceted by dataset
