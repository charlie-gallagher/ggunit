## code to prepare `unit_conv` dataset goes here
pts <- 1 / ggplot2::.pt
bigpts <- 2.54/72
picas <- pts / 12
dida <- 1157 * pts / 1238
cicero <- dida / 12

dida_to_in <- 1157/1238/72.27
cicero_to_in <- dida_to_in / 12

unit_conv <- data.frame(
    unit = c("cm", "centimeter", "centimeters", "centimetre", "centimetres",
             "in", "inch", "inches",
             "mm", "millimeter", "millimeters", "millimetre", "millimetres",
             "pt", "pts", "point", "points",
             "picas", "bigpts", "dida", "cicero", "scaledpts"),
    conv_to_mm = c(10, 10, 10, 10, 10,
                   25.4, 25.4, 25.4,
                   1, 1, 1, 1, 1,
                   pts, pts, pts, pts,
                   picas, bigpts, dida, cicero, pts/65536),
    conv_to_in = c(2.54, 2.54, 2.54, 2.54, 2.54,
                   1, 1, 1,
                   25.4, 25.4, 25.4, 25.4, 25.4,
                   1/72.27, 1/72.27, 1/72.27, 1/72.27,
                   1/6, 1/72, dida_to_in, cicero_to_in, 1/65536),
    stringsAsFactors = FALSE
)

usethis::use_data(unit_conv, overwrite = TRUE, internal = TRUE)
