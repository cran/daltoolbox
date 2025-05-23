#'@title Z-score normalization
#'@description Scale data using z-score normalization.
#'
#'\eqn{zscore = (x - mean(x))/sd(x)}
#'@param nmean new mean for normalized data
#'@param nsd new standard deviation for normalized data
#'@return returns the z-score transformation object
#'@examples
#'data(iris)
#'head(iris)
#'
#'trans <- zscore()
#'trans <- fit(trans, iris)
#'tiris <- transform(trans, iris)
#'head(tiris)
#'
#'itiris <- inverse_transform(trans, tiris)
#'head(itiris)
#'@export
zscore <- function(nmean=0, nsd=1) {
  obj <- dal_transform()
  obj$nmean <- nmean
  obj$nsd <- nsd
  class(obj) <- append("zscore", class(obj))
  return(obj)
}


#'@importFrom stats sd
#'@exportS3Method fit zscore
fit.zscore <- function(obj, data, ...) {
  nmean <- obj$nmean
  nsd <- obj$nsd
  zscore <- data.frame(t(ifelse(sapply(data, is.numeric), 1, 0)))
  zscore <- rbind(zscore, rep(NA, ncol(zscore)))
  zscore <- rbind(zscore, rep(NA, ncol(zscore)))
  zscore <- rbind(zscore, rep(NA, ncol(zscore)))
  zscore <- rbind(zscore, rep(NA, ncol(zscore)))
  colnames(zscore) <- colnames(data)
  rownames(zscore) <- c("numeric", "mean", "sd","nmean", "nsd")
  for (j in colnames(zscore)[zscore["numeric",]==1]) {
    zscore["mean",j] <- mean(data[,j], na.rm=TRUE)
    zscore["sd",j] <- stats::sd(data[,j], na.rm=TRUE)
    zscore["nmean",j] <- nmean
    zscore["nsd",j] <- nsd
  }
  obj$norm.set <- zscore

  return(obj)
}

#'@exportS3Method transform zscore
transform.zscore <- function(obj, data, ...) {
  zscore <- obj$norm.set
  for (j in colnames(zscore)[zscore["numeric",]==1]) {
    if ((zscore["sd", j]) > 0) {
      data[,j] <- (data[,j] - zscore["mean", j]) / zscore["sd", j] * zscore["nsd", j] + zscore["nmean", j]
    }
    else {
      data[,j] <- obj$nmean
    }
  }
  return (data)
}

#'@exportS3Method inverse_transform zscore
inverse_transform.zscore <- function(obj, data, ...) {
  zscore <- obj$norm.set
  for (j in colnames(zscore)[zscore["numeric",]==1]) {
    if ((zscore["sd", j]) > 0) {
      data[,j] <- (data[,j] - zscore["nmean", j]) / zscore["nsd", j] * zscore["sd", j] + zscore["mean", j]
    }
    else {
      data[,j] <- zscore["nmean", j]
    }
  }
  return (data)
}
