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

## ----eval=FALSE---------------------------------------------------------------
#  install.packages("bulkreadr")
#  

## ----eval=FALSE---------------------------------------------------------------
#  
#  if(!require("devtools")){
#   install.packages("devtools")
#  }
#  
#  devtools::install_github("gbganalyst/bulkreadr")

## ----pkgload------------------------------------------------------------------
library(bulkreadr)


## ----example1-----------------------------------------------------------------

# path to the xls/xlsx file.

path <- system.file("extdata", "Diamonds.xlsx", package = "bulkreadr")

# read the sheets

read_excel_workbook(path = path)


## ----example1a----------------------------------------------------------------

# path to the directory containing the xls/xlsx files.

directory <- system.file("xlsxfolder",  package = "bulkreadr")

# import the workbooks

read_excel_files_from_dir(dir_path = directory)


## ----example2-----------------------------------------------------------------
# path to the directory containing the CSV files.

directory <- system.file("csvfolder",  package = "bulkreadr")

# import the csv files

read_csv_files_from_dir(dir_path = directory)


## ---- include=FALSE-----------------------------------------------------------
googlesheets4::gs4_deauth()

## ----example3, message=FALSE, warning=FALSE-----------------------------------

# Google Sheet ID or the link to the sheet

sheet_id <- "1izO0mHu3L9AMySQUXGDn9GPs1n-VwGFSEoAKGhqVQh0"

# read all the sheets

read_gsheets(ss = sheet_id)

## ---- spssdata1---------------------------------------------------------------

file_path <- system.file("extdata", "Wages.sav", package = "bulkreadr")

data <- read_spss_data(file = file_path)

data


## ----spssdata2----------------------------------------------------------------

data <- read_spss_data(file = file_path, label = TRUE)

data


## ----example4-----------------------------------------------------------------

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

df <- tibble(
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

result_df_mean <- fill_missing_values(df, use_mean = TRUE)

result_df_mean


## -----------------------------------------------------------------------------
result_df_median <- fill_missing_values(df, use_mean = FALSE)

result_df_median

## -----------------------------------------------------------------------------
sample_iris <- tibble(
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
  map_df(fill_missing_values)

