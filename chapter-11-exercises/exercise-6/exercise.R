# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
flights %>% 
  group_by(dest) %>% 
  summarize(
    avg_arrival_delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  left_join(airports, by = c("dest" = "faa")) %>% 
  arrange(-avg_arrival_delay)
  # CAE (Columbia Metropolitan) had the largest

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
flights %>% 
  group_by(carrier) %>% 
  summarize(
    avg_arrival_delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  left_join(airlines, by = "carrier") %>% 
  arrange(avg_arrival_delay)
  # As (Alaska Airlines) had the smallest
