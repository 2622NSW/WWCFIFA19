library(shiny)
library(ggplot2)
df <- read.csv("GKWWC.csv")
    ui <- fluidPage(
        titlePanel("Goalkeepers at the FIFA Women's World Cup 2019"),
        sidebarLayout(
            sidebarPanel(
                selectInput(inputId = "x",
                            label = "Horizontal Axis",
                            choices = c("Game Identifier" ="ID", 
                            "Goalkeeper Name" = "Name", "Goalkeeper Height" = "Height",
                            "Goalkeeper Country" = "Country", "Game" =
                                        "Fixture", "Game Result" = "Result"),
                            selected = "ID"),
                selectInput(inputId = "y",
                            label = "Vertical Axis",
                            choices = c("Game Identifier" ="ID", 
                                        "Goalkeeper Name" = "Name", "Goalkeeper Height" = "Height",
                                        "Goalkeeper Country" = "Country", "Game" =
                                            "Fixture", "Game Result" = "Result"),
                            selected = "Name")
            ),
            mainPanel(
                plotOutput(outputId = "scatterplot"),
                plotOutput(outputId = "densityplot", height = 150, 
                           )
            )
        )
    )
server <- function(input, output) {
    output$scatterplot <- renderPlot({
        ggplot(data = df, aes_string(x = input$x, y = input$y)) +
            geom_point()
    })
    output$densityplot <- renderPlot({
        ggplot(data = df, aes_string(x = input$x)) +
            geom_density(color="black", fill="#8856a7")
    })
}
shinyApp(ui = ui, server = server)
