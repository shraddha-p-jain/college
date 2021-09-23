# Basic Plotting - Using inbuilt library 'graphics'

## Plotting scatter plot, of 50 standard normal random numbers against some other 50 SN
x <- rnorm(50)
y <- rnorm(50)
plot(x,y)

# To see the list of all functions of a package:
library(help = "graphics")
library(help = "datasets")

# Scatter plot of cars dataset
data("cars")
plot(cars[,1],cars[,2], xlab = "Speed", ylab = "Stopping Distance")
# OR
a <-cars[,1]
b <-cars[,2]
plot(a,b, xlab = "Speed", ylab = "Stopping Distance", main = "CARS DATASET")

# Creating an histogram - like vertical lines
plot(a,b,type = 'h', xlab = "Speed", ylab = "Stopping Distance", main = "CARS DATASET")

# histogram
hist(cars[,1], xlab = "speed")


# Advanced a little bit - Plotting a regression model
# pipleines used - from package magrittr
install.packages("magrittr")
# help documentation:
??magrittr
#load
library(magrittr)

## %>% operator to avoid a lot of composite functions
## x %>% f %>% g %>% h = h(g(f(x)))

cars %>% lm(dist ~ speed, data = .) %>% plot()
# on  the cars dataset, fit a linear model, and plot the outputs.

