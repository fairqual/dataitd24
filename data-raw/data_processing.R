# Description ------------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame
# Load packages ----------------------------------------------------------------
## Run the following code in console if you don't have the packages
## install.packages(c("usethis", "fs", "here", "readr", "readxl", "openxlsx"))
library(usethis)
library(fs)
library(here)
library(readr)
library(readxl)
library(openxlsx)

# Read data --------------------------------------------------------------------
codebook_qualitative_sheet1 <- read_excel(
  here::here("data-raw", "codebook_fairqual_workshop_itd24.xlsx"),
  sheet = 1
  )

codebook_qualitative_sheet2 <- read_excel(
  here::here("data-raw", "codebook_fairqual_workshop_itd24.xlsx"),
  sheet = 2
  )

flipcharts_part1 <- read_excel(
  here::here("data-raw", "digitized_flipcharts_fairqual_workshop_itd24.xlsx"),
  sheet = "part_1"
  )

flipcharts_part2 <- read_excel(
  here::here("data-raw", "digitized_flipcharts_fairqual_workshop_itd24.xlsx"),
  sheet = "part_2"
  )

# codebook <- readxl::read_excel("data-raw/codebook.xlsx") |>
#  clean_names()

# Tidy data --------------------------------------------------------------------
## Clean the raw data into a tidy format here

# Export Data ------------------------------------------------------------------
usethis::use_data(dataitd24, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
readr::write_csv(dataitd24,
                 here::here("inst", "extdata", paste0("dataitd24", ".csv")))
openxlsx::write.xlsx(dataitd24,
                     here::here("inst", "extdata", paste0("dataitd24", ".xlsx")))
