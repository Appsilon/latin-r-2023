function() {
  fluidPage(
    title = "Ejemplo 1",
    theme = bs_theme(
      bootswatch = "simplex"
    ),
    tags$head(
      tags$link(
        rel = "stylesheet",
        type = "text/css",
        href = "styles.css"
      ),
      tags$link(
        rel = "stylesheet",
        href = "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.8.0/styles/default.min.css"
      ),
      tags$script(
        src = "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.8.0/highlight.min.js"
      ),
      shinyjs::useShinyjs()
    ),
    fluidRow(
      div(
        class = "custom-header",
        "Ejemplo 1 - Sin usar módulos"
      ),
      fluidRow(
        column(
          width = 6,
          div(
            class = "mt-2",
            selectInput(
              inputId = "archivo",
              label = "Seleccionar archivo",
              choices = NULL
            )
          ),
          div(
            class = "custom-code",
            htmlOutput("codigo", container = tags$pre)
          )
        ),
        column(
          width = 6,
          plotOutput(outputId = "sepalo"),
          plotOutput(outputId = "petalo")
        )
      )
    )
  )
}
