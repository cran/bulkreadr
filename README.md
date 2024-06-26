
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bulkreadr <a><img src='man/figures/logo.png' align="right" height="138.5" /></a>

> The Ultimate Tool for Reading Data in Bulk

<!-- badges: start -->

[![R-CMD-check](https://github.com/gbganalyst/bulkreadr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/gbganalyst/bulkreadr/actions/workflows/R-CMD-check.yaml)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/bulkreadr)](https://cran.r-project.org/package=bulkreadr)
[![metacran
downloads](https://cranlogs.r-pkg.org/badges/bulkreadr)](https://cran.r-project.org/package=bulkreadr)
[![metacran
downloads](https://cranlogs.r-pkg.org/badges/grand-total/bulkreadr)](https://cran.r-project.org/package=bulkreadr)
[![Codecov test
coverage](https://codecov.io/gh/gbganalyst/bulkreadr/branch/main/graph/badge.svg)](https://app.codecov.io/gh/gbganalyst/bulkreadr?branch=main)
<!-- badges: end -->

## About the package

`bulkreadr` is an R package designed to simplify and streamline the
process of reading and processing large volumes of data. With a
collection of functions tailored for bulk data operations, the package
allows users to efficiently read multiple sheets from Microsoft
Excel/Google Sheets workbooks and multiple CSV files from a directory.
It returns the data as organized data frames, making it convenient for
further analysis and manipulation.

Whether dealing with extensive data sets or batch processing tasks,
“bulkreadr” empowers users to effortlessly handle data in bulk, saving
time and effort in data preparation workflows.

Additionally, the package seamlessly works with labelled data from SPSS
and Stata. For a quick video tutorial, I gave a talk at the
International Association of Statistical Computing webinar. The recorded
session is available
[here](https://isi-web.org/webinar/iasc-bulkreadr-ultimate-tool-reading-data-bulk)
and the webinar resources
[here](https://github.com/gbganalyst/bulkreadr-webinar).

## The Concept Map

![](man/figures/concept-map.png)

## Installation

You can install `bulkreadr` package from
[CRAN](https://cran.r-project.org/) with:

``` r
install.packages("bulkreadr")
```

or the development version from [GitHub](https://github.com/) with

``` r
if(!require("devtools")){
 install.packages("devtools")
}

devtools::install_github("gbganalyst/bulkreadr")
```

## Usage

Now that you have installed `bulkreadr` package, you can simply load it
by using:

``` r
library(bulkreadr)
```

To get started with `bulkreadr`, read the
[docs](https://gbganalyst.github.io/bulkreadr/articles/index.html).

## Context

bulkreadr is designed to integrate with and augment the capabilities of
established packages such as `readxl`, `readr`, and `googlesheets4`,
offering enhanced functionality for reading bulk data within the R
programming environment.

- [readxl](https://readxl.tidyverse.org) is the tidyverse package for
  reading Excel files (xls or xlsx) into an R data frame.

- [readr](https://readr.tidyverse.org) is the tidyverse package for
  reading delimited files (e.g., csv or tsv) into an R data frame.

- [googlesheets4](https://cran.r-project.org/package=googlesheets) is
  the package to interact with Google Sheets through the Sheets API v4
  <https://developers.google.com/sheets/api>.
