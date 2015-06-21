#server.R
library(shiny)

shinyServer(
    function(input, output) {
        output$inputValue <- renderPrint({paste(input$a0,' + ',input$a1,'x + ',input$a2,'x^2',sep = '')})
        output$prediction <- renderPrint({polyroot(c(input$a0,input$a1,input$a2))})
        
        output$newPlot <- renderPlot({
            x<-seq(from = input$from,to = input$to,by = (input$to-input$from)/100)
            y<-input$a0 + input$a1*x + input$a2*x^2
            plot(x,y,type="n")
            lines(x,y)
        })
    }
)