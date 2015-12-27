library(shiny)

covar <- function(Mean,Stdev) {round(Stdev/Mean*100,2)}

shinyServer(function(input,output){
    output$CoV <- renderPrint({covar(input$Mean,input$Stdev)})
    output$hist <- renderPlot({
        title <- "Histogram of n random normal values"
        hist(rnorm(input$num, mean=input$Mean, sd=input$Stdev),xlab="Values",
             col="green",main=title,prob=TRUE)
        curve(dnorm(x, mean=input$Mean, sd=input$Stdev), add=TRUE)
    })
})

