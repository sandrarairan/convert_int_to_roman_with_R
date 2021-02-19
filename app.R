

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Conversión a número romano"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("integer",
                        "Number of integer:",
                        min = 1,
                        max = 1000,
                        value = 10),
            actionButton("convertir", "Convertir"),
           # verbatimTextOutput("value")
            
        ),

       
        mainPanel(
           
           h4("Convertir Entero a Romano"),
           textOutput("romano")
    
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    source("prueba_1.R")
    
    value <- eventReactive( input$convertir ,{
        convert_int_to_roman(input$integer)
    })
    

    output$romano <- renderPrint({
        
        paste0("El Número entero:", input$integer, " ","es el Número Romano:", value())
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
