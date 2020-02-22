# load the required packages
library(shiny)
require(shinydashboard)
library(ggplot2)
library(dplyr)

recommendation <- read.csv('E:/Data Science/Shiny/recommendation.csv',stringsAsFactors = F,header=T)

#head(recommendation)


#Dashboard header carrying the title of the dashboard
header <- dashboardHeader(title = "Basic Dashboard")  

#Sidebar content of the dashboard
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Help", icon = icon("send",lib='glyphicon'), 
             href = "https://rstudio.github.io/shinydashboard/index.html")
  )
)


frow1 <- fluidRow(
  valueBoxOutput("value1")
  ,valueBoxOutput("value2")
  ,valueBoxOutput("value3")
)

frow2 <- fluidRow(
  
  box(
    title = "Revenue per Account"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,plotOutput("revenuebyPrd", height = "300px")
  )
  
  ,box(
    title = "Revenue per Product"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,plotOutput("revenuebyRegion", height = "300px")
  ) 
  
)



# combine the two fluid rows to make the body
body <- dashboardBody(frow1, frow2)

#completing the ui part with dashboardPage
ui <- dashboardPage(title = 'This is my Page title', header, sidebar, body, skin='red')
