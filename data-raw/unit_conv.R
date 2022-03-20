## code to prepare `unit_conv` dataset goes here
pts <- 1 / ggplot2::.pt
bigpts <- 2.54/72
picas <- pts / 12
dida <- 1157 * pts / 1238
cicero <- dida / 12

unit_conv <- data.frame(
    unit = c("cm", "centimeter", "centimeters", "centimetre", "centimetres",
             "in", "inch", "inches",
             "mm", "millimeter", "millimeters", "millimetre", "millimetres",
             "pts", "point", "points",
             "picas", "bigpts", "dida", "cicero", "scaledpts"),
    conv_to_mm = c(10, 10, 10, 10, 10,
                   25.4, 25.4, 25.4,
                   1, 1, 1, 1, 1,
                   pts, pts, pts,
                   picas, bigpts, dida, cicero, pts/65536),
    stringsAsFactors = FALSE
)

usethis::use_data(unit_conv, overwrite = TRUE, internal = TRUE)
