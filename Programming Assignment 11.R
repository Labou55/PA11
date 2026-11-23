
# Name: Labour Modi
# Course: COP2073C
# Assignment: Module 11 Programming Assignment
# Date: November 22, 2026

# Load required packages
library(tidyverse)
library(modelr)

# Create a tibble using cyl and wt from mtcars
mtcars_tbl <- mtcars %>%
  select(cyl, wt) %>%
  mutate(cyl = as.factor(cyl))

# Fit a linear model to predict weight based on cylinders
model <- lm(wt ~ cyl, data = mtcars_tbl)

# Create a data grid and add predicted values using pipes
predictions <- mtcars_tbl %>%
  data_grid(cyl) %>%
  add_predictions(model)

# Plot original data and predicted values
ggplot(mtcars_tbl, aes(x = cyl, y = wt)) +
  geom_point() +
  geom_point(
    data = predictions,
    aes(x = cyl, y = pred),
    color = "red",
    size = 4
  ) +
  labs(
    title = "Car Weight Based on Number of Cylinders",
    x = "Number of Cylinders",
    y = "Weight (1000 lbs)"
  ) +
  theme_minimal()

# Analysis:
# The linear model shows the relationship between the number of
# cylinders and the weight of cars in the mtcars dataset.
# The predicted values represent the average weight for each
# cylinder category (4, 6, and 8 cylinders).
# The plot shows that cars with more cylinders generally have
# greater weight. The red points represent the predicted weights
# for each cylinder category, while the other points represent
# the original data. This indicates a positive relationship
# between the number of cylinders and vehicle weight.

