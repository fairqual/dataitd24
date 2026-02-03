# Qualitative Content Analysis Codebook from FAIRqual Workshop

A codebook containing the results of qualitative content analysis
performed on all workshop materials (post-it notes from flipcharts). The
analysis categorized discussions about sharing qualitative data in
transdisciplinary research into hierarchical themes.

## Usage

``` r
codebook_qualitative
```

## Format

A tibble with 50 rows and 4 variables:

- category:

  High-level thematic category (e.g., "data types", "data sovereignty",
  "why share?"). Character variable.

- subcategory:

  More specific topic within the main category (e.g., "interview types",
  "data platforms"). Character variable.

- code:

  Detailed code assigned to specific content (e.g., "interview", "focus
  groups", "workshop"). Character variable.

- frequency:

  Number of times this code appeared across all workshop materials.
  Numeric variable ranging from 1 to 18.

## Source

FAIRqual Workshop at the International Transdisciplinary Conference
(ITD24), Utrecht, Netherlands, November 4-8, 2024.

## See also

[`flipcharts1`](https://github.com/fairqual/dataitd24/reference/flipcharts1.md)
for the raw workshop part 1 data
[`flipcharts2`](https://github.com/fairqual/dataitd24/reference/flipcharts2.md)
for the raw workshop part 2 data

## Examples

``` r
# Load the data
data(codebook_qualitative)

# View structure
str(codebook_qualitative)
#> tibble [50 × 4] (S3: tbl_df/tbl/data.frame)
#>  $ category   : chr [1:50] "data types" "data types" "data types" "data types" ...
#>  $ subcategory: chr [1:50] "interview types" "interview types" "interview types" "interview types" ...
#>  $ code       : chr [1:50] "interview" "focus groups" "oral (hi)stories" "informal talks" ...
#>  $ frequency  : num [1:50] 18 4 3 2 2 17 8 4 3 1 ...

# Most frequent codes
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
codebook_qualitative %>%
  arrange(desc(frequency)) %>%
  head(10)
#> # A tibble: 10 × 4
#>    category                                subcategory           code  frequency
#>    <chr>                                   <chr>                 <chr>     <dbl>
#>  1 data types                              interview types       inte…        18
#>  2 data types                              workshop              work…        17
#>  3 data sharing approaches                 data platforms        data…        14
#>  4 data sharing approaches                 dissemination of sum… scie…        11
#>  5 fears / direct challenges of sharing    sharing could do harm shar…        11
#>  6 data sovereignty                        to whom does the dat… to w…        10
#>  7 why share? Practical aspects of sharing standards from insti… stan…        10
#>  8 why share? Practical aspects of sharing scientific benefits   re-u…        10
#>  9 data types                              existing documents    exis…         9
#> 10 ways of sharing qualitative data        sharing of certain a… shar…         9

# Codes by category
codebook_qualitative %>%
  group_by(category) %>%
  summarise(
    n_codes = n(),
    total_frequency = sum(frequency)
  )
#> # A tibble: 7 × 3
#>   category                                n_codes total_frequency
#>   <chr>                                     <int>           <dbl>
#> 1 data sharing approaches                       4              38
#> 2 data sovereignty                              4              28
#> 3 data types                                   19              91
#> 4 fears / direct challenges of sharing          9              44
#> 5 how to navigate ai?                           1               6
#> 6 ways of sharing qualitative data              4              25
#> 7 why share? Practical aspects of sharing       9              51
```
