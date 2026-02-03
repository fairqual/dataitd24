# Workshop Part 1 Flipchart Data

Digitized post-it notes from the first part of the FAIRqual workshop
where participants shared lived and imagined experiences with
qualitative data sharing. Four groups (a, b, c, d) responded to four
questions about past experiences and future scenarios.

## Usage

``` r
flipcharts1
```

## Format

A tibble with 217 rows and 6 variables:

- group:

  Workshop group identifier. Character variable with values "a", "b",
  "c", or "d".

- question_no:

  Question number discussed. Character variable with values "1", "2",
  "3", "4", or NA, where:

  - 1 = What types of qualitative data have you collected?

  - 2 = Have you shared qualitative data? If yes, how?

  - 3 = What challenges did you face when sharing?

  - 4 = What would enable better data sharing?

  - NA = Post-its from round 2 where original question placement was
    unclear

- individual_thought_postits:

  Content of individual post-it notes written by participants. Character
  variable containing the actual text from each post-it.

- type:

  Type of experience shared. Character variable with values "lived"
  (actual experience), "imagined" (hypothetical scenario), or NA.

- comment:

  Additional comments or notes about the post-it. Character variable,
  often NA.

- umbrella_term_postits:

  Overarching theme or grouping assigned to related post-its during the
  workshop synthesis. Character variable, often NA.

## Source

FAIRqual Workshop at the International Transdisciplinary Conference
(ITD24), Utrecht, Netherlands, November 4-8, 2024.

## See also

[`codebook_qualitative`](https://github.com/fairqual/dataitd24/reference/codebook_qualitative.md)
for the analyzed results
[`flipcharts2`](https://github.com/fairqual/dataitd24/reference/flipcharts2.md)
for the workshop part 2 data

## Examples

``` r
# Load the data
data(flipcharts1)

# View structure
str(flipcharts1)
#> tibble [217 × 6] (S3: tbl_df/tbl/data.frame)
#>  $ group                     : chr [1:217] "a" "a" "a" "a" ...
#>  $ question_no               : chr [1:217] "1" "1" "1" "1" ...
#>  $ individual_thought_postits: chr [1:217] "conent analysis" "storytelling diagrams? (draw and tell)" "interview transcripts" "workshop (post-its)" ...
#>  $ type                      : chr [1:217] "lived" "lived" "lived" "lived" ...
#>  $ comment                   : chr [1:217] NA NA NA NA ...
#>  $ umbrella_term_postits     : chr [1:217] NA NA NA NA ...

# Count post-its by group and question
library(dplyr)
library(tidyr)
flipcharts1 %>%
  count(group, question_no) %>%
  pivot_wider(names_from = question_no, values_from = n)
#> # A tibble: 4 × 6
#>   group   `1`   `2`   `3`   `4`    na
#>   <chr> <int> <int> <int> <int> <int>
#> 1 a        22    12    15    10     2
#> 2 b        21    21     7     5    NA
#> 3 c        21    13    11     8     3
#> 4 d        18    12    13     3    NA

# View lived vs imagined experiences
flipcharts1 %>%
  filter(!is.na(type)) %>%
  count(type, question_no)
#> # A tibble: 9 × 3
#>   type     question_no     n
#>   <chr>    <chr>       <int>
#> 1 imagined 1              14
#> 2 imagined 2              24
#> 3 imagined 3              20
#> 4 imagined 4              20
#> 5 lived    1              68
#> 6 lived    2              34
#> 7 lived    3              26
#> 8 lived    4               6
#> 9 na       na              5
```
