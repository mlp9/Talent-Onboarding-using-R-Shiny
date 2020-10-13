library(shiny)
library(plotly)
library(data.table)
source('talent_onboardingServer.r')
source('sample.R')
library(shinydashboard)


# Define UI for application that draws a histogram
ui <- dashboardPage( skin = "blue",
                     header<-dashboardHeader(title='CEEI TALENT ON-BOARDING PLATFORM',titleWidth = 450),
                     sidebar <- dashboardSidebar(
                       sidebarMenu(
                         width=350,
                         menuItem("CEEI", icon = icon("send",lib='glyphicon'), 
                                  href = "http://www.theceei.com")
                         
)),
                       
dashboardBody(tags$style(type="text/css",
                              ".shiny-output-error { visibility: hidden; }",
                              ".shiny-output-error:before { visibility: hidden; }"
                       ),
                       h1("Talent Onboarding Platform"),
              div(style="display:inline-block", fileInput("emp","Choose employee csv:",multiple="false")),
              div(style="display:inline-block",fileInput("project","choose project file:",multiple = "false")),
              selectInput("type","select fit type",choices = c("","Employee to project fit","Project to employee fit")),
              
              conditionalPanel(condition = "input.type=='Employee to project fit'",
              numericInput("empid","Enter employee ID",value=15012121008),
              uiOutput("competency"),
              #uiOutput("branch"),
              dataTableOutput("distance_emp")),
     
              conditionalPanel(condition = "input.type=='Project to employee fit'",
              numericInput("projectid","Enter Project ID",value=1),
              uiOutput("projectcompetency"),
              #uiOutput("employeelevel"),
              dataTableOutput("distance_project")
              )
              )
   )
# Define server logic required to draw a histogram
server <- function(input, output) {
  fileemp <- reactive({
    infile <- input$emp
    if (is.null(infile)) {
      # User has not uploaded a file yet
      return(NULL)
    }
    strenemp<-read.csv(infile$datapath)
  })
  
  fileproject <- reactive({
    infile <- input$project
    if (is.null(infile)) {
      # User has not uploaded a file yet
      return(NULL)
    }
    strenemp<-read.csv(infile$datapath)
  })
  
# fileemp <- reactive({
#   inFile <- input$emp
#   strenemp <- read.csv(inFile$datapath)
#   })
# fileproject <- reactive({
#   inFile <- input$project
#   strenproject <- read.csv(inFile$datapath)
# })
output$competency <- renderUI({
  stren=fileemp()
  #x <- read.csv(input$file$datapath)
  selectInput("competency","Select competencies:",choices=names(stren[,4:ncol(stren)]),multiple = T, width = "500px") 
})

output$distance_emp<-renderDataTable({
  stren=fileemp()
  df<-dist_emp(stren,input$project$datapath,input$emp$datapath,input$competency,input$empid)
  df
})


output$distance_project<-renderDataTable({
  stren=fileproject()
    df<-dist_pr(stren,input$project$datapath,input$emp$datapath,input$projectcompetency,input$projectid)
  df
})
output$projectcompetency <- renderUI({
  stren=fileemp()
  #x <- read.csv(input$file$datapath)
  selectInput("projectcompetency","Select project competencies:",choices=names(stren[,4:ncol(stren)]),multiple = T, width = "500px") 
})
}
# Run the application 
shinyApp(ui = ui, server = server)