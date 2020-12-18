library(tidyverse)
library(readxl)
library(here)
library(janitor)
library(dplyr)
here::here()

boing_2015 <- read_xlsx(here("raw_data/candy_ranking_data/boing-boing-candy-2015.xlsx"))
boing_2016 <- read_xlsx(here("raw_data/candy_ranking_data/boing-boing-candy-2016.xlsx"))
boing_2017 <- read_xlsx(here("raw_data/candy_ranking_data/boing-boing-candy-2017.xlsx"))

boing_2015 <- clean_names(boing_2015)
boing_2016 <- clean_names(boing_2016)
boing_2017 <- clean_names(boing_2017)

names(boing_2017) = gsub(pattern = "q6_", replacement = "", x = names(boing_2017))
names(boing_2017) = gsub(pattern = "q1_", replacement = "", x = names(boing_2017))
names(boing_2017) = gsub(pattern = "q2_", replacement = "", x = names(boing_2017))
names(boing_2017) = gsub(pattern = "q3_", replacement = "", x = names(boing_2017))
names(boing_2017) = gsub(pattern = "q4_", replacement = "", x = names(boing_2017))
names(boing_2017) = gsub(pattern = "q5_", replacement = "", x = names(boing_2017))

merged_2015_2016 <- left_join(boing_2015, boing_2016)
joined_boings <- left_join(merged_2015_2016, boing_2017)
