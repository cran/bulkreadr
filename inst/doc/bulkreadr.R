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


## ----include=FALSE------------------------------------------------------------
googlesheets4::gs4_deauth()

## ----example3, message=FALSE, warning=FALSE-----------------------------------

# Google Sheet ID or the link to the sheet

sheet_id <- "1izO0mHu3L9AMySQUXGDn9GPs1n-VwGFSEoAKGhqVQh0"

# read all the sheets

read_gsheets(ss = sheet_id)

