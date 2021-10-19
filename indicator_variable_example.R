library(tidyverse)

# read in raw data
data <- read_csv("OnlineNewsPopularity.csv")

# add in day of week variable called "day"
# check every indicator variable for a 1, once it hits a 1
# the new variable day is defined as whatever day it is
# if no 1 are present saves the day variable as "error"
data <- data %>%
  mutate(
    day = if_else(weekday_is_monday == 1, "monday",
                  if_else(weekday_is_tuesday == 1, "tuesday",
                          if_else(weekday_is_wednesday == 1, "wednesday",
                                  if_else(weekday_is_thursday == 1, "thursday",
                                          if_else(weekday_is_friday == 1, "friday",
                                                  if_else(weekday_is_saturday == 1, "saturday",
                                                          if_else(weekday_is_sunday == 1, "sunday","error")
                                                         )
                                                  )
                                          )
                                  )
                          )
                  )
         )

# remove old day indicators
data <- data %>%
  select(!starts_with("weekday_is_"))

# change to factor
data$day <- as.factor(data$day)

#check structure to make sure is successful 
str(data)

#double check for "errors"
table(data$day)

