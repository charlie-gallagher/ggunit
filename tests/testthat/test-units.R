test_that("Unit conversion requires a numeric vector", {
    expect_error(
        mm("12", "pts"),
        "is not TRUE"
    )
})

test_that("Unit conversion function works for single-element vectors", {
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

test_that("'mm' throws an error when the unit is not recognized", {
    expect_error(
        mm(1, "meter"),
        "Unrecognized unit\\(s\\): meter"
    )
})


test_that("'mm' throws recycling errors according to vctrs rules", {
    expect_error(
        mm(1:5, c("cm", "mm"))
    )

    expect_equal(
        mm(1, c("cm", "mm")),
        c(10, 1)
    )

    expect_equal(
        mm(1:5, "mm"),
        1:5
    )
})


test_that("'mm' accepts common alternatives for typical units", {
    expect_equal(
        mm(1, "in"),
        mm(1, "inch")
    )

    expect_equal(
        mm(1, "in"),
        mm(1, "inches")
    )
})


