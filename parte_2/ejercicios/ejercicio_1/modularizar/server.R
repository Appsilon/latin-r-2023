

#' Format the input as code
format_as_code <- function(code) {
  code <- c(" ", code)
  paste(code, collapse = "\n")
}

function(input, output, session) {

  plot_server(id = ns("modulo_plantas"))

  # Leyendo archivos
  updateSelectInput(
    inputId = "archivo",
    choices = list.files(recursive = TRUE, pattern = "*.R")
  )

  # Renderizando codigo
  output$codigo <- renderUI({
    archivo_leido <- readLines(input$archivo)
    format_as_code(archivo_leido)
  })

  # Resaltando codigo
  observeEvent(input$archivo, {
    shinyjs::runjs(
      'setTimeout( () => {Prism.highlightElement(document.getElementById("codigo"))}, 100)'
    )
  })
}
