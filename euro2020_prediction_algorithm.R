# This is an algorithm for predicting the results of EURO 2020
# Code: Jesse Alston
# Last Updated: 11 June 2020

# PACKAGES ####
library(tidyverse)

# DATA ####
setwd("SET WORKING DIRECTORY HERE")

euro2020 <- read.csv("euro2020.csv")

# ALGORITHM ####
euro2020 %>%
  mutate(home_score = case_when(home_rank - away_rank < -20 ~ 2,
                                home_rank - away_rank > -20 & home_rank - away_rank < 0 ~ 1,
                                home_rank - away_rank > 0 ~ 0),
         away_score = case_when(home_rank - away_rank > 20 ~ 2,
                                home_rank - away_rank < 20 & home_rank - away_rank > 0 ~ 1,
                                home_rank - away_rank < 0 ~ 0),
         score = paste0(home_score,"-",away_score))