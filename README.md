# dataitd24: FAIRqual Workshop Data from ITD24

## About the Dataset

This repository contains the dataset from the FAIRqual workshop
conducted at the International Transdisciplinary Conference (ITD24) in
Utrecht, Netherlands (November 4-8, 2024). The workshop aimed to gather
experiences and perspectives on sharing qualitative data in
transdisciplinary research contexts.

### The FAIRqual Project

[FAIRqual](https://fairqual.org/about) is a collaborative project
between data scientists and qualitative researchers that aims to
develop both technological implementations and conceptual procedures
for sharing qualitative data based on the FAIR principles (Findable,
Accessible, Interoperable, Reusable) in transdisciplinary research.
The project is supported by the Open Research Data Program of the ETH
Board.

## Workshop Overview

The workshop brought together 24 researchers interested in
transdisciplinary research to:
- Share past experiences with open qualitative data
- Brainstorm challenges and opportunities for data sharing
- Imagine future scenarios for FAIR qualitative data practices
- Identify key concerns about sensitive data handling

Participants worked in four groups using flipcharts and post-it notes
to document their discussions. Key themes that emerged included:
- Handling of sensitive data and maintaining confidentiality
- Risks of data misuse and decontextualization
- Concerns about AI applications and data extraction
- Need for appropriate data repositories for qualitative data
- Cost-benefit considerations of preparing data for sharing

## Dataset Contents

### 1. Workshop Documentation

- **`pictures_flipcharts_fairqual_workshop_itd24/`**: Original
  photographs of all flipcharts produced during the workshop (JPG
  format)

### 2. Digitized Data

- **`digitized_flipcharts_fairqual_workshop_itd24.xlsx`**: Tabular
  digitization of all post-it notes from the flipcharts
  - Sheet 1 (`part_1`): Workshop part 1 discussions
  - Sheet 2 (`part_2`): Workshop part 2 discussions
  - Each row represents one post-it note with associated metadata

### 3. Analysis Results

- **`codebook_fairqual_workshop_itd24.xlsx`**: Qualitative content
  analysis codebook
  - Categories, subcategories, and codes derived from all workshop
    materials
  - Frequency counts for each code
  - Two sheets with complementary coding approaches

### 4. Supporting Documentation

- **`summary_fairqual_workshop_itd24.docx`**: Comprehensive workshop
  summary including:
  - Detailed description of the workshop approach
  - Key discussion topics and learnings
  - Context for interpreting the raw data

- **`dictionary.csv`**: Data dictionary describing all variables in
  the exported datasets

## Data Structure

The R package exports three main datasets:

1. **`codebook_qualitative`**: Structured qualitative analysis results
   - `category`: High-level thematic categories
   - `subcategory`: More specific topics within categories
   - `code`: Detailed codes assigned to content
   - `frequency`: Number of occurrences

2. **`flipcharts1`**: Part 1 workshop data
   - Individual post-it notes with questions and initial thoughts

3. **`flipcharts2`**: Part 2 workshop data
   - Challenges and approaches to data sharing

## Installation

This dataset is distributed as an R package. To install:

```r
# Install from GitHub (when available)
# remotes::install_github("fairqual/dataitd24")

# Or clone and install locally
# git clone https://github.com/fairqual/dataitd24
# devtools::install()
```

## Usage

```r
library(dataitd24)

# Load the datasets
data(codebook_qualitative)
data(flipcharts1)
data(flipcharts2)

# View the data
View(codebook_qualitative)
```

## Ethics and Consent

Workshop participants were informed about data collection and provided
consent for sharing. Sensitive content could be marked with special
stickers, and participants had the option to opt out of photography
using conference-provided orange wristbands.

## Citation

If you use this dataset, please cite:

```
FAIRqual Team (2024). FAIRqual Workshop Dataset from ITD24. 
International Transdisciplinary Conference, Utrecht, Netherlands.
https://github.com/fairqual/dataitd24
```

## Project Team

- Dr. Mollie Chapman (USYS Transdisciplinarity Lab, ETH Zurich)
- Dr. Bianca Vienni-Baptista (USYS Transdisciplinarity Lab, ETH
  Zurich)
- Dr. Franziska Mohr (USYS Transdisciplinarity Lab, ETH Zurich)
- Lars Schöbitz (Global Health Engineering, ETH Zurich)
- Prof. Dr. Elizabeth Tilley (Global Health Engineering, ETH Zurich)

## License

[License information to be added]

## Contact

For questions about the dataset or the FAIRqual project, please visit
[fairqual.org](https://fairqual.org) or contact the project team.

## Acknowledgments

We thank all workshop participants for their valuable contributions
and insights. This work is supported by the Open Research Data Program
of the ETH Board.