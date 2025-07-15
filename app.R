#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


# Define UI for application that draws a histogram
library(shiny)
library(ggplot2)
library(dplyr)
coffee_pop <- read.csv("coffee population.csv")
coffee_pop$How.many.cups.of.coffee.do.you.typically.drink.per.day. <- 
  recode_factor(
    coffee_pop$How.many.cups.of.coffee.do.you.typically.drink.per.day.,
    "Less than 1" = "0", "More than 4" = "5"
  )
# Define UI for application that draws a histogram
ui <- fluidPage(sidebarLayout(
  sidebarPanel(width = 5,
               fluidPage(
                 fluidRow(
                   selectInput(inputId="age_ranges", label="Age Ranges", 
                               choices = c("<18 years old", "18-24 years old",
                                           "25-34 years old", 
                                           "35-44 years old",
                                           "45-54 years old",
                                           "55-64 years old",
                                           ">65 years old"))),
                 fluidRow(selectInput(inputId="color", label="Color of Graph", choices=c("darkblue", "limegreen", "pink", "brown", "purple", "cyan", "lightblue"))),
                 fluidRow(
                   checkboxInput(inputId="box1", label="Display Density Plot of All Adults in the United States")),
                 fluidRow(
                   checkboxInput(inputId="box2", label="Display Mean and Standard Deviation")),
                 fluidRow(textOutput("caption1")),
                 fluidRow(
                   textInput(inputId = "title",
                             label = "Plot title",
                             placeholder = "Add a title here!")))),
  mainPanel(width = 7,
            plotOutput("plot1"),
            plotOutput("plot2"))
  
))


server <- function(input, output) {
  output$plot1 <- renderPlot({
    data <- filter(coffee_pop, What.is.your.age. == input$age_ranges)
    ggplot(data,
           aes(x=as.numeric(data$How.many.cups.of.coffee.do.you.typically.drink.per.day.), 
               fill=What.is.your.age.)) + geom_density(alpha=0.3, 
                                                       fill=input$color) + 
      xlab("Number of Cups of Coffee") + ylab("Density") +
      ggtitle(input$title)
      
  })
  output$plot2 <- renderPlot({
    if (input$box1 == TRUE){
      ggplot(coffee_pop, aes(x=as.numeric(coffee_pop$How.many.cups.of.coffee.do.you.typically.drink.per.day.))) + geom_density() +
        xlab("Number of Cups of Coffee Consumed") + 
        ylab("Density") + ggtitle("Density Plot of Number of Cups of Coffee Consumed")
    }
  })
  output$caption1 <- renderText({
    if(input$box2 == TRUE) {
      data <- filter(coffee_pop, What.is.your.age. == input$age_ranges)
      x_var <- data$What.is.your.age
      y_var <- as.numeric(data$How.many.cups.of.coffee.do.you.typically.drink.per.day.)
      mean_cups <- round(mean(y_var, na.rm=TRUE), 1)
      sd_cups <- round(sd(y_var, na.rm=TRUE),1)
      paste("The mean number of cups of coffee consumed by", x_var[1], "is", mean_cups ,"cups.", "The standard deviation the number of cups of coffee consumed by", x_var[1], "is", sd_cups, "cups."
      )
      }
    })
}

shinyApp(ui = ui, server = server)
