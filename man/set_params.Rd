% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dal_base.R
\name{set_params}
\alias{set_params}
\title{Assign parameters}
\usage{
set_params(obj, params)
}
\arguments{
\item{obj}{object of class dal_base}

\item{params}{parameters to set obj}
}
\value{
returns an object with parameters set
}
\description{
set_params function assigns all parameters to the attributes presented in the object.
}
\examples{
obj <- set_params(dal_base(), list(x = 0))
}
