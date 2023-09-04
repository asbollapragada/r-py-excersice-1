library(pacman)

p_load(dlookr,
       DMwR2, # Data Mining with R functions
       GGally, # Pair-wise plots using ggplot2
       Hmisc, # Data analysis 
       palmerpenguins, # Alternative to the Iris dataset
       tidyverse) # Data wrangling, manipulation, visualization

#load the data
data(algae, package = "DMwR2")

algae |> glimpse()

#Central Tendency: Mean, Median and Mode
algae$a1 |>
  mean()
algae$a1 |>
  median()
Mode <- function(x, na.rm=FALSE){
  if(na.rm) x<-x[!is.na(x)]
  ux <- unique (x)
  return (ux[which.max(tabulate(match(x, ux)))])
}

algae$a2 |> Mode()

# DMwR centralValue() function
# Numerical variable
algae$a1 |> centralValue()
# Nominal variable
algae$speed |> centralValue()