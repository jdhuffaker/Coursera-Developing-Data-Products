# Author: jdhuffaker
# Date: 12/26/15
# Project Name: Normal Distribution Demonstration
# This app takes user input (mean, standard deviation, and sample size), calculates the coefficient of 
# variation, and generates a histogram with an overlaid nornal density curve.


library(shiny)

ui <- shinyUI(fluidPage(
    numericInput(inputId='Mean', 'Enter the mean (values from 0 to 100):', 50, min = 0, max = 100, step = 1),
    numericInput(inputId='Stdev', 'Enter the standard deviation (values from 1 to 10):', 5, min = 1, max = 10, step = 1),
    h4('Coefficient of Variation = Stdev/Mean*100:'),
    verbatimTextOutput("CoV"),
    sliderInput(inputId="num",
                label="Choose a sample size n (from 30 to 200)",
                value=50,min=30,max=200),

    plotOutput("hist")
))

covar <- function(Mean,Stdev) {round(Stdev/Mean*100,2)}

server <- shinyServer(function(input,output){
    output$CoV <- renderPrint({covar(input$Mean,input$Stdev)})
    output$hist <- renderPlot({
                               title <- "Histogram of n random normal values"
                               hist(rnorm(input$num, mean=input$Mean, sd=input$Stdev),xlab="Values",
                                    col="green",main=title,prob=TRUE)
                               curve(dnorm(x, mean=input$Mean, sd=input$Stdev), add=TRUE)
                           })
})

shinyApp(ui=ui,server=server)
