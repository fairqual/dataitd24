#' Workshop Part 1 Flipchart Data
#' 
#' Digitized post-it notes from the first part of the FAIRqual workshop
#' where participants shared lived and imagined experiences with
#' qualitative data sharing. Four groups (a, b, c, d) responded to
#' four questions about past experiences and future scenarios.
#' 
#' @format A tibble with 217 rows and 6 variables:
#' \describe{
#'   \item{group}{Workshop group identifier. Character variable with
#'   values "a", "b", "c", or "d".}
#'   \item{question_no}{Question number discussed. Numeric variable
#'   with values 1-4, where:
#'   \itemize{
#'     \item{1 = What types of qualitative data have you collected?}
#'     \item{2 = Have you shared qualitative data? If yes, how?}
#'     \item{3 = What challenges did you face when sharing?}
#'     \item{4 = What would enable better data sharing?}
#'   }}
#'   \item{individual_thought_postits}{Content of individual post-it
#'   notes written by participants. Character variable containing
#'   the actual text from each post-it.}
#'   \item{type}{Type of experience shared. Character variable with
#'   values "lived" (actual experience), "imagined" (hypothetical
#'   scenario), or NA.}
#'   \item{comment}{Additional comments or notes about the post-it.
#'   Character variable, often NA.}
#'   \item{umbrella_term_postits}{Overarching theme or grouping
#'   assigned to related post-its during the workshop synthesis.
#'   Character variable, often NA.}
#' }
#' 
#' @source FAIRqual Workshop at the International Transdisciplinary
#' Conference (ITD24), Utrecht, Netherlands, November 4-8, 2024.
#' 
#' @seealso 
#' \code{\link{codebook_qualitative}} for the analyzed results
#' \code{\link{flipcharts2}} for the workshop part 2 data
#' 
#' @examples
#' # Load the data
#' data(flipcharts1)
#' 
#' # View structure
#' str(flipcharts1)
#' 
#' # Count post-its by group and question
#' library(dplyr)
#' library(tidyr)
#' flipcharts1 %>%
#'   count(group, question_no) %>%
#'   pivot_wider(names_from = question_no, values_from = n)
#' 
#' # View lived vs imagined experiences
#' flipcharts1 %>%
#'   filter(!is.na(type)) %>%
#'   count(type, question_no)
"flipcharts1"