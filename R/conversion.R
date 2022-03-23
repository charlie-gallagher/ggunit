#' Convert from one unit to another using the internal lookup
#'
#' @param x Numeric vector
#' @param from_unit Unit to use as "from"
#' @param to_unit Unit to use as "to". Must be a column suffix in the unit_conv
#' data.frame.
#'
#' @noRd
get_conv_factors <- function(x, from_unit, to_unit) {
    stopifnot(is.numeric(x))
    to_unit <- paste0("conv_to_", to_unit)

    # Recycle
    recycled_elements <- vctrs::vec_recycle_common(x, from_unit)
    x <- recycled_elements[[1]]
    from_unit <- recycled_elements[[2]]

    # Get conversion factors to inches
    conv_factors <- unit_conv[[to_unit]][match(from_unit, unit_conv$unit)]

    caught_errors <- from_unit[is.na(conv_factors)]
    if (length(caught_errors) != 0) {
        caught_errors <- paste(caught_errors, collapse = ", ")
        stop("Unrecognized unit(s): ", caught_errors)
    }

    conv_factors
}
