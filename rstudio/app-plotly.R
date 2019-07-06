#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(httr)
library(splitstackshape) # for the text to colummns
library(reshape2) 
library(devtools) 
library(plotly)
library(shinydashboard)

packageVersion('plotly')

devtools::install_github(repo = 'IBMDataScience/R4WML')
library(R4WML)

watson_ml_creds_url      <- 'https://us-south.ml.cloud.ibm.com'
watson_ml_creds_username <- '59f50ecd-4ee3-4410-a687-077315fa06c3'
watson_ml_creds_password <- '31dbf7ca-13bc-4b59-97ad-93db13a5c5f3' 

ml_endpoint.model        <- 'https://us-south.ml.cloud.ibm.com/v3/wml_instances/1f796ca3-54a1-494b-8e35-6dde99cf5888/deployments/70d4fe4c-48b8-46ba-bf09-0d97e87b084e/online'

watson_ml_creds_auth_headers <- get_wml_auth_headers(watson_ml_creds_url, watson_ml_creds_username, watson_ml_creds_password)


# Define UI for application that draws a histogram
ui <-  dashboardPage(
  dashboardHeader(title = "THE CLOUD BANK"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Prediction", tabName = "Prediction", icon = icon("dashboard")),
      menuItem("Explainability", tabName = "Explainability", icon = icon("th"))
    )
  ),
  
  dashboardBody(
    
    # Application title
    
    # Sidebar with a slider input for number of bins 
    
    tabItems(
      # First tab content
      tabItem(tabName = "Prediction",
              sidebarLayout(
                sidebarPanel(
                  
                  numericInput("sales", 
                               "Sales Price", 
                               value = 50000),  
                  
                  selectInput("location", label = "Location", 
                              choices = list("Sharjah" = 100, "Dubai" = 101, "Ajman" = 110, "Abu Dhabi" = 111, "Ras al Khaimah" = 120, "Fujairah" = 121, "Umm Al Quwain" = 130, "Al Ain" = 319, "Others" = 131), 
                              selected = 1),
                  
                  numericInput("income", 
                               "Income", 
                               value = 5000),
                  
                  radioButtons("applied", label = "Applied Online",
                               choices = list("Yes" = "YES", "No" = "NO"), 
                               selected = "YES"),  
                  
                  radioButtons("residence", label = "Residence",
                               choices = list("Owner Occupier" = "Owner Occupier", "Living with Parents" = "Living with Parents", "Private Renting" = "Private Renting", "Public Housing" = "Public Housing", "Sheltered" = "Sheltered"), 
                               selected = "Owner Occupier"), 
                  
                  sliderInput("address",
                              "Years at current address:",
                              min = 1,
                              max = 50,
                              value = 10), 
                  
                  sliderInput("employer",
                              "Years with current employer:",
                              min = 1,
                              max = 50,
                              value = 30),   
                  
                  radioButtons("cards", label = "Number of Cards",
                               choices = list("1" = 1, "2" = 2, "3"= 3, "4"= 4), 
                               selected = 1), 
                  
                  numericInput("credit", 
                               "Credit Debt", 
                               value = 200), 
                  
                  radioButtons("loan", label = "Loan",
                               choices = list("Yes" = 1, "No" = 0), 
                               selected = 1),
                  
                  numericInput("amount", 
                               "Loan Amount", 
                               value = 2000)
                  
                  
                  
                  
                  
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                  
                  img(src='mortgage.png', align = "right", height = 300, weight = 300),
                  tabsetPanel(
                    tabPanel("Prediction", plotlyOutput("plot"))
                    
                  ), 
                  br(),
                  br(),
                  h2("The graph above explains the results retrieved from the mortgage prediction model on ICP for Data"), 
                  br(),
                  HTML('<center><img src="cloud_watson.png" width="210" height="200"></center>')
                )
                
              )), 
      
      tabItem(tabName = "Explainability",
              sidebarLayout(
                sidebarPanel(
                  
                  numericInput("sales", 
                               "Sales Price", 
                               value = 50000),  
                  
                  selectInput("location", label = "Location", 
                              choices = list("Sharjah" = 100, "Dubai" = 101, "Ajman" = 110, "Abu Dhabi" = 111, "Ras al Khaimah" = 120, "Fujairah" = 121, "Umm Al Quwain" = 130, "Al Ain" = 319, "Others" = 131), 
                              selected = 1),
                  
                  numericInput("income", 
                               "Income", 
                               value = 5000),
                  
                  radioButtons("applied", label = "Applied Online",
                               choices = list("Yes" = "YES", "No" = "NO"), 
                               selected = "YES"),  
                  
                  radioButtons("residence", label = "Residence",
                               choices = list("Owner Occupier" = "Owner Occupier", "Living with Parents" = "Living with Parents", "Private Renting" = "Private Renting", "Public Housing" = "Public Housing", "Sheltered" = "Sheltered"), 
                               selected = "Owner Occupier"), 
                  
                  sliderInput("address",
                              "Years at current address:",
                              min = 1,
                              max = 50,
                              value = 10), 
                  
                  sliderInput("employer",
                              "Years with current employer:",
                              min = 1,
                              max = 50,
                              value = 30),   
                  
                  radioButtons("cards", label = "Number of Cards",
                               choices = list("1" = 1, "2" = 2, "3"= 3, "4"= 4), 
                               selected = 1), 
                  
                  numericInput("credit", 
                               "Credit Debt", 
                               value = 200), 
                  
                  radioButtons("loan", label = "Loan",
                               choices = list("Yes" = 1, "No" = 0), 
                               selected = 1),
                  
                  numericInput("amount", 
                               "Loan Amount", 
                               value = 2000)
                  
                  
                  
                  
                  
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                  
                  img(src='mortgage.png', align = "right", height = 300, weight = 300),
                  tabsetPanel(
                    tabPanel("Explainability",plotlyOutput("plot2")) 
                    
                  ), 
                  br(),
                  br(),
                  h2("The graph above explains the results retrieved from the mortgage prediction model on Watson Studio"), 
                  br(),
                  HTML('<center><img src="cloud_watson.png" width="210" height="200"></center>')
                )
                
              )) 
      
    ))
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  
  
  
  output$plot <- renderPlotly({
    payload1 <- paste0('{"fields":["Income","AppliedOnline","Residence","YearCurrentAddress","YearsCurrentEmployer","NumberOfCards","CCDebt","Loans","LoanAmount","SalePrice","Location"],"values":[[', input$income, ',"', input$applied, '","', input$residence, '",' , input$address, ',' , input$employer, ',' , input$cards, ',' , input$credit, ',' , input$loan, ',', input$amount, ',', input$sales, ',', input$location, ']]}' ) 
    print(payload1)
    results <- wml_score(ml_endpoint.model, watson_ml_creds_auth_headers, payload1) 
    print(results$values[2]) 
    print(results$values[1])
    yesVal <- 0
    noVal <- 0
    if(results$values[1] == "YES") 
    { 
      yesVal <- as.numeric(results$values[2]) * 100
      noVal <- 100 - (as.numeric(results$values[2])*100)
    } 
    else 
    { 
      noVal <- as.numeric(results$values[2]) * 100
      yesVal <- 100 - (as.numeric(results$values[2])*100)
    } 
    
    print(noVal) 
    print(yesVal)
    
    #Set the margin size (huge margins)
    # par(mar=c(7,8,7,7))
    
    #Create data
    #a=runif(29,0.4)
    #hist(a, border=F , col=rgb(0.2,0.2,0.8,0.7) , main="", ylab="" , xlab="")
    
    # Add the text
    #mtext(c("Margin 1","Margin 2","Margin 3","Margin 4") , at=c(0.7,0.22,0.7,1.1) , 
    #      line=c(-25,-10,2,-10) , col="orange" , cex=1.5 )
    
    
    dat <- data.frame(
      PREDICTION = factor(c("YES","NO"), levels=c("YES","NO")),
      CONFIDENCE = c(yesVal, noVal)
    )
    
    p <- ggplot(data=dat, aes(x=PREDICTION, y=CONFIDENCE, fill=PREDICTION)) +
      geom_bar(stat="identity") + ggtitle("Will The Customer Default The Mortgage?") + theme(plot.title = element_text(hjust = 0.5))
    
    p <- ggplotly(p) 
    hide_legend(p)
    
  })
  
  output$plot2 <- renderPlotly({
   # feature.values <- c(10,20,10,3,4,6,7,10,5,2,8) 
    
    #barplot(feature.values,
     #       main = "",
      #      xlab = "CONFIDENCE",
       #     ylab = "Features",
        #    names.arg = c("Income", "Applied Online", "Residence", "Yrs Address", "Yrs Employer", "No. Cards", "Credit Debt", "Loans", "Loan Amount", "Sales Price", "Location"),
         #   col = "blue",
          #  space= 6) 
    
    dat1 <- data.frame(
      FEATURES = factor(c("Loan","Income", "Applied Online", "Sales Price"), levels=c("Loan","Income", "Applied Online", "Sales Price")),
      CONFIDENCE2 = c(25, 30, 10, 35)
    )
    
    p2 <- ggplot(data=dat1, aes(x=FEATURES, y=CONFIDENCE2, fill=FEATURES)) +
      geom_bar(stat="identity") + ggtitle("AI OPEN SCALE - EXPLAINABILITY") + theme(plot.title = element_text(hjust = 0.5))
    
    p2 <- ggplotly(p2) 
    hide_legend(p2)
  
    
    }) 
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)