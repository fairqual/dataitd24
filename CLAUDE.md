# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is an R data package (`dataitd24`) containing qualitative research data from a FAIRqual workshop at ITD24. The package distributes:
- Digitized flipchart data from workshop sessions (post-it notes)
- A qualitative analysis codebook with categories, subcategories, codes, and frequencies
- Original flipchart images as documentation

## Key Commands

### Data Processing
```bash
# Run the main data processing script
Rscript data-raw/data_processing.R
```

### Package Development
```r
# Install required dependencies
install.packages(c("usethis", "fs", "here", "readr", "readxl", "openxlsx", "dplyr"))

# Document and build package
devtools::document()
devtools::build()
devtools::check()

# Install package locally
devtools::install()
```

## Architecture and Data Flow

### Data Processing Pipeline
1. **Raw data** in `data-raw/`:
   - `codebook_fairqual_workshop_itd24.xlsx` - Two sheets with qualitative coding
   - `digitized_flipcharts_fairqual_workshop_itd24.xlsx` - Workshop flipchart transcriptions
   
2. **Processing script** `data-raw/data_processing.R`:
   - Reads Excel files
   - Fixes data issues (e.g., missing rows in codebook sheet 2)
   - Exports to three formats:
     - `.rda` files in `data/` for R package distribution
     - `.csv` and `.xlsx` in `inst/extdata/` for external access

3. **Data dictionary** in `data-raw/dictionary.csv` documents all variables

### Important Data Corrections
- Sheet 2 of the codebook is missing 2 rows compared to Sheet 1 (total should be 283)
- The processing script adds these missing rows using `bind_rows()`:
  - "data misuse" (category: "fears / direct challenges of sharing", frequency: 1)
  - "scientific benefits" (category: "why share? Practical aspects of sharing", frequency: 1)

### Package Structure Notes
- Currently no R functions in `R/` - this is a data-only package
- DESCRIPTION file needs updating from template values
- No tests or vignettes yet implemented
- README filename has a typo: "REAMDE.md" instead of "README.md"

## Working with the Data

The package exports three main datasets:
- `codebook_qualitative`: Qualitative analysis results with categories and frequencies
- `flipcharts1`: Workshop part 1 data (post-it notes, questions, groupings)
- `flipcharts2`: Workshop part 2 data (challenges and approaches)

Access data after installation:
```r
library(dataitd24)
data(codebook_qualitative)
data(flipcharts1)
data(flipcharts2)
```

## Development Guidelines

- Wrap text at 72 characters to maintain readability and compatibility with different editors