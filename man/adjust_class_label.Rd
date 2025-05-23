% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dal_adjust.R
\name{adjust_class_label}
\alias{adjust_class_label}
\title{Adjust categorical mapping}
\usage{
adjust_class_label(x, valTrue = 1, valFalse = 0)
}
\arguments{
\item{x}{vector to be categorized}

\item{valTrue}{value to represent true}

\item{valFalse}{value to represent false}
}
\value{
returns an adjusted categorical mapping
}
\description{
Converts a vector into a categorical mapping, where each category is represented by a specific value.
By default, the values represent binary categories (true/false)
}
