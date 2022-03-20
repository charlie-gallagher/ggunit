#' Convert any units to millimeters
#'
#' @param x A numeric vector
#' @param units A character vector specifying the units for the corresponding
#' numeric values.
#'
#' @return The same number converted to millimeters
#' @export
mm <- function(x, units = "pts") {
    stopifnot(is.numeric(x))

    # Recycle
    recycled_elements <- vctrs::vec_recycle_common(x, units)
    x <- recycled_elements[[1]]
    units <- recycled_elements[[2]]

    # Get conversion factors
    conv_factors <- unit_conv$conv_to_mm[match(units, unit_conv$unit)]

    caught_errors <- units[is.na(conv_factors)]
    if (length(caught_errors) != 0) {
        caught_errors <- paste(caught_errors, collapse = ", ")
        stop("Unrecognized unit(s): ", caught_errors)
    }

    x * conv_factors
}
