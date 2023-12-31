% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dal_tune.R
\name{select_hyper}
\alias{select_hyper}
\title{Selection hyper parameters}
\usage{
select_hyper(obj, hyperparameters)
}
\arguments{
\item{obj}{object}

\item{hyperparameters}{data set with hyper parameters and quality measure from execution}
}
\value{
index of selected hyper parameter
}
\description{
Selection hyper parameters from a k-fold cross-validation execution
}
