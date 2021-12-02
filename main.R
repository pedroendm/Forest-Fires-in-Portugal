library(tidyverse)
library(dlookr)
library(ggplot2)

setwd('C:/Users/00mot/Desktop/DM1/Forest-Fires-in-Portugal')

ds <- read_csv("fires_train.csv", na = c("-", "NA"))
ds <- as_tibble(ds) 

# Drop column "region", "district", "municipality" and "parish", because they are redundant, since we already have the coordinates.
ds <- select(ds, -(region:parish))

# Drop column "alert_source", because it's all missing values.
ds <- select(ds, -alert_source)

# Drop column 
ds <- select(ds, -village_veget_area) 
