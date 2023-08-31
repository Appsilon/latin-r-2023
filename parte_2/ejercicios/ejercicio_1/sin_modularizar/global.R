library(shiny)
library(bslib)

#' Normalizes data
normalize_data <- function(data) {
  data - mean(data) / sd(data)
}

#' Format the input as code
format_as_code <- function(code) {
  paste(code, collapse = "\n")
}
