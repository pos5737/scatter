
# load packages
library(tidyverse)
library(ggthemes)

# load raw data
df_raw <- read_csv("data/bf6825a5-0525-4670-9aba-782771b2c59f_Data.csv") %>%
  glimpse()

# tidy data into country-year format w/ total population
df <- df_raw  %>%
  mutate(`2000` = `2000 [YR2000]` , `2001` = `2001 [YR2001]`,
         `2002` = `2002 [YR2002]` , `2003` = `2003 [YR2003]`,
         `2004` = `2004 [YR2004]` , `2005` = `2005 [YR2005]`,
         `2006` = `2006 [YR2006]` , `2007` = `2007 [YR2007]`,
         `2008` = `2008 [YR2008]` , `2009` = `2009 [YR2009]`, 
         `2010` = `2010 [YR2010]` , `2011` = `2011 [YR2011]`,
         `2012` = `2012 [YR2012]` , `2013` = `2013 [YR2013]`, 
         `2014` = `2014 [YR2014]` , `2015` = `2015 [YR2015]`) %>% 
  gather(Year, value, `2000`:`2015`) %>% 
  select(`Series Name`, `Country Name`, `Year`, `value`) %>% 
  filter(`Series Name` == "Population, total") %>%
  rename(country = `Country Name`, 
         year = Year,
         population = value) %>%
  select(-`Series Name`) %>%
  mutate(population = as.numeric(population),
         year = as.numeric(year)) %>%
  glimpse()

  