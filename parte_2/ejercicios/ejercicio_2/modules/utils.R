box::use(
  shiny[tags, ],
  stats[sd, ],
)

#' Helper function used to render code
#' @export
code_highlight_tag <- function(...) {
  tags$pre(
    tags$code(class = "language-r", ...)
  )
}

#' Normalizes data
#' @export
normalize_data <- function(data) {
  data - mean(data) / sd(data)
}

#' Format the input as code
#' @export
format_as_code <- function(code) {
  code <- c(" ", code)
  paste(code, collapse = "\n")
}
