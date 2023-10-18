function() {
  fluidPage(
    title = "Ejemplo 2",
    theme = bs_theme(
      bootswatch = "simplex"
    ),
    tags$head(
      tags$link(
        rel = "stylesheet",
        type = "text/css",
        href = "styles.css"
      ),
      # Prism usado para resaltar codigo
      tags$link(
        rel = "stylesheet",
        type = "text/css",
        href = "prism.css"
      ),
      tags$script(
        src = "prism.js"
      ),
      shinyjs::useShinyjs()
    ),
    fluidRow(
      div(
        class = "custom-header",
        "Ejemplo 2 - Sin usar módulos ni box"
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
            htmlOutput("codigo", container = utils$code_highlight_tag)
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
