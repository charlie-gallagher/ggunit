#' Get default text size for a graphic
#'
#' Given the size of a graphic and the desired height in lines, returns the text
#' size in points to use as the default text size.
#'
#' @param height Height of the graphic.
#' @param lines Desired number of lines tall the graphic will be.
#' @param units Units in which height and width are given. Only "in", "cm", and
#'   "mm" are currently supported.
#' @param round Logical, whether to round the output to the nearest point.
#' Defaults to `TRUE`.
#'
#' @return Size of font in points, rounded to the nearest integer
#' @export
#' @examples
#' # Find the appropriate default text size for a graphic that fills a whole
#' # 8.5x11 sheet of paper.
#' text_dimensions(height = 8.5,
#'                 lines = 45,
#'                 units = "in")
text_dimensions <- function(height,
                            lines,
                            units = "in",
                            round = TRUE) {
    height <- switch(units,
        "in" = height,
        "cm" = height / 2.54,
        "mm" = height / 25.4
    )

    out <- height / lines * 72.27

    if (round) {
        out <- round(out, digits = 0)
    }

    out
}
