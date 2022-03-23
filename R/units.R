#' Convert any units to millimeters
#'
#' @param x A numeric vector
#' @param units A character vector specifying the units for the corresponding
#' numeric values.
#'
#' @return The same number converted to millimeters
#' @export
mm <- function(x, units = "pts") {
    x * get_conv_factors(x, units, "mm")
}


#' Convert from any units to pixels
#'
#' @param x A numeric vector
#' @param units A character vector specifying the units for the corresponding
#'     numeric values.
#' @param res Pixels per inch to use as resulution. Defaults to 96, because this
#'     is a common web font conversion factor.
#' @param round Whether to round to the nearest full pixel. Defaults to `TRUE`.
#'
#' @export
px <- function(x, units = "pts", res = 96, round = TRUE) {
    stopifnot(is.numeric(res))

    conv_factors <- get_conv_factors(x, from_unit = units, to_unit = "in")

    # Convert to inches and then to px
    x_as_in <- x * conv_factors

    if (round) {
        return(round(x_as_in * res, digits = 0))
    } else {
        return(x_as_in * res)
    }
}
