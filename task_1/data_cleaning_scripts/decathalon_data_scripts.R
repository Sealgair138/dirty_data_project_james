# required libraries
library(tidyverse)
library(readr)
library(dplyr)
library(here)

# read in data
here::here()
decathalon_data <- read_rds(here("raw_data/decathlon.rds"))
head(decathalon_data)

#clean headers
dec_data_clean_names <- clean_names(decathalon_data)

#show row names as a column
row_names_to_column <- tibble::rownames_to_column(dec_data_clean_names)
colnames(row_names_to_column)

# name new column
rowname_to_names <- row_names_to_column %>% 
  rename(surname = rowname)

# fixing formatting to lower case
rowname_to_names %>% 
  tolower(surname, )

?tolower
