# Load R packages
library(shiny)
library(shinythemes)
library(ggplot2)
library(packcircles)
library(dplyr)
library(maps)
library(leaflet)

##loading data sets

get.batters <- function(x){
  foo <- paste0("./class-project-group-11-1-main/Data/Batters", x, ".RData")
  return(foo)
}

get.bowlers <- function(x){
  foo <- paste0("./class-project-group-11-1-main/Data/Bowlers", x, ".RData")
  return(foo)
}

get.FinalPoints <- function(x){
  foo <- paste0("./class-project-group-11-1-main/Data/FinalPoints", x, ".RData")
  return(foo)
}

for(i in 13:23)
{
  load(get.batters(i))
  load(get.bowlers(i))
  load(get.FinalPoints(i))
}

load("./class-project-group-11-1-main/Maps/CoordCountBowl23.RData")
load("./class-project-group-11-1-main/Maps/CoordCountBat23.RData")

for(i in 1:150)
{
  bat13$Highest.Score[i] <- gsub("\\*","",bat13$Highest.Score[i])
}
for(i in 1:150)
{
  bat14$Highest.Score[i] <- gsub("\\*","",bat14$Highest.Score[i])
}
for(i in 1:150)
{
  bat15$Highest.Score[i] <- gsub("\\*","",bat15$Highest.Score[i])
}
for(i in 1:150)
{
  bat16$Highest.Score[i] <- gsub("\\*","",bat16$Highest.Score[i])
}
for(i in 1:150)
{
  bat17$Highest.Score[i] <- gsub("\\*","",bat17$Highest.Score[i])
}
for(i in 1:150)
{
  bat18$Highest.Score[i] <- gsub("\\*","",bat18$Highest.Score[i])
}
for(i in 1:150)
{
  bat19$Highest.Score[i] <- gsub("\\*","",bat19$Highest.Score[i])
}
for(i in 1:150)
{
  bat20$Highest.Score[i] <- gsub("\\*","",bat20$Highest.Score[i])
}
for(i in 1:150)
{
  bat21$Highest.Score[i] <- gsub("\\*","",bat21$Highest.Score[i])
}
for(i in 1:150)
{
  bat22$Highest.Score[i] <- gsub("\\*","",bat22$Highest.Score[i])
}
for(i in 1:150)
{
  bat23$Highest.Score[i] <- gsub("\\*","",bat23$Highest.Score[i])
}


batter <- sample(x=1:150, size=11)
data1 <- bat23[batter,]
data1 <- data1 %>% select("Rank","Player","Strike.Rate","Average")
type <- c("BATSMAN","BATSMAN","BATSMAN","BATSMAN","BATSMAN","BATSMAN","BATSMAN","BATSMAN","BATSMAN","BATSMAN","BATSMAN")
data1$`Strike Rate` <- as.numeric(data1$`Strike Rate`)
minb <- min(data1$`Strike Rate`)
maxb <- max(data1$`Strike Rate`)
p1 <- (data1$`Strike Rate`-minb)/(maxb-minb)
data1 <- data1 %>% mutate(Type=type,Probability=p1)

bowler <- sample(x=1:100, size=11)
data2 <- bowl23[bowler,]
data2 <- data2 %>% select("Rank","Player","Strike.Rate","Average")
type <- c("BOWLER","BOWLER","BOWLER","BOWLER","BOWLER","BOWLER","BOWLER","BOWLER","BOWLER","BOWLER","BOWLER")
data2$`Strike Rate` <- as.numeric(data2$`Strike Rate`)
minb <- min(data2$`Strike Rate`)
maxb <- max(data2$`Strike Rate`)
p2 <- 1-((data2$`Strike Rate`-minb)/(maxb-minb))
data2 <- data2 %>% mutate(Type=type,Probability=p2)

data <- rbind(data1,data2)

##For graphs

# Define UI
ui <- fluidPage(theme = shinytheme("flatly"),
                navbarPage(
                 
                  "IPL MANIA",
                  tabPanel("Visualization",
                           sidebarPanel(
                             tags$h3("Input:"),
                             
                             selectInput("vis.year", "chose year",choices = 2013:2023),
                             selectInput("vis.type", "chose which stat", c("Average(SR)", "Top Scorers", "Best Score", "Runs vs Wicket", "Bowling comparison", "Average Density by Team", "Balls vs Wickets", "stat9")),
                             checkboxGroupInput("vis.team", "choose which team", choices = ""),
                             
                             
                           ), # sidebarPanel
                           mainPanel(
                             h1("The plot will go below"),
                             
                             h4("Output 1"),
                             plotOutput("plotstat"),
                             
                           ) # mainPanel
                           
                  ), # Navbar 1, tabPanel
                  tabPanel("Auction",
                           ##############################################
                           
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
                  ), #NavBar2
                  tabPanel("Maps", 
                  leafletOutput("mymap"),
                  column(2, selectInput("inputid", h3("Select Batters or Bowlers"), choices = c("Batters","Bowlers"),selected="Batters"),
                                  
                                  radioButtons("radio", h3("Select the country"),
                                               choices = list("India"="India","England"="England","Zimbabwe"="Zimbabwe","Afghanistan"="Afghanistan","Australia"="Australia","New Zealand"="New Zealand","South Africa"="South Africa","Sri Lanka"="Sri Lanka","Bangladesh"="Bangladesh","West Indies"="West Indies"), selected = "Australia"))
                  ),
                  
                  tabPanel("Summary",
                          sidebarPanel(
                           h1("Stats"),
                           h4("Data of Players Yearwise"),
                           
                             selectInput("years","Year:",
                                         c("2013","2014","2015","2016","2017","2018",
                                           "2019","2020","2021","2022","2023")),
                             selectInput("cricketer","Type of Cricketer:",
                                         c("Batter","Bowler")),
                             
                          ),
                           mainPanel(dataTableOutput("sum.data")) ,
                           ),
                    ) # navbarPage
) # fluidPage


# Define server function  
server <- function(input, output, session) {
  
  output$sum.data <- renderDataTable({
    if(input$cricketer == "Batter"){
      switch(input$years, 
             "2013" = bat13,
             "2014" = bat14,
             "2015" = bat15,
             "2016" = bat16,
             "2017" = bat17,
             "2018" = bat18,
             "2019" = bat19,
             "2020" = bat20,
             "2021" = bat21,
             "2022" = bat22,
             "2023" = bat23,
             )
    }
    else{
      switch(input$years, 
             "2013" = bowl13,
             "2014" = bowl14,
             "2015" = bowl15,
             "2016" = bowl16,
             "2017" = bowl17,
             "2018" = bowl18,
             "2019" = bowl19,
             "2020" = bowl20,
             "2021" = bowl21,
             "2022" = bowl22,
             "2023" = bowl23,
            )
    }
  })
  
  datasetmap <- reactive({
    switch(input$inputid,
           "Batters" = batmap23,
           "Bowlers" = bowlmap23)
  })
  output$mymap <- renderLeaflet({
    leaflet(datasetmap() %>%
              dplyr::filter(
                Country == input$radio,
              )) %>%
      addTiles() %>%
      addMarkers(lat = ~Lat, lng=~Long) %>%
      addLabelOnlyMarkers(lat = ~Lat, lng=~Long, label = ~Player, labelOptions = labelOptions(noHide = T, direction = 'top', textOnly = T))
    
  })
  
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
      list("Name"=dataset()[2],"Rank"=dataset()[1],"Strike Rate"=dataset()[3],"Average"=dataset()[4],"Type"=dataset()[5])})
    
    observeEvent(input$action, {
      mon1 <- as.integer(input$playerinput1)
      mon2 <- as.integer(input$playerinput2)
      
      if(((mon1 > mon2) | ((reactives$bat[[2]]==0) | ((reactives$money[[2]]-mon2)<0))) & (reactives$money[[1]]-mon1)>=0 & ((reactives$bat[[1]])<=11 & reactives$bat[[1]]>0)){
        reactives$team1 <- append(reactives$team1, dataset()[2])
        reactives$p[[1]] <- reactives$p[[1]]+as.numeric(dataset()[6])
        reactives$money[[1]] <- reactives$money[[1]]-mon1
        reactives$bat[[1]] <- reactives$bat[[1]]-1
      } else if ((reactives$money[[2]]-mon2)>=0  & ((reactives$bat[[2]])<=11 & reactives$bat[[2]]>0) ) {
        reactives$team2 <- append(reactives$team2, dataset()[2])
        reactives$money[[2]] <- reactives$money[[2]]-mon2
        reactives$p[[2]] <- reactives$p[[2]]+as.numeric(dataset()[6])
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
  
  vis.teams <- reactive({
    switch(input$vis.year,
    "2013" = unique(bat13$Teams),
    "2014" = unique(bat14$Teams),
    "2015" = unique(bat15$Teams),
    "2016" = unique(bat16$Teams),
    "2017" = unique(bat17$Teams),
    "2018" = unique(bat18$Teams),
    "2019" = unique(bat19$Teams),
    "2020" = unique(bat20$Teams),
    "2021" = unique(bat21$Teams),
    "2022" = unique(bat22$Teams),
    "2023" = unique(bat23$Teams),
    )
    
  })
  
  bat.year <- reactive({
    switch(input$vis.year,
           "2013" = bat13,
           "2014" = bat14,
           "2015" = bat15,
           "2016" = bat16,
           "2017" = bat17,
           "2018" = bat18,
           "2019" = bat19,
           "2020" = bat20,
           "2021" = bat21,
           "2022" = bat22,
           "2023" = bat23,
    )
  })
  
  bowl.year <- reactive({
    switch(input$vis.year,
           "2013" = bowl13,
           "2014" = bowl14,
           "2015" = bowl15,
           "2016" = bowl16,
           "2017" = bowl17,
           "2018" = bowl18,
           "2019" = bowl19,
           "2020" = bowl20,
           "2021" = bowl21,
           "2022" = bowl22,
           "2023" = bowl23,
    )
  })
  
  observe({
    updateCheckboxGroupInput(session, "vis.team", choices = vis.teams())
  })
  
  pplots <- reactiveValues(
    plot.stat1 = "",
    plot.stat2 = "",
    
    plot.stat4 = "",
    plot.stat5 = "",
    plot.stat6 = "",
    plot.stat7 = "",
    plot.stat8 = "",
    plot.stat9 = "",
    
  )
  
  observe({
    
    ##stat1
    bat.year1 <- bat.year()
    bowl.year1 <- bowl.year()
    grp_by_team <- bat.year1 %>% group_by(Teams) %>% summarise(Avg_S_rate = mean(as.numeric(Strike.Rate)))
    grp_team <- unique(bat.year1$Teams)
    
    df <- data.frame( value= round(grp_by_team$Avg_S_rate,2),
                      group = grp_team)
    
    # Hole size
    hsize <- 1.5
    
    df <- df %>% 
      mutate(x = hsize)
    
    pplots$plot.stat1 <- {
      ggplot(df, aes(x = hsize, y = value, fill = group)) +
        geom_col(color = "black") +
        geom_text(aes(label = value ),
                  position = position_stack(vjust = 0.5)) +
        coord_polar(theta = "y") +
        scale_fill_brewer(palette = "GnBu") +
        xlim(c(0.2, hsize + 0.5)) +
        theme(panel.background = element_rect(fill = "white"),
              panel.grid = element_blank(),
              axis.title = element_blank(),
              axis.ticks = element_blank(),
              axis.text = element_blank())
      
    }
    
    ##stat2
    
    # Create data
    data1 <- data.frame(Name=head(bat.year1$Player,50), Runs=head(bat.year1$Runs,50))
    
    # Generate the layout. This function return a dataframe with one line per bubble. 
    # It gives its center (x and y) and its radius, proportional of the value
    packing <- circleProgressiveLayout(data1$Runs, sizetype='area')
    
    # We can add these packing information to the initial data frame
    data1 <- cbind(data1, packing)
    
    # Check that radius is proportional to value. We don't want a linear relationship, since it is the AREA that must be proportionnal to the value
    # plot(data$radius, data$value)
    
    # The next step is to go from one center + a radius to the coordinates of a circle that
    # is drawn by a multitude of straight lines.
    dat.gg <- circleLayoutVertices(packing, npoints=50)
    
    pplots$plot.stat2 <- {
      # Make the plot
      ggplot() + 
        
        # Make the bubbles
        geom_polygon(data = dat.gg, aes(x, y, group = id, fill=as.factor(id)), colour = "black", alpha = 0.6) +
        
        # Add text in the center of each bubble + control its size
        geom_text(data = data1, aes(x, y, size=Runs, label = Name)) +
        scale_size_discrete(range = c(1.5,3)) +
        
        # General theme:
        theme_void() + 
        theme(legend.position="none") +
        coord_equal()
      
    }
    
    ##stat3 -- ????
    
    
    ##stat4

     pplots$plot.stat4 <- {
      ggplot(data= head(bat.year1,50), aes(x=Player, y=as.numeric(Highest.Score))) +
        geom_point() + 
        geom_segment( aes(x=Player, xend=Player, y=0, yend=as.numeric(Highest.Score)))+
        labs(title="Highest Score", x="Players", y= "Score")+
        theme(axis.text.x = element_text(angle = 90))
    }
    
    ##stat 5
    
    pplots$plot.stat5 <- {
      ggplot(data = bowl.year1, aes(x=as.numeric(Runs), y=as.numeric(Wickets), color = Teams))+
        geom_point() + labs(title="Plot for No. of Runs vs Wickets", x="Runs",y="Wickets") 
    }
    
    ##stat 6
    pplots$plot.stat6 <- {
      colors <- c("Average"="darkred","Strike Rate"= "steelblue", "Economy Rate"="purple")
      ggplot(data = bowl23, aes(x=as.numeric(Rank))) + 
        geom_line(aes(y = as.numeric(Average), color ="Average"),size=1) + 
        geom_line(aes(y = as.numeric(Strike.Rate), color="Strike Rate"), size= 1) +
        geom_line(aes(y= as.numeric(Economy.Rate), color="Economy Rate"),size=1 ) +
        labs(title="Plot", x=" ", y= " ",color="legend") +
        scale_color_manual(values=colors)
      
    }
    
    ##stat7
    
    a1 <- tibble(bat.year1[which(bat.year1$Teams == input$vis.team),])
    
    pplots$plot.stat7 <- {
      ggplot(a1,aes(x=as.numeric(Average),fill= Teams))+
        geom_density(alpha=0.2) + 
        xlim(0, 70)
    }
    
    ##stat8
    pplots$plot.stat8 <- {
      ggplot(bowl.year1,aes(x=as.numeric(Balls),y=as.numeric(Wickets),color = Teams))+
        geom_point()+
        labs(title="No.of Balls vs Wickets",x="No. of Balls",y="No. of Wicket")
    }
    
    ##stat9
    library(plotly)
    pplots$plot.stat9 <- {
      plot_ly(x = as.numeric(head(bowl.year1$Economy.Rate,20)), y = head(bowl.year1$Player,20), type = 'bar', orientation = 'h',color =head(bowl.year1$Teams,20))
    }
    
    
    
  })
  output$plotstat <- renderPlot({
    switch(input$vis.type, 
           "Average(SR)" = pplots$plot.stat1,
           "Top Scorers" = pplots$plot.stat2,
           "Best Score" = pplots$plot.stat4,
           "Runs vs Wicket" = pplots$plot.stat5,
           "Bowling comparison" = pplots$plot.stat6,
           "Average Density by Team" = pplots$plot.stat7,
           "Balls vs Wickets" = pplots$plot.stat8,
           "stat9" = pplots$plot.stat9,
           
    )
  })
  
  
  
} # server


# Create Shiny object
shinyApp(ui = ui, server = server)
