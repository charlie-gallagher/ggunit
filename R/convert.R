#' Convert points and millimeters
#'
#' [ggplot2::geom_text()] uses millimeters to measure text size, but
#' [ggplot2::element_text()] uses
#' points. Hence, you may wish to convert to one or the other to maintain
#' standard sizes.
#'
#' @param x Numeric vector
#'
#' @return Numeric vector
#' @rdname pt_to_mm
#' @aliases pt_to_mm mm_to_pt
#' @export
pt_to_mm <- function(x) {
  x / ggplot2::.pt
}

#' @rdname pt_to_mm
#' @export
mm_to_pt <- function(x) {
  x * ggplot2::.pt
}
