library(tibble)
library(readr)
library(dplyr)
library(stringr)

setwd('/home/pedromota/dm1/Forest-Fires-in-Portugal/')
ds <- as_tibble(read_csv("fires_train.csv", na = c("-", "NA")))
ds <- select(ds, lat, lon)
ds <- head(ds,10)
glimpse(ds)

num = "(([0-9]+\\.[0-9]+)|([0-9]+))"

# All (I hope) the values have this pattern: (num)'[º,:]'(num)'[\':]'(num)'(\'\')?'
# or xºy'z", x:y:z" and x:y:z

# Observe that every value of the lat and lon attribute is a string s of the form: num[º:]num[':]num('')?, 
# where 'num' is a pattern for integer and real numbers. To parse them, we can simply do str_extract_all(s, num) 
# and get all the numbers in a vector, in order.

ds1 <- mutate(ds, lat=str_extract_all(lat, num), lon=str_extract_all(lon, num))

# This doesn't work :)
# ds2 <- mutate(ds1, lat_x = lat[1], lat_y=lat[2], lat_z=lat[2])

# After, we need to convert it to a decimal representation.
# Font: https://stackoverflow.com/questions/1140189/converting-latitude-and-longitude-to-decimal-values

# Then convert them to x, y, z cartesian place
# Font: https://stackoverflow.com/questions/1185408/converting-from-longitude-latitude-to-cartesian-coordinates