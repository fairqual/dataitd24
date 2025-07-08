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
library(dplyr)

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

# Fix Sheet 2 by adding the two missing rows (issue #1)
# Create the two missing rows that exist in Sheet 1 but not in Sheet 2
missing_rows <- data.frame(
  category = c(NA, NA),
  subcategory = c("data misuse", "scientific benefits"),
  code = c(NA, NA),
  frequency = c(1, 1)
)

# Add the missing rows to Sheet 2
codebook_qualitative_sheet2 <- bind_rows(codebook_qualitative_sheet2, missing_rows)

# Verify the sum is now 283
sheet2_sum <- sum(codebook_qualitative_sheet2$frequency, na.rm = TRUE)
cat("Sheet 2 frequency sum after adding missing rows:", sheet2_sum, "\n")

# Export Data ------------------------------------------------------------------
usethis::use_data(dataitd24, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
readr::write_csv(dataitd24,
                 here::here("inst", "extdata", paste0("dataitd24", ".csv")))
openxlsx::write.xlsx(dataitd24,
                     here::here("inst", "extdata", paste0("dataitd24", ".xlsx")))
