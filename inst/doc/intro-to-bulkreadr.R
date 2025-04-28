## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse      = TRUE,
  message       = FALSE,
  warning       = FALSE,
  comment       = "#>",
  fig.path      = "man/figures/",
  out.width     = "100%"
)

options(
  tibble.print_min = 5,
  tibble.print_max = 5,
  rmarkdown.html_vignette.check_title = FALSE
)

## -----------------------------------------------------------------------------
library(bulkreadr)
library(dplyr)

## -----------------------------------------------------------------------------
# Path to the Excel workbook bundled with the package
path <- system.file("extdata", "Diamonds.xlsx", package = "bulkreadr")

# Import every sheet into one data frame
df_all_sheets <- read_excel_workbook(path = path)

# View the result
df_all_sheets

## -----------------------------------------------------------------------------
# Directory containing multiple Excel workbooks
directory <- system.file("xlsxfolder", package = "bulkreadr")

# Read and combine all workbooks in that folder
combined_excel <- read_excel_files_from_dir(dir_path = directory)

# View the result
glimpse(combined_excel)

## ----message=TRUE-------------------------------------------------------------
# Excel file with multiple sheets
excel_file <- system.file("extdata", "Diamonds.xlsx", package = "bulkreadr")

# Specify an output directory (will be created if it doesn't exist)
output_dir <- file.path(tempdir())

# Export each sheet to its own CSV and capture the file paths
write_excel_sheets_to_csv(
  excel_path = excel_file,
  output_dir = output_dir
)

## -----------------------------------------------------------------------------
# Directory with CSV files
directory <- system.file("csvfolder", package = "bulkreadr")

# Import all CSVs at once
all_csv_data <- read_csv_files_from_dir(dir_path = directory)

# View the result
all_csv_data

## -----------------------------------------------------------------------------
# De-authenticate since we're accessing a public or already-shared sheet
googlesheets4::gs4_deauth()

# Google Sheet ID (or full URL)
sheet_id <- "1izO0mHu3L9AMySQUXGDn9GPs1n-VwGFSEoAKGhqVQh0"

# Read and merge all sheets
gsheet_data <- read_gsheets(ss = sheet_id)

# Inspect the imported data
glimpse(gsheet_data)

