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
## imported to check against Sheet 2 to identify if frequencies are equal
## they were not and are fixed in Issue #1. Sheet 1 will not be exported as
## data.

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
  category = c("fears / direct challenges of sharing", "why share? Practical aspects of sharing"),
  subcategory = c("data misuse", "scientific benefits"),
  code = c("data misuse", "scientific benefits"),
  frequency = c(1, 1)
)

# Add the missing rows to Sheet 2
codebook_qualitative_sheet2 <- bind_rows(codebook_qualitative_sheet2, missing_rows)

# Verify the sum is now 283
sheet2_sum <- sum(codebook_qualitative_sheet2$frequency, na.rm = TRUE)
cat("Sheet 2 frequency sum after adding missing rows:", sheet2_sum, "\n")

# Final name for export
codebook_qualitative <- codebook_qualitative_sheet2
flipcharts1 <- flipcharts_part1
flipcharts2 <- flipcharts_part2

# Export Data ------------------------------------------------------------------
usethis::use_data(codebook_qualitative, overwrite = TRUE)
usethis::use_data(flipcharts1, overwrite = TRUE)
usethis::use_data(flipcharts2, overwrite = TRUE)

fs::dir_create(here::here("inst", "extdata"))

readr::write_csv(codebook_qualitative,
                 here::here("inst", "extdata", paste0("codebook_qualitative", ".csv")))
readr::write_csv(flipcharts1,
                 here::here("inst", "extdata", paste0("flipcharts_part1", ".csv")))
readr::write_csv(flipcharts2,
                 here::here("inst", "extdata", paste0("flipcharts_part2", ".csv")))

openxlsx::write.xlsx(codebook_qualitative,
                     here::here("inst", "extdata", paste0("codebook_qualitative", ".xlsx")))
openxlsx::write.xlsx(flipcharts1,
                     here::here("inst", "extdata", paste0("flipcharts_part1", ".xlsx")))
openxlsx::write.xlsx(flipcharts2,
                     here::here("inst", "extdata", paste0("flipcharts_part2", ".xlsx")))
