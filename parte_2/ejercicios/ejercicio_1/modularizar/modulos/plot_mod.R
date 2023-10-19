library(shiny)

#' Normalizes data
normalize_data <- function(data) {
  (data - mean(data)) / sd(data)
}

plot_ui <- function(id) {
  ns <- NS(id)
  div(
    plotOutput(outputId = ns("sepalo")),
    plotOutput(outputId = ns("petalo"))
  )
}

plot_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
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
  })
}
