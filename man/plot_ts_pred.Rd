% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graphics.R
\name{plot_ts_pred}
\alias{plot_ts_pred}
\title{Plot a time series chart}
\usage{
plot_ts_pred(
  x = NULL,
  y,
  yadj,
  ypred = NULL,
  label_x = "",
  label_y = "",
  color = "black",
  color_adjust = "blue",
  color_prediction = "green"
)
}
\arguments{
\item{x}{time index}

\item{y}{time series}

\item{yadj}{adjustment of time series}

\item{ypred}{prediction of the time series}

\item{label_x}{x-axis title}

\item{label_y}{y-axis title}

\item{color}{color for the time series}

\item{color_adjust}{color for the adjusted values}

\item{color_prediction}{color for the predictions}
}
\value{
ggplot graphic
}
\description{
The function receives six variables as a parameter, which are obj and y, yadj, main and xlabels. The graph is plotted with 3 lines: the original series (in black), the adjusted series (in blue) and the predicted series (in green)
}
\examples{
data(sin_data)
ts <- ts_data(sin_data$y, 0)
ts_head(ts, 3)


samp <- ts_sample(ts, test_size= 5)
io_train <- ts_projection(samp$train)
io_test <- ts_projection(samp$test)

model <- ts_arima()
model <- fit(model, x=io_train$input, y=io_train$output)
adjust <- predict(model, io_train$input)

prediction <- predict(model, x=io_test$input, steps_ahead=5)
prediction <- as.vector(prediction)

yvalues <- c(io_train$output, io_test$output)
grf <- plot_ts_pred(y=yvalues, yadj=adjust, ypre=prediction)
plot(grf)
}
