#' Get requested output dimensions
#'
#' @description
#' Get the dimensions to pass to a graphics device (or related, such as
#' [ggplot2::ggsave()]) for a graphic. The output proportions are
#' determined by the default text size, the height in lines of text, and the
#' aspect ratio.
#'
#' @param default_text Default text size in points (1/72 of an inch)
#' @param height The desired height of the graphic, in lines of text
#' @param aspect_ratio The desired aspect ratio of the output graphic, as
#' `width / height`
#'
#' @return Two-element list containing the height and width in inches
#' @export
#' @examples
#' # A graphic at 16:9 and 35 lines of text tall
#' device_dimensions(
#'   default_text = 11,
#'   height = 35,
#'   aspect_ratio = 16/9
#' )
device_dimensions <- function(default_text, height, aspect_ratio) {
  list(
    "height" = default_text * height / 72.27,
    "width" = default_text * height / 72.27 * aspect_ratio
  )
}
