# Exercise 2: working with `dplyr`
# Note that this exercise repeats the analysis from Exercise 1, but should be 
# performed using `dplyr` (do not directly access or manipulate the data frames)

# Install and load the "fueleconomy" package
#install.packages("devtools")
#devtools::install_github("hadley/fueleconomy")
library(fueleconomy)

# Install and load the "dplyr" library
#install.packages("dplyr")
library("dplyr")

# Select the different manufacturers (makes) of the cars in this data set. 
# Save this vector in a variable
manufacturers <- select(vehicles, make) %>% 
  pull()

# Use the `distinct()` function to determine how many different car manufacturers
# are represented by the data set
distinct(vehicles, make)

# Filter the data set for vehicles manufactured in 1997
filter(vehicles, year == 1997)

# Arrange the 1997 cars by highway (`hwy`) gas milage
arrange(filter(vehicles, year == 1997), hwy)

# Mutate the 1997 cars data frame to add a column `average` that has the average
# gas milage (between city and highway mpg) for each car
vehicles <- mutate(vehicles, average = (cty + hwy) / 2)

# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more
# than 20 miles/gallon in the city. 
# Save this new data frame in a variable.
filter(vehicles, drive == "2-Wheel Drive", cty == 20)

# Of the above vehicles, what is the vehicle ID of the vehicle with the worst 
# hwy mpg?
# Hint: filter for the worst vehicle, then select its ID.
filter(vehicles, drive == "2-Wheel Drive", cty == 20) %>% 
         filter(hwy == min(hwy)) %>% 
         select(id)

# Write a function that takes a `year_choice` and a `make_choice` as parameters,
# and returns the vehicle model that gets the most hwy miles/gallon of vehicles 
# of that make in that year.
# You'll need to filter more (and do some selecting)!
best_hwy_mpg <- function(year_choice, make_choice) {
  filter(vehicles, year == year_choice, make == make_choice) %>% 
    filter(hwy == max(hwy)) %>% 
    select(model)
}

# What was the most efficient Honda model of 1995?
best_hwy_mpg("1995", "Honda")
