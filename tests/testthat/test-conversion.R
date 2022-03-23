test_that("Unit conversion requires a numeric vector", {
    expect_error(
        get_conv_factors("12", "pts", "mm"),
        "is not TRUE"
    )
})


test_that("'get_conv_factors' throws an error when the unit is not recognized", {
    expect_error(
        get_conv_factors(1, "meter", "in"),
        "Unrecognized unit\\(s\\): meter"
    )
})


test_that("'get_conv_factors' throws recycling errors according to vctrs rules", {
    expect_error(
        get_conv_factors(1:5, c("cm", "mm"), "mm")
    )

    expect_equal(
        get_conv_factors(1, c("cm", "mm"), "mm"),
        c(10, 1)
    )

    expect_equal(
        get_conv_factors(1:5, "mm", "mm"),
        rep(1, times = 5)
    )
})


test_that("'get_conv_factors' accepts common alternatives for typical units", {
    expect_equal(
        get_conv_factors(1, "in", "in"),
        get_conv_factors(1, "inch", "in")
    )

    expect_equal(
        get_conv_factors(1, "in", "mm"),
        get_conv_factors(1, "inches", "mm")
    )
})


