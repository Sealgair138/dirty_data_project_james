# required libraries
library(tidyverse)
library(readr)
library(dplyr)
library(here)
library(janitor)

# read in data
here::here()
decathalon_data <- read_rds(here("raw_data/decathlon.rds"))
head(decathalon_data)

#clean headers
dec_data_clean_names <- clean_names(decathalon_data)

#show row names as a column
row_names_to_column <- tibble::rownames_to_column(dec_data_clean_names)

# name new column
rowname_to_names <- row_names_to_column %>% 
  rename(surname = rowname)

# make all text lower case
dec_data_lc <- rowname_to_names %>% 
  mutate(surname = str_to_lower(surname)) %>% 
  mutate(competition = str_to_lower(competition))

