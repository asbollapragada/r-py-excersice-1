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

# Statistics of spread (variation)
algae$a1 |> var() # variance
algae$a1 |> sd() # standard deviation
algae$a1 |> range() # range
algae$a1 |> max() # maximum value
algae$a1 |> min() # minimum value
algae$a1 |> IQR() # Interquartile Range
algae$a1 |> quantile() # Quantile
algae$a1 |> quantile(probs = c(0.2, 0.8)) # Specifying specific quantile

# Missing values
library(purrr)
# Compute the total number of NA values in the dataset
nas <- algae %>% 
  purrr::map_dbl(~sum(is.na(.))) %>% 
  sum()

cat("The dataset contains ", nas, "NA values. \n")