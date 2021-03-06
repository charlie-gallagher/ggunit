% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/text_dimensions.R
\name{text_dimensions}
\alias{text_dimensions}
\title{Get default text size for a graphic}
\usage{
text_dimensions(height, lines, units = "in", round = TRUE)
}
\arguments{
\item{height}{Height of the graphic.}

\item{lines}{Desired number of lines tall the graphic will be.}

\item{units}{Units in which height and width are given. Only "in", "cm", and
"mm" are currently supported.}

\item{round}{Logical, whether to round the output to the nearest point.
Defaults to \code{TRUE}.}
}
\value{
Size of font in points, rounded to the nearest integer
}
\description{
Given the size of a graphic and the desired height in lines, returns the text
size in points to use as the default text size.
}
\examples{
# Find the appropriate default text size for a graphic that fills a whole
# 8.5x11 sheet of paper.
text_dimensions(height = 8.5,
                lines = 45,
                units = "in")
}
