#' Helper function used to render code
code_highlight_tag <- function(...) {
  tags$pre(tags$code(class = "language-r", ...))
}

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
            htmlOutput("codigo", container = code_highlight_tag)
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
