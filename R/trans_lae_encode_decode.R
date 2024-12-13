#'@title LSTM Autoencoder - Decode
#'@description Creates an deep learning LSTM autoencoder to encode a sequence of observations.
#' It wraps the pytorch library.
#'@param input_size input size
#'@param encoding_size encoding size
#'@param batch_size size for batch learning
#'@param num_epochs number of epochs for training
#'@param learning_rate learning rate
#'@return returns a `lae_encode_decode` object.
#'@examples
#'#See an example of using `lae_encode_decode` at this
#'#[link](https://github.com/cefet-rj-dal/daltoolbox/blob/main/transf/lae_enc_decode.ipynb)
#'@import reticulate
#'@export
lae_encode_decode <- function(input_size, encoding_size, batch_size = 32, num_epochs = 50, learning_rate = 0.001) {
  obj <- dal_transform()
  obj$input_size <- input_size
  obj$encoding_size <- encoding_size
  obj$batch_size <- batch_size
  obj$num_epochs <- num_epochs
  obj$learning_rate <- learning_rate
  class(obj) <- append("lae_encode_decode", class(obj))

  return(obj)
}

#'@export
fit.lae_encode_decode <- function(obj, data, ...) {
  if (!exists("lae_create"))
    reticulate::source_python(system.file("python", "lstm_autoencoder.py", package = "daltoolbox"))

  if (is.null(obj$model))
    obj$model <- lae_create(obj$input_size, obj$encoding_size)

  obj$model <- lae_fit(obj$model, data, num_epochs = obj$num_epochs, learning_rate = obj$learning_rate)
  print('test')
  
  return(obj)
}

#'@export
transform.lae_encode_decode <- function(obj, data, ...) {
  if (!exists("lae_create"))
    reticulate::source_python(system.file("python", "lstm_autoencoder.py", package = "daltoolbox"))

  result <- NULL
  if (!is.null(obj$model))
    result <- lstm_encode_decode(obj$model, data)
  return(result)
}
