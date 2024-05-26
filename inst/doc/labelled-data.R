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

## ----spssdata1----------------------------------------------------------------

library(bulkreadr)

file_path <- system.file("extdata", "Wages.sav", package = "bulkreadr")

data <- read_spss_data(file = file_path)

data


## ----spssdata2----------------------------------------------------------------

data <- read_spss_data(file = file_path, label = TRUE)

data


## ----statadata1---------------------------------------------------------------

file_path <- system.file("extdata", "Wages.dta", package = "bulkreadr")

data <- read_stata_data(file = file_path)

data


## ----statadata2---------------------------------------------------------------

data <- read_stata_data(file = file_path, label = TRUE)

data


## -----------------------------------------------------------------------------

# Creating a data dictionary from an SPSS file

file_path <- system.file("extdata", "Wages.sav", package = "bulkreadr")

wage_data <- read_spss_data(file = file_path)

generate_dictionary(wage_data)

## -----------------------------------------------------------------------------

# Look for a single keyword.

look_for(wage_data, "south")

look_for(wage_data, "^s")

