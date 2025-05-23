% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trans_smoothing_inter.R
\name{smoothing_inter}
\alias{smoothing_inter}
\title{Smoothing by interval}
\usage{
smoothing_inter(n)
}
\arguments{
\item{n}{number of bins}
}
\value{
returns an object of class \code{smoothing_inter}
}
\description{
The "smoothing by interval" function is used to apply a smoothing technique to a vector or time series data using a moving window approach.
}
\examples{
data(iris)
obj <- smoothing_inter(n = 2)
obj <- fit(obj, iris$Sepal.Length)
sl.bi <- transform(obj, iris$Sepal.Length)
table(sl.bi)
obj$interval

entro <- evaluate(obj, as.factor(names(sl.bi)), iris$Species)
entro$entropy
}
