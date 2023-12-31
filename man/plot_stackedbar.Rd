% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graphics.R
\name{plot_stackedbar}
\alias{plot_stackedbar}
\title{plot stacked bar}
\usage{
plot_stackedbar(data, label_x = "", label_y = "", colors = NULL, alpha = 1)
}
\arguments{
\item{data}{data.frame contain x, value, and variable}

\item{label_x}{x-axis label}

\item{label_y}{y-axis label}

\item{colors}{color vector}

\item{alpha}{level of transparency}
}
\value{
ggplot graphic
}
\description{
plot stacked bar
}
\examples{
data <- iris |> dplyr::group_by(Species) |>
 dplyr::summarize(Sepal.Length=mean(Sepal.Length), Sepal.Width=mean(Sepal.Width))
grf <- plot_stackedbar(data, colors=c("blue", "red"))
plot(grf)
}
