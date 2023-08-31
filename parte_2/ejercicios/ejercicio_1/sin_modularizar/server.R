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
    tags$code(format_as_code(archivo_leido), class = "language-r")
  })

  # Resaltando codigo
  observeEvent(input$archivo, {
    shinyjs::runjs(
      'setTimeout( () => {hljs.highlightElement(document.getElementById("codigo"))}, 100)'
    )
  })
}
