test_that("'mm' unit conversion function works for single-element vectors", {
    expect_equal(
        mm(12, "pts"),
        12 / ggplot2::.pt
    )

    expect_equal(
        mm(10, "mm"),
        10
    )

    expect_equal(
        mm(10, "cm"),
        100
    )

    expect_equal(
        mm(10, "bigpts"),
        1 / 72 * 25.4
    )

    expect_equal(
        mm(5, "in"),
        25.4 * 5
    )
})


test_that("'px' unit conversion function works for single-element vectors", {
    expect_equal(
        px(x = 12, units = "pts", res = 96, round = TRUE),
        16
    )

    # Run through a few different resolutions
    for (i in c(5, 25, 75, 105, 1000)) {
        expect_equal(
            px(x = 12, units = "in", res = i, round = FALSE),
            12 * i
        )
    }

    # Check another type of unit
    expect_equal(
        px(x = 1, units = "mm", res = 100, round = FALSE),
        25.4 * 100
    )
})
