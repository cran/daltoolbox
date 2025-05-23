% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trans_fit_curvature_max.R
\name{fit_curvature_max}
\alias{fit_curvature_max}
\title{maximum curvature analysis}
\usage{
fit_curvature_max()
}
\value{
returns an object of class fit_curvature_max, which inherits from the fit_curvature and dal_transform classes.
The object contains a list with the following elements:
\itemize{
\item x: The position in which the maximum curvature is reached.
\item y: The value where the the maximum curvature occurs.
\item yfit: The value of the maximum curvature.
}
}
\description{
Fitting a curvature model in a sequence of observations. It extracts the the maximum curvature computed.
}
\examples{
x <- seq(from=1,to=10,by=0.5)
dat <- data.frame(x = x, value = -log(x), variable = "log")
myfit <- fit_curvature_max()
res <- transform(myfit, dat$value)
head(res)
}
