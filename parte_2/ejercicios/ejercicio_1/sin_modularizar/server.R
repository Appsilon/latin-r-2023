#' Normalizes data
normalize_data <- function(data) {
  data - mean(data) / sd(data)
}

#' Format the input as code
format_as_code <- function(code) {
  code <- c(" ", code)
  paste(code, collapse = "\n")
}

function(input, output, session) {

  output$sepalo <- renderPlot({
    plot(
      x = normalize_data(iris$Sepal.Length),
      y = normalize_data(iris$Sepal.Width),
      main = "Sépalos",
      xlab = "Largo",
      ylab = "Ancho"
    )
  })

  output$petalo <- renderPlot({
    plot(
      x = normalize_data(iris$Petal.Length),
      y = normalize_data(iris$Petal.Width),
      main = "Pétalos",
      xlab = "Largo",
      ylab = "Ancho"
    )
  })


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
