% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graphics.R
\name{plot_ts}
\alias{plot_ts}
\title{Plot time series chart}
\usage{
plot_ts(x = NULL, y, label_x = "", label_y = "", color = "black")
}
\arguments{
\item{x}{input variable}

\item{y}{output variable}

\item{label_x}{x-axis label}

\item{label_y}{y-axis label}

\item{color}{color for time series}
}
\value{
returns a ggplot graphic
}
\description{
This function plots a time series chart with points and a line using ggplot2.
}
\examples{
x <- seq(0, 10, 0.25)
data <- data.frame(x, sin=sin(x))
head(data)

grf <- plot_ts(x = data$x, y = data$sin, color=c("red"))
plot(grf)
}
