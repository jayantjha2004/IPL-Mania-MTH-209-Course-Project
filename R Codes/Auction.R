library(shiny)
library(shinythemes)
load("C:/Users/asus/Desktop/Project-Group 11/Data Sets/Batters23.RData")
batter <- sample(x=1:150, size=22)
data <- bat23[batter,]

ui <- fluidPage( theme = shinytheme("simplex"),
  titlePanel("Auction Mania"),
  fluidRow(
    column(4, wellPanel(
      h4("Hello!"),
      textInput("control1",
                "Enter your Team Name",
                "LABEL TEXT"),
      h4("Enter the money you want to put in"),
      numericInput("playerinput1", "Only spend when you can buy", "0000000"),
      textOutput("inText1"),
      numericInput("playeroutput1", "Spend More Please", "5000000"),
      textOutput("outText1"),
      verbatimTextOutput("Team1"),
      h4("Probability of Winning"),
      verbatimTextOutput("Prob1")
    )),
    
    column(4, wellPanel(
      h4("Data of the Player"),
      selectInput("dataplayers", "Players to choose from:", 
                  choices=c("Player 1","Player 2","Player 3","Player 4","Player 5","Player 6","Player 7","Player 8","Player 9","Player 10","Player 11","Player 12","Player 13","Player 14","Player 15","Player 16","Player 17",
                            "Player 18","Player 19","Player 20","Player 21","Player 22")),
      verbatimTextOutput("playerdata"),
      actionButton("action", "Start Auction")
    )),
    
    column(4, wellPanel(
      h4("Hello!"),
      textInput("control2",
                "Enter your Team Name",
                "LABEL TEXT"),
      h4("Enter the money you want to put in"),
      numericInput("playerinput2", "Only spend when you can buy", "0000000"),
      textOutput("inText2"),
      numericInput("playeroutput2", "Spend More Please", "5000000"),
      textOutput("outText2"),
      verbatimTextOutput("Team2"),
      h4("Probability of Winning"),
      verbatimTextOutput("Prob2")
    ))
  )
)

server <- function(input, output, session) {
  dataset <- reactive({
    switch(input$dataplayers,
           "Player 1" = data[1,],
           "Player 2" = data[2,],
           "Player 3" = data[3,],
           "Player 4" = data[4,],
           "Player 5" = data[5,],
           "Player 6" = data[6,],
           "Player 7" = data[7,],
           "Player 8" = data[8,],
           "Player 9" = data[9,],
           "Player 10" = data[10,],
           "Player 11" = data[11,],
           "Player 12" = data[12,],
           "Player 13" = data[13,],
           "Player 14" = data[14,],
           "Player 15" = data[15,],
           "Player 16" = data[16,],
           "Player 17" = data[17,],
           "Player 18" = data[18,],
           "Player 19" = data[19,],
           "Player 20" = data[20,],
           "Player 21" = data[21,],
           "Player 22" = data[22,]
           )
  })
  
  
  reactives <- reactiveValues(
    team1 = c(),
    team2 = c(),
    money = c(5000000,5000000),
    bat = c(11,11),
    p = c(0,0)
  )
  
  observe({
    
    output$inText1 <- renderText({paste("Remaining Money For",input$control1)})
    output$inText2 <- renderText({paste("Remaining Money For",input$control2)})
    output$outText1 <- renderText({paste0(input$control1,"\'s Players")})
    output$outText2 <- renderText({paste0(input$control2,"\'s Players")})
    
    output$playerdata <- renderPrint({
      list("Name"=dataset()[2],"Rank"=dataset()[1],"Strike Rate"=dataset()[10],"Average"=dataset()[8])})
    
    observeEvent(input$action, {
      mon1 <- as.integer(input$playerinput1)
      mon2 <- as.integer(input$playerinput2)
      
      if(((mon1 > mon2) | ((reactives$bat[[2]]==0) | ((reactives$money[[2]]-mon2)<0))) & (reactives$money[[1]]-mon1)>=0 & ((reactives$bat[[1]])<=11 & reactives$bat[[1]]>0)){
        reactives$team1 <- append(reactives$team1, dataset()[2])
        reactives$p[[1]] <- reactives$p[[1]]+as.numeric(dataset()[10])
        reactives$money[[1]] <- reactives$money[[1]]-mon1
        reactives$bat[[1]] <- reactives$bat[[1]]-1
      } else if ((reactives$money[[2]]-mon2)>=0  & ((reactives$bat[[2]])<=11 & reactives$bat[[2]]>0) ) {
        reactives$team2 <- append(reactives$team2, dataset()[2])
        reactives$money[[2]] <- reactives$money[[2]]-mon2
        reactives$p[[2]] <- reactives$p[[2]]+as.numeric(dataset()[10])
        reactives$bat[[2]] <- reactives$bat[[2]]-1
        
      }
      
      output$Team1 <- renderPrint({
        reactives$team1
      })
      
      output$Team2 <- renderPrint({
        reactives$team2
      })
      
      output$Prob1 <- renderPrint({
        paste0("The probability of Team 1 winning is : ",formatC(reactives$p[[1]]/(reactives$p[[1]]+reactives$p[[2]]),digits=4,format="f"))
      })
      
      output$Prob2 <- renderPrint({
        paste0("The probability of Team 2 winning is : ",formatC(reactives$p[[2]]/(reactives$p[[1]]+reactives$p[[2]]),digits=4,format="f"))
      })
      
      updateNumericInput(session, "playeroutput1", value = reactives$money[[1]])
      updateNumericInput(session, "playeroutput2", value = reactives$money[[2]])
      
    })
  })
}

shinyApp(ui, server)
