#' Save a file quickly with ggunit
#'
#' This function is called for its side-effects. It wraps `ggplot2::ggsave()`
#' to allow you save without first running `device_dimensions()`.
#'
#' @param ... Passed to ggsave. Note that `height` and `width` are generated
#' by this function.
#' @param default_text default text size
#' @param height Height of the graphic in lines
#' @param aspect_ratio Aspect ratio in the form width/height
#'
#' @export
ggunit_save <- function(..., default_text = 11, height, aspect_ratio) {
    dims <- device_dimensions(default_text, height, aspect_ratio)

    ggplot2::ggsave(
        ...,
        height = dims[["height"]],
        width = dims[["width"]],
        units = "in"
    )
}
