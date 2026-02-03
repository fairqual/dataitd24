# Workshop Part 2 Challenge-Approach Data

Data from the second part of the FAIRqual workshop where groups were
combined (a+c and b+d) to identify key challenges in sharing qualitative
data and propose approaches to address them. This exercise focused on
synthesizing insights from part 1 into actionable challenges and
solutions.

## Usage

``` r
flipcharts2
```

## Format

A tibble with 9 rows and 3 variables:

- group:

  Combined workshop groups. Character variable with values "ac" (groups
  a and c combined) or "bd" (groups b and d combined).

- challenge:

  Data sharing challenge identified by the group. Character variable
  containing specific challenges such as anonymization difficulties,
  data misuse concerns, ethics alignment, AI implications, and
  politicization risks.

- approach:

  Proposed approach or solution to address the identified challenge.
  Character variable containing strategies like obtaining proper ethics
  approval, metadata documentation, participant co-creation, and
  approval processes. Some entries may be "na" where no specific
  approach was proposed.

## Source

FAIRqual Workshop at the International Transdisciplinary Conference
(ITD24), Utrecht, Netherlands, November 4-8, 2024.

## Details

In this workshop phase, the four original groups were merged into two
larger groups to facilitate deeper discussion and synthesis. Each
combined group identified multiple challenges and attempted to propose
practical approaches for addressing them. The challenges reflect key
concerns about sharing qualitative data in transdisciplinary research
contexts.

## See also

[`codebook_qualitative`](https://github.com/fairqual/dataitd24/reference/codebook_qualitative.md)
for the analyzed results
[`flipcharts1`](https://github.com/fairqual/dataitd24/reference/flipcharts1.md)
for the workshop part 1 data

## Examples

``` r
# Load the data
data(flipcharts2)

# View all challenges and approaches
flipcharts2
#> # A tibble: 9 × 3
#>   group challenge                                                       approach
#>   <chr> <chr>                                                           <chr>   
#> 1 bd    annonymisation does not work                                    loss of…
#> 2 bd    misue & decontextualisation of data                             ethical…
#> 3 bd    != ethics considerations to be aligned                          what is…
#> 4 bd    qualitatvie data and AI? are we afraid?                         na      
#> 5 ac    politization of data                                            it is n…
#> 6 ac    moral responsibility to care (do no harm)                       partici…
#> 7 ac    diffuse ownership of raw data + i.p. (intellectual property ri… na      
#> 8 ac    transfer across projects and between partners                   consort…
#> 9 ac    ethics and permission (amendments)                              legal p…

# Challenges by group
library(dplyr)
flipcharts2 %>%
  group_by(group) %>%
  summarise(
    n_challenges = n(),
    challenges = paste(challenge, collapse = "; ")
  )
#> # A tibble: 2 × 3
#>   group n_challenges challenges                                                 
#>   <chr>        <int> <chr>                                                      
#> 1 ac               5 politization of data; moral responsibility to care (do no …
#> 2 bd               4 annonymisation does not work; misue & decontextualisation …

# Filter out entries without specific approaches
flipcharts2 %>%
  filter(approach != "na")
#> # A tibble: 7 × 3
#>   group challenge                                     approach                  
#>   <chr> <chr>                                         <chr>                     
#> 1 bd    annonymisation does not work                  loss of context (as main …
#> 2 bd    misue & decontextualisation of data           ethical concerns; get eth…
#> 3 bd    != ethics considerations to be aligned        what is data; do not publ…
#> 4 ac    politization of data                          it is not allowed to take…
#> 5 ac    moral responsibility to care (do no harm)     participating actors give…
#> 6 ac    transfer across projects and between partners consortium agreement      
#> 7 ac    ethics and permission (amendments)            legal partner checks;  in…
```
