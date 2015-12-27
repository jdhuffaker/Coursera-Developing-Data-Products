library(shiny)

shinyUI(fluidPage(
    numericInput(inputId='Mean', 'Enter the mean (values from 0 to 100):', 50, min = 0, max = 100, step = 1),
    numericInput(inputId='Stdev', 'Enter the standard deviation (values from 1 to 10):', 5, min = 1, max = 10, step = 1),
    h4('Coefficient of Variation = Stdev/Mean*100:'),
    verbatimTextOutput("CoV"),
    sliderInput(inputId="num",
                label="Choose a sample size n (from 30 to 200)",
                value=50,min=30,max=200),
    
    plotOutput("hist")
))
