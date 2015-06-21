#ui.R
library(shiny)
shinyUI(
    
    pageWithSidebar(
        # Application title
        headerPanel("Quadratic equation"),        
        sidebarPanel(
            helpText("This app is part of the project for Developing Data Products in the Coursera Data Science Specialization. It's a simple app that calculate the root of a quadratic equation and makes a plot of it. Only need the coefficients of the equation and a range for the plot.");
            withMathJax(helpText('Please enter the coefficients $$a_0, a_1, a_2$$ of the quadratic equation $$a_0 + a_1x + a_2x^2$$')),
            numericInput(inputId = 'a0', label = 'a_0', value = 1),
            numericInput(inputId = 'a1', label = 'a_1', value = 2),
            numericInput(inputId = 'a2', label = 'a_2', value = 1),
            h4('Enter a range in which you want to see the plot of the equation:'),
            numericInput(inputId = 'from', label = 'from', value = -5),
            numericInput(inputId = 'to', label = 'to', value = 5),
            submitButton('Submit')
        ),
        mainPanel(
            h3('Results'),
            h4('You entered'),
            verbatimTextOutput("inputValue"),
            h4('Which roots are:  '),
            verbatimTextOutput("prediction"),
            h4('and the plot is:  '),
            plotOutput('newPlot')
        )
    )
)