
# load packages
library(tidyverse)

# load data
health_df <- read_rds("data/health.rds") %>%
  glimpse()

# plot percent w/o health insurance and percent favorable to aca
ggplot(health_df, aes(x = percent_uninsured, y = percent_favorable_aca)) + 
  geom_point()

# calculate r
cor(health_df$percent_uninsured, health_df$percent_favorable_aca)
