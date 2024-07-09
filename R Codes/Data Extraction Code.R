library(rvest)
library(tidyverse)
library(dplyr)

#DATA FOR THE YEAR 2023
iplbat23 <- read_html("https://www.espncricinfo.com/records/tournament/batting-most-runs-career/indian-premier-league-2023-15129")
bat23 <- iplbat23 %>% html_table()
bat23 <- bat23[[1]]
colnames(bat23) <- c("Player","Span","Matches","Innings","Not Outs","Runs","Highest Score","Average","Balls Faced","Strike Rate","100s","50s","0s","4s","6s")
bat23 <- bat23[2:151,]
bat23 <- select(bat23,-c("Span"))
bat23 <- cbind(Rank=1:150,bat23)

iplbowl23 <- read_html("https://www.espncricinfo.com/records/tournament/bowling-most-wickets-career/indian-premier-league-2023-15129")
bowl23 <- iplbowl23 %>% html_table()
bowl23 <- bowl23[[1]]
colnames(bowl23) <- c("Player","Span","Matches","Innings","Balls","Overs","Maidens Earned","Runs","Wickets","Best Bowling Innings","Average","Economy Rate","Strike Rate","4s","5s")
bowl23 <- bowl23[2:101,]
bowl23 <- select(bowl23,-c("Span"))
bowl23 <- cbind(Rank=1:100,bowl23)

points23 <- read_html("https://www.espncricinfo.com/series/indian-premier-league-2023-1345038/points-table-standings")
points_table23 <- points23 %>% html_table()
points_table23 <- points_table23[[1]]
points_table23 <- select(points_table23,c("TEAMS","M","W","L","T","N/R","PT","NRR"))
points_table23 <- points_table23[-c(2,4,6,8,10,12,14,16,18,20),]
points_table23$TEAMS <- substring(points_table23$TEAMS,2,)
points_table23[10,]$TEAMS <- substring(points_table23[10,]$TEAMS,2,)
colnames(points_table23) <- c("Teams","Matches","Won","Lost","Tied","Number of Matches Abandoned","Points","Net Run Rate")

save(bat23,file="Batters23.RData")
save(bowl23,file="Bowlers23.RData")
save(points_table23,file="FinalPoints23.RData")


#DATA FOR THE YEAR 2022
iplbat22 <- read_html("https://www.espncricinfo.com/records/tournament/batting-most-runs-career/indian-premier-league-2022-14452")
bat22 <- iplbat22 %>% html_table()
bat22 <- bat22[[1]]
colnames(bat22) <- c("Player","Span","Matches","Innings","Not Outs","Runs","Highest Score","Average","Balls Faced","Strike Rate","100s","50s","0s","4s","6s")
bat22 <- bat22[2:151,]
bat22 <- select(bat22,-c("Span"))
bat22 <- cbind(Rank=1:150,bat22)

iplbowl22 <- read_html("https://www.espncricinfo.com/records/tournament/bowling-most-wickets-career/indian-premier-league-2022-14452")
bowl22 <- iplbowl22 %>% html_table()
bowl22 <- bowl22[[1]]
colnames(bowl22) <- c("Player","Span","Matches","Innings","Balls","Overs","Maidens Earned","Runs","Wickets","Best Bowling Innings","Average","Economy Rate","Strike Rate","4s","5s")
bowl22 <- bowl22[2:101,]
bowl22 <- select(bowl22,-c("Span"))
bowl22 <- cbind(Rank=1:100,bowl22)

points22 <- read_html("https://www.espncricinfo.com/series/indian-premier-league-2022-1298423/points-table-standings")
points_table22 <- points22 %>% html_table()
points_table22 <- points_table22[[1]]
points_table22 <- select(points_table22,c("TEAMS","M","W","L","T","N/R","PT","NRR"))
points_table22 <- points_table22[-c(2,4,6,8,10,12,14,16,18,20),]
points_table22$TEAMS <- substring(points_table22$TEAMS,2,)
points_table22[10,]$TEAMS <- substring(points_table22[10,]$TEAMS,2,)
colnames(points_table22) <- c("Teams","Matches","Won","Lost","Tied","Number of Matches Abandoned","Points","Net Run Rate")

save(bat22,file="Batters22.RData")
save(bowl22,file="Bowlers22.RData")
save(points_table22,file="FinalPoints22.RData")


#DATA FOR THE YEAR 2021
iplbat21 <- read_html("https://www.espncricinfo.com/records/tournament/batting-most-runs-career/indian-premier-league-2021-13840")
bat21 <- iplbat21 %>% html_table()
bat21 <- bat21[[1]]
colnames(bat21) <- c("Player","Span","Matches","Innings","Not Outs","Runs","Highest Score","Average","Balls Faced","Strike Rate","100s","50s","0s","4s","6s")
bat21 <- bat21[2:151,]
bat21 <- select(bat21,-c("Span"))
bat21 <- cbind(Rank=1:150,bat21)

iplbowl21 <- read_html("https://www.espncricinfo.com/records/tournament/bowling-most-wickets-career/indian-premier-league-2021-13840")
bowl21 <- iplbowl21 %>% html_table()
bowl21 <- bowl21[[1]]
colnames(bowl21) <- c("Player","Span","Matches","Innings","Balls","Overs","Maidens Earned","Runs","Wickets","Best Bowling Innings","Average","Economy Rate","Strike Rate","4s","5s")
bowl21 <- bowl21[2:101,]
bowl21 <- select(bowl21,-c("Span"))
bowl21 <- cbind(Rank=1:100,bowl21)

points21 <- read_html("https://www.espncricinfo.com/series/ipl-2021-1249214/points-table-standings")
points_table21 <- points21 %>% html_table()
points_table21 <- points_table21[[1]]
points_table21 <- select(points_table21,c("TEAMS","M","W","L","T","N/R","PT","NRR"))
points_table21 <- points_table21[-c(2,4,6,8,10,12,14,16),]
points_table21$TEAMS <- substring(points_table21$TEAMS,2,)
colnames(points_table21) <- c("Teams","Matches","Won","Lost","Tied","Number of Matches Abandoned","Points","Net Run Rate")

save(bat21,file="Batters21.RData")
save(bowl21,file="Bowlers21.RData")
save(points_table21,file="FinalPoints21.RData")

#DATA FOR THE YEAR 2020
iplbat20 <- read_html("https://www.espncricinfo.com/records/tournament/batting-most-runs-career/indian-premier-league-2020-21-13533")
bat20 <- iplbat20 %>% html_table()
bat20 <- bat20[[1]]
colnames(bat20) <- c("Player","Span","Matches","Innings","Not Outs","Runs","Highest Score","Average","Balls Faced","Strike Rate","100s","50s","0s","4s","6s")
bat20 <- bat20[2:151,]
bat20 <- select(bat20,-c("Span"))
bat20 <- cbind(Rank=1:150,bat20)

iplbowl20 <- read_html("https://www.espncricinfo.com/records/tournament/bowling-most-wickets-career/indian-premier-league-2020-21-13533")
bowl20 <- iplbowl20 %>% html_table()
bowl20 <- bowl20[[1]]
colnames(bowl20) <- c("Player","Span","Matches","Innings","Balls","Overs","Maidens Earned","Runs","Wickets","Best Bowling Innings","Average","Economy Rate","Strike Rate","4s","5s")
bowl20 <- bowl20[2:101,]
bowl20 <- select(bowl20,-c("Span"))
bowl20 <- cbind(Rank=1:100,bowl20)

points20 <- read_html("https://www.espncricinfo.com/series/ipl-2020-21-1210595/points-table-standings")
points_table20 <- points20 %>% html_table()
points_table20 <- points_table20[[1]]
points_table20 <- select(points_table20,c("TEAMS","M","W","L","N/R","PT","NRR"))
points_table20 <- points_table20[-c(2,4,6,8,10,12,14,16),]
points_table20$TEAMS <- substring(points_table20$TEAMS,2,)
colnames(points_table20) <- c("Teams","Matches","Won","Lost","Number of Matches Abandoned","Points","Net Run Rate")

save(bat20,file="Batters20.RData")
save(bowl20,file="Bowlers20.RData")
save(points_table20,file="FinalPoints20.RData")

#DATA FOR THE YEAR 2019
iplbat19 <- read_html("https://www.espncricinfo.com/records/tournament/batting-most-runs-career/indian-premier-league-2019-12741")
bat19 <- iplbat19 %>% html_table()
bat19 <- bat19[[1]]
colnames(bat19) <- c("Player","Span","Matches","Innings","Not Outs","Runs","Highest Score","Average","Balls Faced","Strike Rate","100s","50s","0s","4s","6s")
bat19 <- bat19[2:151,]
bat19 <- select(bat19,-c("Span"))
bat19 <- cbind(Rank=1:150,bat19)

iplbowl19 <- read_html("https://www.espncricinfo.com/records/tournament/bowling-most-wickets-career/indian-premier-league-2019-12741")
bowl19 <- iplbowl19 %>% html_table()
bowl19 <- bowl19[[1]]
colnames(bowl19) <- c("Player","Span","Matches","Innings","Balls","Overs","Maidens Earned","Runs","Wickets","Best Bowling Innings","Average","Economy Rate","Strike Rate","4s","5s")
bowl19 <- bowl19[2:101,]
bowl19 <- select(bowl19,-c("Span"))
bowl19 <- cbind(Rank=1:100,bowl19)

points19 <- read_html("https://www.espncricinfo.com/series/ipl-2019-1165643/points-table-standings")
points_table19 <- points19 %>% html_table()
points_table19 <- points_table19[[1]]
points_table19 <- select(points_table19,c("TEAMS","M","W","L","T","N/R","PT","NRR"))
points_table19 <- points_table19[-c(2,4,6,8,10,12,14,16),]
points_table19$TEAMS <- substring(points_table19$TEAMS,2,)
colnames(points_table19) <- c("Teams","Matches","Won","Lost","Tied","Number of Matches Abandoned","Points","Net Run Rate")

save(bat19,file="Batters19.RData")
save(bowl19,file="Bowlers19.RData")
save(points_table19,file="FinalPoints19.RData")

#DATA FOR THE YEAR 2018
iplbat18 <- read_html("https://www.espncricinfo.com/records/tournament/batting-most-runs-career/indian-premier-league-2018-12210")
bat18 <- iplbat18 %>% html_table()
bat18 <- bat18[[1]]
colnames(bat18) <- c("Player","Span","Matches","Innings","Not Outs","Runs","Highest Score","Average","Balls Faced","Strike Rate","100s","50s","0s","4s","6s")
bat18 <- bat18[2:151,]
bat18 <- select(bat18,-c("Span"))
bat18 <- cbind(Rank=1:150,bat18)

iplbowl18 <- read_html("https://www.espncricinfo.com/records/tournament/bowling-most-wickets-career/indian-premier-league-2018-12210")
bowl18 <- iplbowl18 %>% html_table()
bowl18 <- bowl18[[1]]
colnames(bowl18) <- c("Player","Span","Matches","Innings","Balls","Overs","Maidens Earned","Runs","Wickets","Best Bowling Innings","Average","Economy Rate","Strike Rate","4s","5s")
bowl18 <- bowl18[2:101,]
bowl18 <- select(bowl18,-c("Span"))
bowl18 <- cbind(Rank=1:100,bowl18)

points18 <- read_html("https://www.espncricinfo.com/series/ipl-2018-1131611/points-table-standings")
points_table18 <- points18 %>% html_table()
points_table18 <- points_table18[[1]]
points_table18 <- select(points_table18,c("TEAMS","M","W","L","T","N/R","PT","NRR"))
points_table18 <- points_table18[-c(2,4,6,8,10,12,14,16),]
points_table18$TEAMS <- substring(points_table18$TEAMS,2,)
colnames(points_table18) <- c("Teams","Matches","Won","Lost","Tied","Number of Matches Abandoned","Points","Net Run Rate")

save(bat18,file="Batters18.RData")
save(bowl18,file="Bowlers18.RData")
save(points_table18,file="FinalPoints18.RData")

#DATA FOR THE YEAR 2017
iplbat17 <- read_html("https://www.espncricinfo.com/records/tournament/batting-most-runs-career/indian-premier-league-2017-11701")
bat17 <- iplbat17 %>% html_table()
bat17 <- bat17[[1]]
colnames(bat17) <- c("Player","Span","Matches","Innings","Not Outs","Runs","Highest Score","Average","Balls Faced","Strike Rate","100s","50s","0s","4s","6s")
bat17 <- bat17[2:151,]
bat17 <- select(bat17,-c("Span"))
bat17 <- cbind(Rank=1:150,bat17)

iplbowl17 <- read_html("https://www.espncricinfo.com/records/tournament/bowling-most-wickets-career/indian-premier-league-2017-11701")
bowl17 <- iplbowl17 %>% html_table()
bowl17 <- bowl17[[1]]
colnames(bowl17) <- c("Player","Span","Matches","Innings","Balls","Overs","Maidens Earned","Runs","Wickets","Best Bowling Innings","Average","Economy Rate","Strike Rate","4s","5s")
bowl17 <- bowl17[2:101,]
bowl17 <- select(bowl17,-c("Span"))
bowl17 <- cbind(Rank=1:100,bowl17)

points17 <- read_html("https://www.espncricinfo.com/series/ipl-2017-1078425/points-table-standings")
points_table17 <- points17 %>% html_table()
points_table17 <- points_table17[[1]]
points_table17 <- select(points_table17,c("TEAMS","M","W","L","T","N/R","PT","NRR"))
points_table17 <- points_table17[-c(2,4,6,8,10,12,14,16),]
points_table17$TEAMS <- substring(points_table17$TEAMS,2,)
colnames(points_table17) <- c("Teams","Matches","Won","Lost","Tied","Number of Matches Abandoned","Points","Net Run Rate")

save(bat17,file="Batters17.RData")
save(bowl17,file="Bowlers17.RData")
save(points_table17,file="FinalPoints17.RData")

#DATA FOR THE YEAR 2016
iplbat16 <- read_html("https://www.espncricinfo.com/records/tournament/batting-most-runs-career/indian-premier-league-2016-11001")
bat16 <- iplbat16 %>% html_table()
bat16 <- bat16[[1]]
colnames(bat16) <- c("Player","Span","Matches","Innings","Not Outs","Runs","Highest Score","Average","Balls Faced","Strike Rate","100s","50s","0s","4s","6s")
bat16 <- bat16[2:151,]
bat16 <- select(bat16,-c("Span"))
bat16 <- cbind(Rank=1:150,bat16)

iplbowl16 <- read_html("https://www.espncricinfo.com/records/tournament/bowling-most-wickets-career/indian-premier-league-2016-11001")
bowl16 <- iplbowl16 %>% html_table()
bowl16 <- bowl16[[1]]
colnames(bowl16) <- c("Player","Span","Matches","Innings","Balls","Overs","Maidens Earned","Runs","Wickets","Best Bowling Innings","Average","Economy Rate","Strike Rate","4s","5s")
bowl16 <- bowl16[2:101,]
bowl16 <- select(bowl16,-c("Span"))
bowl16 <- cbind(Rank=1:100,bowl16)

points16 <- read_html("https://www.espncricinfo.com/series/ipl-2016-968923/points-table-standings")
points_table16 <- points16 %>% html_table()
points_table16 <- points_table16[[1]]
points_table16 <- select(points_table16,c("TEAMS","M","W","L","T","N/R","PT","NRR"))
points_table16 <- points_table16[-c(2,4,6,8,10,12,14,16),]
points_table16$TEAMS <- substring(points_table16$TEAMS,2,)
colnames(points_table16) <- c("Teams","Matches","Won","Lost","Tied","Number of Matches Abandoned","Points","Net Run Rate")

save(bat16,file="Batters16.RData")
save(bowl16,file="Bowlers16.RData")
save(points_table16,file="FinalPoints16.RData")

#DATA FOR THE YEAR 2015
iplbat15 <- read_html("https://www.espncricinfo.com/records/tournament/batting-most-runs-career/pepsi-indian-premier-league-2015-9657")
bat15 <- iplbat15 %>% html_table()
bat15 <- bat15[[1]]
colnames(bat15) <- c("Player","Span","Matches","Innings","Not Outs","Runs","Highest Score","Average","Balls Faced","Strike Rate","100s","50s","0s","4s","6s")
bat15 <- bat15[2:151,]
bat15 <- select(bat15,-c("Span"))
bat15 <- cbind(Rank=1:150,bat15)

iplbowl15 <- read_html("https://www.espncricinfo.com/records/tournament/bowling-most-wickets-career/pepsi-indian-premier-league-2015-9657")
bowl15 <- iplbowl15 %>% html_table()
bowl15 <- bowl15[[1]]
colnames(bowl15) <- c("Player","Span","Matches","Innings","Balls","Overs","Maidens Earned","Runs","Wickets","Best Bowling Innings","Average","Economy Rate","Strike Rate","4s","5s")
bowl15 <- bowl15[2:101,]
bowl15 <- select(bowl15,-c("Span"))
bowl15 <- cbind(Rank=1:100,bowl15)

points15 <- read_html("https://www.espncricinfo.com/series/pepsi-indian-premier-league-2015-791129/points-table-standings")
points_table15 <- points15 %>% html_table()
points_table15 <- points_table15[[1]]
points_table15 <- select(points_table15,c("TEAMS","M","W","L","T","N/R","PT","NRR"))
points_table15 <- points_table15[-c(2,4,6,8,10,12,14,16),]
points_table15$TEAMS <- substring(points_table15$TEAMS,2,)
colnames(points_table15) <- c("Teams","Matches","Won","Lost","Tied","Number of Matches Abandoned","Points","Net Run Rate")

save(bat15,file="Batters15.RData")
save(bowl15,file="Bowlers15.RData")
save(points_table15,file="FinalPoints15.RData")

#DATA FOR THE YEAR 2014
iplbat14 <- read_html("https://www.espncricinfo.com/records/tournament/batting-most-runs-career/pepsi-indian-premier-league-2014-8827")
bat14 <- iplbat14 %>% html_table()
bat14 <- bat14[[1]]
colnames(bat14) <- c("Player","Span","Matches","Innings","Not Outs","Runs","Highest Score","Average","Balls Faced","Strike Rate","100s","50s","0s","4s","6s")
bat14 <- bat14[2:151,]
bat14 <- select(bat14,-c("Span"))
bat14 <- cbind(Rank=1:150,bat14)

iplbowl14 <- read_html("https://www.espncricinfo.com/records/tournament/bowling-most-wickets-career/pepsi-indian-premier-league-2014-8827")
bowl14 <- iplbowl14 %>% html_table()
bowl14 <- bowl14[[1]]
colnames(bowl14) <- c("Player","Span","Matches","Innings","Balls","Overs","Maidens Earned","Runs","Wickets","Best Bowling Innings","Average","Economy Rate","Strike Rate","4s","5s")
bowl14 <- bowl14[2:101,]
bowl14 <- select(bowl14,-c("Span"))
bowl14 <- cbind(Rank=1:100,bowl14)

points14 <- read_html("https://www.espncricinfo.com/series/pepsi-indian-premier-league-2014-695871/points-table-standings")
points_table14 <- points14 %>% html_table()
points_table14 <- points_table14[[1]]
points_table14 <- select(points_table14,c("TEAMS","M","W","L","T","N/R","PT","NRR"))
points_table14 <- points_table14[-c(2,4,6,8,10,12,14,16),]
points_table14$TEAMS <- substring(points_table14$TEAMS,2,)
colnames(points_table14) <- c("Teams","Matches","Won","Lost","Tied","Number of Matches Abandoned","Points","Net Run Rate")

save(bat14,file="Batters14.RData")
save(bowl14,file="Bowlers14.RData")
save(points_table14,file="FinalPoints14.RData")

#DATA FOR THE YEAR 2013
iplbat13 <- read_html("https://www.espncricinfo.com/records/tournament/batting-most-runs-career/indian-premier-league-2013-7720")
bat13 <- iplbat13 %>% html_table()
bat13 <- bat13[[1]]
colnames(bat13) <- c("Player","Span","Matches","Innings","Not Outs","Runs","Highest Score","Average","Balls Faced","Strike Rate","100s","50s","0s","4s","6s")
bat13 <- bat13[2:151,]
bat13 <- select(bat13,-c("Span"))
bat13 <- cbind(Rank=1:150,bat13)

iplbowl13 <- read_html("https://www.espncricinfo.com/records/tournament/bowling-most-wickets-career/indian-premier-league-2013-7720")
bowl13 <- iplbowl13 %>% html_table()
bowl13 <- bowl13[[1]]
colnames(bowl13) <- c("Player","Span","Matches","Innings","Balls","Overs","Maidens Earned","Runs","Wickets","Best Bowling Innings","Average","Economy Rate","Strike Rate","4s","5s")
bowl13 <- bowl13[2:101,]
bowl13 <- select(bowl13,-c("Span"))
bowl13 <- cbind(Rank=1:100,bowl13)

points13 <- read_html("https://www.espncricinfo.com/series/indian-premier-league-2013-586733/points-table-standings")
points_table13 <- points13 %>% html_table()
points_table13 <- points_table13[[1]]
points_table13 <- select(points_table13,c("TEAMS","M","W","L","T","N/R","PT","NRR"))
points_table13 <- points_table13[-c(2,4,6,8,10,12,14,16,18),]
points_table13$TEAMS <- substring(points_table13$TEAMS,2,)
colnames(points_table13) <- c("Teams","Matches","Won","Lost","Tied","Number of Matches Abandoned","Points","Net Run Rate")

save(bat13,file="Batters13.RData")
save(bowl13,file="Bowlers13.RData")
save(points_table13,file="FinalPoints13.RData")