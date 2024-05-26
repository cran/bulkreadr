## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  message = FALSE, 
  warning = FALSE,
  comment = "#>",
  fig.path = "man/figures/",
  out.width = "100%")

options(tibble.print_min = 5, tibble.print_max = 5)

options(rmarkdown.html_vignette.check_title = FALSE)

## ----example4-----------------------------------------------------------------

library(bulkreadr)
library(dplyr)

top_10_richest_nig <- c("Aliko Dangote", "Mike Adenuga", "Femi Otedola", "Arthur Eze", "Abdulsamad Rabiu", "Cletus Ibeto", "Orji Uzor Kalu", "ABC Orjiakor", "Jimoh Ibrahim", "Tony Elumelu")

top_10_richest_nig %>% 
  pull_out(c(1, 5, 2))

## -----------------------------------------------------------------------------
top_10_richest_nig %>% 
  pull_out(-c(1, 5, 2))

## ----example 5----------------------------------------------------------------

## ** heterogeneous dates **

dates <- c(
  44869, "22.09.2022", NA, "02/27/92", "01-19-2022",
  "13-01-  2022", "2023", "2023-2", 41750.2, 41751.99,
  "11 07 2023", "2023-4"
  )

# Convert to POSIXct or Date object

convert_to_date(dates)

# It can also convert date time object to date object 

convert_to_date(lubridate::now())


## ----example 6a---------------------------------------------------------------

# dataframe summary

inspect_na(airquality)

## -----------------------------------------------------------------------------
airquality %>% 
  group_by(Month) %>% 
  inspect_na()

## ----example 6----------------------------------------------------------------

df <- tibble::tibble(
  Sepal_Length = c(5.2, 5, 5.7, NA, 6.2, 6.7, 5.5),
  Sepal.Width = c(4.1, 3.6, 3, 3, 2.9, 2.5, 2.4),
  Petal_Length = c(1.5, 1.4, 4.2, 1.4, NA, 5.8, 3.7),
  Petal_Width = c(NA, 0.2, 1.2, 0.2, 1.3, 1.8, NA),
  Species = c("setosa", NA, "versicolor", "setosa",
    NA, "virginica", "setosa"
  )
)


## -----------------------------------------------------------------------------
df

## -----------------------------------------------------------------------------
# Impute using the mean

result_df_mean <- fill_missing_values(df, method = "mean")

result_df_mean

## -----------------------------------------------------------------------------

result_df_geomean <- fill_missing_values(df, selected_variables = c
("Petal_Length", "Petal_Width"), method = "geometric")

result_df_geomean

## -----------------------------------------------------------------------------
# Impute using the maximum method

result_df_max <- fill_missing_values(df, selected_variables = c
(2, 3), method = "max")

result_df_geomean

## -----------------------------------------------------------------------------
sample_iris <- tibble::tibble(
Sepal_Length = c(5.2, 5, 5.7, NA, 6.2, 6.7, 5.5),
Petal_Length = c(1.5, 1.4, 4.2, 1.4, NA, 5.8, 3.7),
Petal_Width = c(0.3, 0.2, 1.2, 0.2, 1.3, 1.8, NA),
Species = c("setosa", "setosa", "versicolor", "setosa",
          "virginica", "virginica", "setosa")
)


## -----------------------------------------------------------------------------
sample_iris

## -----------------------------------------------------------------------------
sample_iris %>%
  group_by(Species) %>%
  group_split() %>%
  map_df(fill_missing_values, method = "median")

