library(shiny)

tails <- list("F(y) or the 'left tail'"="left",
               "1-F(y) or the 'right tail'"="right")
               
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Probabilities from Normal Distributions"),

  # Sidebar with a slider input for number of observations
  sidebarPanel(
  
    radioButtons("typeTail",label="",choices=tails),
    br(),
    numericInput("y", "y:", min = -6, max = 6, value = 1, step=0.01),
    br(),
    numericInput("mean", "Mu:", min = -10, max = 10, value = 0, step=0.1),
    numericInput("sd", "Sigma:", min = 0.01, max = 10, value = 1, step=0.1)
    
  ),

  mainPanel(plotOutput("normal_pdf_plot")
  )
))

