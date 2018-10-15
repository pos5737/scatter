
# load packages
library(tidyverse)
library(ggthemes)

# load raw data
df_raw <- read_csv("data/bf6825a5-0525-4670-9aba-782771b2c59f_Data.csv") %>%
  glimpse()

# tidy more efficiently
df <- df_raw  %>%
  gather(Year, value, `2000 [YR2000]`:`2015 [YR2015]`) %>%
  mutate(Year = str_sub(Year, end = 4)) %>%
  select(`Series Name`, `Country Name`, `Year`, `value`) %>% 
  filter(`Series Name` == "Population, total") %>%
  rename(country = `Country Name`, 
         year = Year,
         population = value) %>%
  select(-`Series Name`) %>%
  mutate(population = as.numeric(population),
         year = as.numeric(year)) %>%
  glimpse()

