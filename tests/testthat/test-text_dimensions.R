test_that("text_dimensions works as expected", {
    dims_1 <- text_dimensions(
        height = 10,
        lines = 50,
        units = "in"
    )

    expect_type(
        dims_1,
        "double"
    )

    expect_equal(
        dims_1,
        14L
    )

})

test_that("text_dimensions requires a numeric input", {
    expect_error(
        text_dimensions(height = "50", lines = 10)
    )
})

test_that("text_dimensions handles centimeters and millimeters", {
    expect_equal(
        text_dimensions(
            height = 25,
            lines = 10,
            units = "cm"
        ),
        71L
    )

    expect_equal(
        text_dimensions(
            height = 25,
            lines = 10,
            units = "mm"
        ),
        7L
    )
})

test_that("Text dimensions rounding can be turned off", {
    expect_equal(
        text_dimensions(
            height = 25,
            lines = 10,
            units = "mm",
            round = FALSE
        ),
        (25 / 25.4) / 10 * 72.27
    )
})
