function(input, output, session) {

  output$sepalo <- renderPlot({
    plot(
      x = utils$normalize_data(iris$Sepal.Length),
      y = utils$normalize_data(iris$Sepal.Width),
      main = "Sépalos",
      xlab = "Largo",
      ylab = "Ancho"
    )
  })

  output$petalo <- renderPlot({
    plot(
      x = utils$normalize_data(iris$Petal.Length),
      y = utils$normalize_data(iris$Petal.Width),
      main = "Pétalos",
      xlab = "Largo",
      ylab = "Ancho"
    )
  })


  # Leyendo archivos
  updateSelectInput(
    inputId = "archivo",
    choices = list.files(recursive = TRUE, pattern = "*.R$")
  )

  # Renderizando codigo
  output$codigo <- renderUI({
    archivo_leido <- readLines(input$archivo)
    utils$format_as_code(archivo_leido)
  })

  # Resaltando codigo
  observeEvent(input$archivo, {
    shinyjs::runjs(
      'setTimeout( () => {Prism.highlightElement(document.getElementById("codigo"))}, 100)'
    )
  })  
}
