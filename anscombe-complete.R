
# load packages
library(tidyverse)

# load data
quartet_df <- read_csv("https://gist.githubusercontent.com/ericbusboom/b2ac1d366c005cd2ed8c/raw/c92c66e43d144fa9c29dbd602d5af6988e8db533/anscombes.csv") %>%
  glimpse()

# plot x and y, faceted by dataset
ggplot(quartet_df, aes(x = x, y = y)) + 
  geom_point() + 
  facet_wrap(vars(dataset))

# compute r for each data set
r_df <- quartet_df %>%
  group_by(dataset) %>%
  summarize(r = cor(x, y)) %>%
  glimpse()

# create table with kable
kableExtra::kable(r_df, format = "markdown")  # use html within an Rmd file
