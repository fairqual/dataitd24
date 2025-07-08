#' Qualitative Content Analysis Codebook from FAIRqual Workshop
#' 
#' A codebook containing the results of qualitative content analysis
#' performed on all workshop materials (post-it notes from flipcharts).
#' The analysis categorized discussions about sharing qualitative data
#' in transdisciplinary research into hierarchical themes.
#' 
#' @format A tibble with 50 rows and 4 variables:
#' \describe{
#'   \item{category}{High-level thematic category (e.g., "data types",
#'   "data sovereignty", "why share?"). Character variable.}
#'   \item{subcategory}{More specific topic within the main category
#'   (e.g., "interview types", "data platforms"). Character variable.}
#'   \item{code}{Detailed code assigned to specific content
#'   (e.g., "interview", "focus groups", "workshop"). Character variable.}
#'   \item{frequency}{Number of times this code appeared across all
#'   workshop materials. Numeric variable ranging from 1 to 18.}
#' }
#' 
#' @source FAIRqual Workshop at the International Transdisciplinary
#' Conference (ITD24), Utrecht, Netherlands, November 4-8, 2024.
#' 
#' @seealso 
#' \code{\link{flipcharts1}} for the raw workshop part 1 data
#' \code{\link{flipcharts2}} for the raw workshop part 2 data
#' 
#' @examples
#' # Load the data
#' data(codebook_qualitative)
#' 
#' # View structure
#' str(codebook_qualitative)
#' 
#' # Most frequent codes
#' library(dplyr)
#' codebook_qualitative %>%
#'   arrange(desc(frequency)) %>%
#'   head(10)
#' 
#' # Codes by category
#' codebook_qualitative %>%
#'   group_by(category) %>%
#'   summarise(
#'     n_codes = n(),
#'     total_frequency = sum(frequency)
#'   )
"codebook_qualitative"