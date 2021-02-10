#import and manipulate data 
matches_all = read.csv(file="spi_matches.csv")
prem = matches_all[which(matches_all$league=="Barclays Premier League"),]
prem_train = prem[complete.cases(prem$score1,prem$adj_score1),]
prem_train = prem_train[which(prem_train$season != 2020),]
prem_train = data.frame(prem_train,stringsAsFactors = FALSE)
prem_current = prem[complete.cases(prem$score1),]
prem_current = prem_current[which(prem_current$season==2020),]
prem_predict = prem[!complete.cases(prem$score1),]
soccer_gpg = data.frame(season = prem_train$season, team = prem_train$team1, home_gpg = 0, away_gpg = 0)
soccer_gpg = distinct(soccer_gpg, .keep_all = TRUE)
soccer_gpg_p = data.frame(season = prem_predict$season, team = prem_predict$team1, home_gpg = 0, away_gpg = 0)
soccer_gpg_p = distinct(soccer_gpg_p, .keep_all = TRUE)
prem_train$form_for1 = 0
prem_train$form_against1 = 0
prem_train$form_for2 = 0
prem_train$form_against2 = 0
View(matches_all)
prem_train$team1id = ifelse(prem_train$team1 == "Hull City", 1,
                            ifelse(prem_train$team1 == "Southampton", 2,
                                   ifelse(prem_train$team1 == "Burnley", 3,
                                          ifelse(prem_train$team1 == "Middlesbrough", 4,
                                                 ifelse(prem_train$team1 == "Everton", 5,
                                                        ifelse(prem_train$team1 == "Crystal Palace", 6,
                                                               ifelse(prem_train$team1 == "Manchester City", 7,
                                                                      ifelse(prem_train$team1 == "AFC Bournemouth", 8,
                                                                             ifelse(prem_train$team1 == "Arsenal", 9,
                                                                                    ifelse(prem_train$team1 == "Chelsea", 10,
                                                                                           ifelse(prem_train$team1 == "Manchester United", 11,
                                                                                                  ifelse(prem_train$team1 == "Stoke City", 12,
                                                                                                         ifelse(prem_train$team1 == "Tottenham Hotspur", 13,
                                                                                                                ifelse(prem_train$team1 == "Watford", 14,
                                                                                                                       ifelse(prem_train$team1 == "Swansea City", 15,
                                                                                                                              ifelse(prem_train$team1 == "West Bromwich Albion", 16,
                                                                                                                                     ifelse(prem_train$team1 == "Leicester City", 17,
                                                                                                                                            ifelse(prem_train$team1 == "Sunderland", 18,
                                                                                                                                                   ifelse(prem_train$team1 == "West Ham United", 19,
                                                                                                                                                          ifelse(prem_train$team1 == "Liverpool", 20,
                                                                                                                                                                 ifelse(prem_train$team1 == "Brighton and Hove Albion", 21,
                                                                                                                                                                        ifelse(prem_train$team1 == "Newcastle", 22,
                                                                                                                                                                               ifelse(prem_train$team1 == "Huddersfield Town", 23,
                                                                                                                                                                                      ifelse(prem_train$team1 == "Fulham", 24,
                                                                                                                                                                                             ifelse(prem_train$team1 == "Wolverhampton", 25,
                                                                                                                                                                                                    ifelse(prem_train$team1 == "Cardiff City", 26,
                                                                                                                                                                                                           ifelse(prem_train$team1 == "Aston Villa", 27,
                                                                                                                                                                                                                  ifelse(prem_train$team1 == "Norwich City", 28, 29))))))))))))))))))))))))))))
prem_train$team2id = ifelse(prem_train$team2 == "Hull City", 1,
                            ifelse(prem_train$team2 == "Southampton", 2,
                                   ifelse(prem_train$team2 == "Burnley", 3,
                                          ifelse(prem_train$team2 == "Middlesbrough", 4,
                                                 ifelse(prem_train$team2 == "Everton", 5,
                                                        ifelse(prem_train$team2 == "Crystal Palace", 6,
                                                               ifelse(prem_train$team2 == "Manchester City", 7,
                                                                      ifelse(prem_train$team2 == "AFC Bournemouth", 8,
                                                                             ifelse(prem_train$team2 == "Arsenal", 9,
                                                                                    ifelse(prem_train$team2 == "Chelsea", 10,
                                                                                           ifelse(prem_train$team2 == "Manchester United", 11,
                                                                                                  ifelse(prem_train$team2 == "Stoke City", 12,
                                                                                                         ifelse(prem_train$team2 == "Tottenham Hotspur", 13,
                                                                                                                ifelse(prem_train$team2 == "Watford", 14,
                                                                                                                       ifelse(prem_train$team2 == "Swansea City", 15,
                                                                                                                              ifelse(prem_train$team2 == "West Bromwich Albion", 16,
                                                                                                                                     ifelse(prem_train$team2 == "Leicester City", 17,
                                                                                                                                            ifelse(prem_train$team2 == "Sunderland", 18,
                                                                                                                                                   ifelse(prem_train$team2 == "West Ham United", 19,
                                                                                                                                                          ifelse(prem_train$team2 == "Liverpool", 20,
                                                                                                                                                                 ifelse(prem_train$team2 == "Brighton and Hove Albion", 21,
                                                                                                                                                                        ifelse(prem_train$team2 == "Newcastle", 22,
                                                                                                                                                                               ifelse(prem_train$team2 == "Huddersfield Town", 23,
                                                                                                                                                                                      ifelse(prem_train$team2 == "Fulham", 24,
                                                                                                                                                                                             ifelse(prem_train$team2 == "Wolverhampton", 25,
                                                                                                                                                                                                    ifelse(prem_train$team2 == "Cardiff City", 26,
                                                                                                                                                                                                           ifelse(prem_train$team2 == "Aston Villa", 27,
                                                                                                                                                                                                                  ifelse(prem_train$team2 == "Norwich City", 28, 29))))))))))))))))))))))))))))
prem_current$team1id = ifelse(prem_current$team1 == "Leeds United", 1,
                            ifelse(prem_current$team1 == "Southampton", 2,
                                   ifelse(prem_current$team1 == "Burnley", 3,
                                          ifelse(prem_current$team1 == "Everton", 4,
                                                ifelse(prem_current$team1 == "Crystal Palace", 5,
                                                      ifelse(prem_current$team1 == "Manchester City", 6,
                                                            ifelse(prem_current$team1 == "Arsenal", 7,
                                                                  ifelse(prem_current$team1 == "Chelsea", 8,
                                                                        ifelse(prem_current$team1 == "Manchester United", 9,
                                                                              ifelse(prem_current$team1 == "Tottenham Hotspur", 10,
                                                                                     ifelse(prem_current$team1 == "West Bromwich Albion", 11,
                                                                                            ifelse(prem_current$team1 == "Leicester City", 12,
                                                                                                   ifelse(prem_current$team1 == "West Ham United", 13,
                                                                                                         ifelse(prem_current$team1 == "Liverpool", 14,
                                                                                                                ifelse(prem_current$team1 == "Brighton and Hove Albion", 15,
                                                                                                                       ifelse(prem_current$team1 == "Newcastle", 16,
                                                                                                                              ifelse(prem_current$team1 == "Fulham", 17,
                                                                                                                                     ifelse(prem_current$team1 == "Wolverhampton", 18,
                                                                                                                                            ifelse(prem_current$team1 == "Aston Villa", 19,20)))))))))))))))))))
prem_current$team2id = ifelse(prem_current$team2 == "Leeds United", 1,
                              ifelse(prem_current$team2 == "Southampton", 2,
                                     ifelse(prem_current$team2 == "Burnley", 3,
                                            ifelse(prem_current$team2 == "Everton", 4,
                                                   ifelse(prem_current$team2 == "Crystal Palace", 5,
                                                          ifelse(prem_current$team2 == "Manchester City", 6,
                                                                 ifelse(prem_current$team2 == "Arsenal", 7,
                                                                        ifelse(prem_current$team2 == "Chelsea", 8,
                                                                               ifelse(prem_current$team2 == "Manchester United", 9,
                                                                                      ifelse(prem_current$team2 == "Tottenham Hotspur", 10,
                                                                                             ifelse(prem_current$team2 == "West Bromwich Albion", 11,
                                                                                                    ifelse(prem_current$team2 == "Leicester City", 12,
                                                                                                           ifelse(prem_current$team2 == "West Ham United", 13,
                                                                                                                  ifelse(prem_current$team2 == "Liverpool", 14,
                                                                                                                         ifelse(prem_current$team2 == "Brighton and Hove Albion", 15,
                                                                                                                                ifelse(prem_current$team2 == "Newcastle", 16,
                                                                                                                                       ifelse(prem_current$team2 == "Fulham", 17,
                                                                                                                                              ifelse(prem_current$team2 == "Wolverhampton", 18,
                                                                                                                                                     ifelse(prem_current$team2 == "Aston Villa", 19,20)))))))))))))))))))
prem_predict$team1id = ifelse(prem_predict$team1 == "Leeds United", 1,
                              ifelse(prem_predict$team1 == "Southampton", 2,
                                     ifelse(prem_predict$team1 == "Burnley", 3,
                                            ifelse(prem_predict$team1 == "Everton", 4,
                                                   ifelse(prem_predict$team1 == "Crystal Palace", 5,
                                                          ifelse(prem_predict$team1 == "Manchester City", 6,
                                                                 ifelse(prem_predict$team1 == "Arsenal", 7,
                                                                        ifelse(prem_predict$team1 == "Chelsea", 8,
                                                                               ifelse(prem_predict$team1 == "Manchester United", 9,
                                                                                      ifelse(prem_predict$team1 == "Tottenham Hotspur", 10,
                                                                                             ifelse(prem_predict$team1 == "West Bromwich Albion", 11,
                                                                                                    ifelse(prem_predict$team1 == "Leicester City", 12,
                                                                                                           ifelse(prem_predict$team1 == "West Ham United", 13,
                                                                                                                  ifelse(prem_predict$team1 == "Liverpool", 14,
                                                                                                                         ifelse(prem_predict$team1 == "Brighton and Hove Albion", 15,
                                                                                                                                ifelse(prem_predict$team1 == "Newcastle", 16,
                                                                                                                                       ifelse(prem_predict$team1 == "Fulham", 17,
                                                                                                                                              ifelse(prem_predict$team1 == "Wolverhampton", 18,
                                                                                                                                                     ifelse(prem_predict$team1 == "Aston Villa", 19,20)))))))))))))))))))
prem_predict$team2id = ifelse(prem_predict$team2 == "Leeds United", 1,
                              ifelse(prem_predict$team2 == "Southampton", 2,
                                     ifelse(prem_predict$team2 == "Burnley", 3,
                                            ifelse(prem_predict$team2 == "Everton", 4,
                                                   ifelse(prem_predict$team2 == "Crystal Palace", 5,
                                                          ifelse(prem_predict$team2 == "Manchester City", 6,
                                                                 ifelse(prem_predict$team2 == "Arsenal", 7,
                                                                        ifelse(prem_predict$team2 == "Chelsea", 8,
                                                                               ifelse(prem_predict$team2 == "Manchester United", 9,
                                                                                      ifelse(prem_predict$team2 == "Tottenham Hotspur", 10,
                                                                                             ifelse(prem_predict$team2 == "West Bromwich Albion", 11,
                                                                                                    ifelse(prem_predict$team2 == "Leicester City", 12,
                                                                                                           ifelse(prem_predict$team2 == "West Ham United", 13,
                                                                                                                  ifelse(prem_predict$team2 == "Liverpool", 14,
                                                                                                                         ifelse(prem_predict$team2 == "Brighton and Hove Albion", 15,
                                                                                                                                ifelse(prem_predict$team2 == "Newcastle", 16,
                                                                                                                                       ifelse(prem_predict$team2 == "Fulham", 17,
                                                                                                                                              ifelse(prem_predict$team2 == "Wolverhampton", 18,
                                                                                                                                                     ifelse(prem_predict$team2 == "Aston Villa", 19,20)))))))))))))))))))
#calculate team form for all matches
teams = data.frame(for_home1 = rep(NA,29), for_away1 = rep(NA,29), against_home1 = rep(NA,29), against_away1 = rep(NA,29),
                   for_home2 = rep(NA,29), for_away2 = rep(NA,29), against_home2 = rep(NA,29), against_away2 = rep(NA,29),
                   for_home3 = rep(NA,29), for_away3 = rep(NA,29), against_home3 = rep(NA,29), against_away3 = rep(NA,29),
                   for1 = rep(NA,29), against1 = rep(NA,29), for2 = rep(NA,29), against2 = rep(NA,29), for3 = rep(NA,29), against3 = rep(NA,29))

year = 2016
for (i in 1:nrow(prem_train)) {
  home_team = prem_train[i,"team1id"]
  away_team = prem_train[i,"team2id"]
  
  if (as.integer(prem_train[i,"season"]) != year) {
    teams[,] = NA
    year = year + 1
  }
 
  teams[home_team,"for3"] = teams[home_team,"for2"]
  teams[home_team,"for2"] = teams[home_team,"for1"]
  teams[home_team,"for1"] = prem_train[i,"adj_score1"]
  teams[away_team,"for3"] = teams[away_team,"for2"]
  teams[away_team,"for2"] = teams[away_team,"for1"]
  teams[away_team,"for1"] = prem_train[i,"adj_score2"]
  teams[home_team,"against3"] = teams[home_team,"against2"]
  teams[home_team,"against2"] = teams[home_team,"against1"]
  teams[home_team,"against1"] = prem_train[i,"adj_score2"]
  teams[away_team,"against3"] = teams[away_team,"against2"]
  teams[away_team,"against2"] = teams[away_team,"against1"]
  teams[away_team,"against1"] = prem_train[i,"adj_score1"]
  
  prem_train[i,"form_for1"] = (teams[home_team,"for1"]+teams[home_team,"for2"]+teams[home_team,"for3"])/3
  prem_train[i,"form_against1"] = (teams[home_team,"against1"]+teams[home_team,"against2"]+teams[home_team,"against3"])/3
  prem_train[i,"form_for2"] = (teams[away_team,"for1"]+teams[away_team,"for2"]+teams[away_team,"for3"])/3
  prem_train[i,"form_against2"] = (teams[away_team,"against1"]+teams[away_team,"against2"]+teams[away_team,"against3"])/3
  
 
 
  
}
prem_train = prem_train[complete.cases(prem_train$form_for1),]

teams[,] = NA
team_form = data.frame(form_for = rep(0,20),form_against = rep(0,20),
                       team = c("Leeds United","Southampton","Burnley","Everton","Crystal Palace","Manchester City","Arsenal","Chelsea","Manchester United",
                                "Tottenham Hotspur","West Bromwich Albion","Leicester City","West Ham United","Liverpool","Brighton and Hove Albion","Newcastle",
                                "Fulham","Wolverhampton","Aston Villa","Sheffield United"))

for (i in 1:nrow(prem_current)) {
  home_team = prem_current[i,"team1id"]
  away_team = prem_current[i,"team2id"]
  
  teams[home_team,"for3"] = teams[home_team,"for2"]
  teams[home_team,"for2"] = teams[home_team,"for1"]
  teams[home_team,"for1"] = prem_current[i,"adj_score1"]
  teams[away_team,"for3"] = teams[away_team,"for2"]
  teams[away_team,"for2"] = teams[away_team,"for1"]
  teams[away_team,"for1"] = prem_current[i,"adj_score2"]
  teams[home_team,"against3"] = teams[home_team,"against2"]
  teams[home_team,"against2"] = teams[home_team,"against1"]
  teams[home_team,"against1"] = prem_current[i,"adj_score2"]
  teams[away_team,"against3"] = teams[away_team,"against2"]
  teams[away_team,"against2"] = teams[away_team,"against1"]
  teams[away_team,"against1"] = prem_current[i,"adj_score1"]
  
  team_form[home_team,"form_for"] = (teams[home_team,"for1"]+teams[home_team,"for2"]+teams[home_team,"for3"])/3
  team_form[home_team,"form_against"] = (teams[home_team,"against1"]+teams[home_team,"against2"]+teams[home_team,"against3"])/3
  team_form[away_team,"form_for"] = (teams[away_team,"for1"]+teams[away_team,"for2"]+teams[away_team,"for3"])/3
  team_form[away_team,"form_against"] = (teams[away_team,"against1"]+teams[away_team,"against2"]+teams[away_team,"against3"])/3
  
  
  
}

#calculate average adjusted score for each team
for (i in 1:nrow(soccer_gpg)) {
  sumxg1_f = 0
  sumxg1_a = 0
  sumxg2_f = 0
  sumxg2_a = 0
  sumnsxg1_f = 0
  sumnsxg1_a = 0
  sumnsxg2_f = 0
  sumnsxg2_a = 0
  sumadj1_f = 0
  sumadj1_a = 0
  sumadj2_f = 0
  sumadj2_a = 0
  sumadj_tot_f = 0
  sumadj_tot_a = 0
  num1 = 0
  num2 = 0
  for (j in 1:nrow(prem_train)) {
    if ((soccer_gpg[i,"team"] == prem_train[j,"team1"]) & (soccer_gpg[i,"season"] == prem_train[j,"season"])) {
      sumadj1_f = sumadj1_f + prem_train[j,"adj_score1"]
      sumadj1_a = sumadj1_a + prem_train[j,"adj_score2"]
      num1 = num1 + 1
    }
    if ((soccer_gpg[i,"team"] == prem_train[j,"team2"]) & (soccer_gpg[i,"season"] == prem_train[j,"season"])) {
      sumadj2_f = sumadj2_f + prem_train[j,"adj_score2"]
      sumadj2_a = sumadj2_a + prem_train[j,"adj_score1"]
      num2 = num2 + 1
    }
  }
  soccer_gpg[i,"adjscore1_for"] = (sumadj1_f/num1)
  soccer_gpg[i,"adjscore1_allowed"] = (sumadj1_a/num1)
  soccer_gpg[i,"adjscore2_for"] = (sumadj2_f/num2)
  soccer_gpg[i,"adjscore2_allowed"] = (sumadj2_a/num2) 
}

for (i in 1:nrow(soccer_gpg_p)) {
  sumxg1_f = 0
  sumxg1_a = 0
  sumxg2_f = 0
  sumxg2_a = 0
  sumnsxg1_f = 0
  sumnsxg1_a = 0
  sumnsxg2_f = 0
  sumnsxg2_a = 0
  sumadj1_f = 0
  sumadj1_a = 0
  sumadj2_f = 0
  sumadj2_a = 0
  sumadj_tot_f = 0
  sumadj_tot_a = 0
  num1 = 0
  num2 = 0
  for (j in 1:nrow(prem_current)) {
    if ((soccer_gpg_p[i,"team"] == prem_current[j,"team1"]) & (soccer_gpg_p[i,"season"] == prem_current[j,"season"])) {
      sumadj1_f = sumadj1_f + prem_current[j,"adj_score1"]
      sumadj1_a = sumadj1_a + prem_current[j,"adj_score2"]
      num1 = num1 + 1
    }
    if ((soccer_gpg_p[i,"team"] == prem_current[j,"team2"]) & (soccer_gpg_p[i,"season"] == prem_current[j,"season"])) {
      sumadj2_f = sumadj2_f + prem_current[j,"adj_score2"]
      sumadj2_a = sumadj2_a + prem_current[j,"adj_score1"]
      num2 = num2 + 1
    }
  }
  soccer_gpg_p[i,"adjscore1_for"] = (sumadj1_f/num1)
  soccer_gpg_p[i,"adjscore1_allowed"] = (sumadj1_a/num1)
  soccer_gpg_p[i,"adjscore2_for"] = (sumadj2_f/num2)
  soccer_gpg_p[i,"adjscore2_allowed"] = (sumadj2_a/num2) 
}

#transfer data from soccer_gpg and soccer_gpg_p to prem_train and prem_predict
for (i in 1:nrow(prem_train)) {
  prem_train[i,"adj1_for"] = soccer_gpg[which(soccer_gpg$team == prem_train[i,"team1"] & soccer_gpg$season == prem_train[i,"season"]),"adjscore1_for"]
  prem_train[i,"adj2_for"] = soccer_gpg[which(soccer_gpg$team == prem_train[i,"team2"] & soccer_gpg$season == prem_train[i,"season"]),"adjscore2_for"]
  prem_train[i,"adj1_allowed"] = soccer_gpg[which(soccer_gpg$team == prem_train[i,"team1"] & soccer_gpg$season == prem_train[i,"season"]),"adjscore1_allowed"]
  prem_train[i,"adj2_allowed"] = soccer_gpg[which(soccer_gpg$team == prem_train[i,"team2"] & soccer_gpg$season == prem_train[i,"season"]),"adjscore2_allowed"]
}

for (i in 1:nrow(prem_predict)) {
  home_team = prem_predict[i,"team1id"]
  away_team = prem_predict[i,"team2id"]
  prem_predict[i,"adj1_for"] = soccer_gpg_p[which(soccer_gpg_p$team == prem_predict[i,"team1"] & soccer_gpg_p$season == prem_predict[i,"season"]),"adjscore1_for"]
  prem_predict[i,"adj2_for"] = soccer_gpg_p[which(soccer_gpg_p$team == prem_predict[i,"team2"] & soccer_gpg_p$season == prem_predict[i,"season"]),"adjscore2_for"]
  prem_predict[i,"adj1_allowed"] = soccer_gpg_p[which(soccer_gpg_p$team == prem_predict[i,"team1"] & soccer_gpg_p$season == prem_predict[i,"season"]),"adjscore1_allowed"]
  prem_predict[i,"adj2_allowed"] = soccer_gpg_p[which(soccer_gpg_p$team == prem_predict[i,"team2"] & soccer_gpg_p$season == prem_predict[i,"season"]),"adjscore2_allowed"]
  prem_predict[i,"form_for1"] = team_form[home_team,"form_for"]
  prem_predict[i,"form_for2"] = team_form[away_team,"form_for"]
  prem_predict[i,"form_against1"] = team_form[home_team,"form_against"]
  prem_predict[i,"form_against2"] = team_form[away_team,"form_against"]
  
  
}

#add time of possesion for each team
for (i in 1:nrow(prem_train)) {
  if (prem_train[i,"season"] == 2016) {
    prem_train[i,"time1"] = ifelse(prem_train[i,"team1"] == "Manchester City", .6489,
                                   ifelse(prem_train[i,"team1"] == "Liverpool", .6203,
                                          ifelse(prem_train[i,"team1"] == "Tottenham Hotspur", .6042,
                                                 ifelse(prem_train[i,"team1"] == "Arsenal", .5884,
                                                        ifelse(prem_train[i,"team1"] == "Manchester United", .5650,
                                                               ifelse(prem_train[i,"team1"] == "Chelsea", .5492,
                                                                      ifelse(prem_train[i,"team1"] == "Southampton", .5450,
                                                                             ifelse(prem_train[i,"team1"] == "Everton", .5197,
                                                                                    ifelse(prem_train[i,"team1"] == "AFC Bournemouth", .5137,
                                                                                           ifelse(prem_train[i,"team1"] == "Swansea City", .4795,
                                                                                                  ifelse(prem_train[i,"team1"] == "Middlesbrough", .4721,
                                                                                                         ifelse(prem_train[i,"team1"] == "West Ham United", .4716,
                                                                                                                ifelse(prem_train[i,"team1"] == "Stoke City", .4629,
                                                                                                                       ifelse(prem_train[i,"team1"] == "Watford", .4597,
                                                                                                                              ifelse(prem_train[i,"team1"] == "Hull City", .4587,
                                                                                                                                     ifelse(prem_train[i,"team1"] == "Crystal Palace", .4518,
                                                                                                                                            ifelse(prem_train[i,"team1"] == "Leicester City", .4203,
                                                                                                                                                   ifelse(prem_train[i,"team1"] == "Burnley", .4021,
                                                                                                                                                          ifelse(prem_train[i,"team1"] == "Sunderland", .3963, .3705)))))))))))))))))))
    prem_train[i,"time2"] = ifelse(prem_train[i,"team2"] == "Manchester City", .6489,
                                   ifelse(prem_train[i,"team2"] == "Liverpool", .6203,
                                          ifelse(prem_train[i,"team2"] == "Tottenham Hotspur", .6042,
                                                 ifelse(prem_train[i,"team2"] == "Arsenal", .5884,
                                                        ifelse(prem_train[i,"team2"] == "Manchester United", .5650,
                                                               ifelse(prem_train[i,"team2"] == "Chelsea", .5492,
                                                                      ifelse(prem_train[i,"team2"] == "Southampton", .5450,
                                                                             ifelse(prem_train[i,"team2"] == "Everton", .5197,
                                                                                    ifelse(prem_train[i,"team2"] == "AFC Bournemouth", .5137,
                                                                                           ifelse(prem_train[i,"team2"] == "Swansea City", .4795,
                                                                                                  ifelse(prem_train[i,"team2"] == "Middlesbrough", .4721,
                                                                                                         ifelse(prem_train[i,"team2"] == "West Ham United", .4716,
                                                                                                                ifelse(prem_train[i,"team2"] == "Stoke City", .4629,
                                                                                                                       ifelse(prem_train[i,"team2"] == "Watford", .4597,
                                                                                                                              ifelse(prem_train[i,"team2"] == "Hull City", .4587,
                                                                                                                                     ifelse(prem_train[i,"team2"] == "Crystal Palace", .4518,
                                                                                                                                            ifelse(prem_train[i,"team2"] == "Leicester City", .4203,
                                                                                                                                                   ifelse(prem_train[i,"team2"] == "Burnley", .4021,
                                                                                                                                                          ifelse(prem_train[i,"team2"] == "Sunderland", .3963, .3705)))))))))))))))))))
  }
  else if (prem_train[i,"season"] == 2017) {
    prem_train[i,"time1"] = ifelse(prem_train[i,"team1"] == "Manchester City", .6989,
                                   ifelse(prem_train[i,"team1"] == "Liverpool", .5929,
                                          ifelse(prem_train[i,"team1"] == "Tottenham Hotspur", .6116,
                                                 ifelse(prem_train[i,"team1"] == "Arsenal", .5974,
                                                        ifelse(prem_train[i,"team1"] == "Manchester United", .5403,
                                                               ifelse(prem_train[i,"team1"] == "Chelsea", .5537,
                                                                      ifelse(prem_train[i,"team1"] == "Southampton", .5116,
                                                                             ifelse(prem_train[i,"team1"] == "Everton", .4592,
                                                                                    ifelse(prem_train[i,"team1"] == "AFC Bournemouth", .4782,
                                                                                           ifelse(prem_train[i,"team1"] == "Swansea City", .4584,
                                                                                                  ifelse(prem_train[i,"team1"] == "Brighton and Hove Albion", .4376,
                                                                                                         ifelse(prem_train[i,"team1"] == "West Ham United", .4482,
                                                                                                                ifelse(prem_train[i,"team1"] == "Stoke City", .4182,
                                                                                                                       ifelse(prem_train[i,"team1"] == "Watford", .5003,
                                                                                                                              ifelse(prem_train[i,"team1"] == "Newcastle", .4239,
                                                                                                                                     ifelse(prem_train[i,"team1"] == "Crystal Palace", .4597,
                                                                                                                                            ifelse(prem_train[i,"team1"] == "Leicester City", .4813,
                                                                                                                                                   ifelse(prem_train[i,"team1"] == "Burnley", .4439,
                                                                                                                                                          ifelse(prem_train[i,"team1"] == "Huddersfield Town", .4668, .4176)))))))))))))))))))
    prem_train[i,"time2"] = ifelse(prem_train[i,"team2"] == "Manchester City", .6989,
                                   ifelse(prem_train[i,"team2"] == "Liverpool", .5929,
                                          ifelse(prem_train[i,"team2"] == "Tottenham Hotspur", .6116,
                                                 ifelse(prem_train[i,"team2"] == "Arsenal", .5974,
                                                        ifelse(prem_train[i,"team2"] == "Manchester United", .5403,
                                                               ifelse(prem_train[i,"team2"] == "Chelsea", .5537,
                                                                      ifelse(prem_train[i,"team2"] == "Southampton", .5116,
                                                                             ifelse(prem_train[i,"team2"] == "Everton", .4592,
                                                                                    ifelse(prem_train[i,"team2"] == "AFC Bournemouth", .4782,
                                                                                           ifelse(prem_train[i,"team2"] == "Swansea City", .4584,
                                                                                                  ifelse(prem_train[i,"team2"] == "Brighton and Hove Albion", .4376,
                                                                                                         ifelse(prem_train[i,"team2"] == "West Ham United", .4482,
                                                                                                                ifelse(prem_train[i,"team2"] == "Stoke City", .4182,
                                                                                                                       ifelse(prem_train[i,"team2"] == "Watford", .5003,
                                                                                                                              ifelse(prem_train[i,"team2"] == "Newcastle", .4239,
                                                                                                                                     ifelse(prem_train[i,"team2"] == "Crystal Palace", .4597,
                                                                                                                                            ifelse(prem_train[i,"team2"] == "Leicester City", .4813,
                                                                                                                                                   ifelse(prem_train[i,"team2"] == "Burnley", .4439,
                                                                                                                                                          ifelse(prem_train[i,"team2"] == "Huddersfield Town", .4668, .4176)))))))))))))))))))
  }
  else if (prem_train[i,"season"] == 2018) {
    prem_train[i,"time1"] = ifelse(prem_train[i,"team1"] == "Manchester City", .6679,
                                   ifelse(prem_train[i,"team1"] == "Liverpool", .6100,
                                          ifelse(prem_train[i,"team1"] == "Tottenham Hotspur", .5837,
                                                 ifelse(prem_train[i,"team1"] == "Arsenal", .5703,
                                                        ifelse(prem_train[i,"team1"] == "Manchester United", .5389,
                                                               ifelse(prem_train[i,"team1"] == "Chelsea", .6132,
                                                                      ifelse(prem_train[i,"team1"] == "Southampton", .4463,
                                                                             ifelse(prem_train[i,"team1"] == "Everton", .5168,
                                                                                    ifelse(prem_train[i,"team1"] == "AFC Bournemouth", .4700,
                                                                                           ifelse(prem_train[i,"team1"] == "Wolverhampton", .4605,
                                                                                                  ifelse(prem_train[i,"team1"] == "Brighton and Hove Albion", .4258,
                                                                                                         ifelse(prem_train[i,"team1"] == "West Ham United", .4892,
                                                                                                                ifelse(prem_train[i,"team1"] == "Cardiff City", .3732,
                                                                                                                       ifelse(prem_train[i,"team1"] == "Watford", .4771,
                                                                                                                              ifelse(prem_train[i,"team1"] == "Newcastle", .4179,
                                                                                                                                     ifelse(prem_train[i,"team1"] == "Crystal Palace", .4595,
                                                                                                                                            ifelse(prem_train[i,"team1"] == "Leicester City", .5071,
                                                                                                                                                   ifelse(prem_train[i,"team1"] == "Burnley", .4224,
                                                                                                                                                          ifelse(prem_train[i,"team1"] == "Huddersfield Town", .4771, .4729)))))))))))))))))))
    prem_train[i,"time2"] = ifelse(prem_train[i,"team2"] == "Manchester City", .6679,
                                   ifelse(prem_train[i,"team2"] == "Liverpool", .6100,
                                          ifelse(prem_train[i,"team2"] == "Tottenham Hotspur", .5837,
                                                 ifelse(prem_train[i,"team2"] == "Arsenal", .5703,
                                                        ifelse(prem_train[i,"team2"] == "Manchester United", .5389,
                                                               ifelse(prem_train[i,"team2"] == "Chelsea", .6132,
                                                                      ifelse(prem_train[i,"team2"] == "Southampton", .4463,
                                                                             ifelse(prem_train[i,"team2"] == "Everton", .5168,
                                                                                    ifelse(prem_train[i,"team2"] == "AFC Bournemouth", .4700,
                                                                                           ifelse(prem_train[i,"team2"] == "Wolverhampton", .4605,
                                                                                                  ifelse(prem_train[i,"team2"] == "Brighton and Hove Albion", .4258,
                                                                                                         ifelse(prem_train[i,"team2"] == "West Ham United", .4892,
                                                                                                                ifelse(prem_train[i,"team2"] == "Cardiff City", .3732,
                                                                                                                       ifelse(prem_train[i,"team2"] == "Watford", .4771,
                                                                                                                              ifelse(prem_train[i,"team2"] == "Newcastle", .4179,
                                                                                                                                     ifelse(prem_train[i,"team2"] == "Crystal Palace", .4595,
                                                                                                                                            ifelse(prem_train[i,"team2"] == "Leicester City", .5071,
                                                                                                                                                   ifelse(prem_train[i,"team2"] == "Burnley", .4224,
                                                                                                                                                          ifelse(prem_train[i,"team2"] == "Huddersfield Town", .4771, .4729)))))))))))))))))))
  }
  else {
    prem_train[i,"time1"] = ifelse(prem_train[i,"team1"] == "Manchester City", .6653,
                                   ifelse(prem_train[i,"team1"] == "Liverpool", .6370,
                                          ifelse(prem_train[i,"team1"] == "Tottenham Hotspur", .5174,
                                                 ifelse(prem_train[i,"team1"] == "Arsenal", .5332,
                                                        ifelse(prem_train[i,"team1"] == "Manchester United", .5635,
                                                               ifelse(prem_train[i,"team1"] == "Chelsea", .6062,
                                                                      ifelse(prem_train[i,"team1"] == "Southampton", .4911,
                                                                             ifelse(prem_train[i,"team1"] == "Everton", .4918,
                                                                                    ifelse(prem_train[i,"team1"] == "AFC Bournemouth", .4353,
                                                                                           ifelse(prem_train[i,"team1"] == "Wolverhampton", .4816,
                                                                                                  ifelse(prem_train[i,"team1"] == "Brighton and Hove Albion", .5216,
                                                                                                         ifelse(prem_train[i,"team1"] == "West Ham United", .4430,
                                                                                                                ifelse(prem_train[i,"team1"] == "Sheffield United", .4368,
                                                                                                                       ifelse(prem_train[i,"team1"] == "Watford", .4318,
                                                                                                                              ifelse(prem_train[i,"team1"] == "Newcastle", .3903,
                                                                                                                                     ifelse(prem_train[i,"team1"] == "Crystal Palace", .4447,
                                                                                                                                            ifelse(prem_train[i,"team1"] == "Leicester City", .5637,
                                                                                                                                                   ifelse(prem_train[i,"team1"] == "Burnley", .4232,
                                                                                                                                                          ifelse(prem_train[i,"team1"] == "Norwich City", .4855, .4413)))))))))))))))))))
    prem_train[i,"time2"] = ifelse(prem_train[i,"team2"] == "Manchester City", .6653,
                                   ifelse(prem_train[i,"team2"] == "Liverpool", .6370,
                                          ifelse(prem_train[i,"team2"] == "Tottenham Hotspur", .5174,
                                                 ifelse(prem_train[i,"team2"] == "Arsenal", .5332,
                                                        ifelse(prem_train[i,"team2"] == "Manchester United", .5635,
                                                               ifelse(prem_train[i,"team2"] == "Chelsea", .6062,
                                                                      ifelse(prem_train[i,"team2"] == "Southampton", .4911,
                                                                             ifelse(prem_train[i,"team2"] == "Everton", .4918,
                                                                                    ifelse(prem_train[i,"team2"] == "AFC Bournemouth", .4353,
                                                                                           ifelse(prem_train[i,"team2"] == "Wolverhampton", .4816,
                                                                                                  ifelse(prem_train[i,"team2"] == "Brighton and Hove Albion", .5216,
                                                                                                         ifelse(prem_train[i,"team2"] == "West Ham United", .4430,
                                                                                                                ifelse(prem_train[i,"team2"] == "Sheffield United", .4368,
                                                                                                                       ifelse(prem_train[i,"team2"] == "Watford", .4318,
                                                                                                                              ifelse(prem_train[i,"team2"] == "Newcastle", .3903,
                                                                                                                                     ifelse(prem_train[i,"team2"] == "Crystal Palace", .4447,
                                                                                                                                            ifelse(prem_train[i,"team2"] == "Leicester City", .5637,
                                                                                                                                                   ifelse(prem_train[i,"team2"] == "Burnley", .4232,
                                                                                                                                                          ifelse(prem_train[i,"team2"] == "Norwich City", .4855, .4413)))))))))))))))))))
  }
}

for (i in 1:nrow(prem_predict)) {
  prem_predict[i,"time1"] = ifelse(prem_predict[i,"team1"] == "Manchester City", .6548,
                                   ifelse(prem_predict[i,"team1"] == "Liverpool", .6414,
                                          ifelse(prem_predict[i,"team1"] == "Chelsea", .6136,
                                                 ifelse(prem_predict[i,"team1"] == "Leeds United", .6071,
                                                        ifelse(prem_predict[i,"team1"] == "Manchester United", .5523,
                                                               ifelse(prem_predict[i,"team1"] == "Southampton", .5338,
                                                                      ifelse(prem_predict[i,"team1"] == "Leicester City", .5291,
                                                                             ifelse(prem_predict[i,"team1"] == "Arsenal", .5245,
                                                                                    ifelse(prem_predict[i,"team1"] == "Brighton and Hove Albion", .5050,
                                                                                           ifelse(prem_predict[i,"team1"] == "Everton", .4895,
                                                                                                  ifelse(prem_predict[i,"team1"] == "Aston Villa", .4985,
                                                                                                         ifelse(prem_predict[i,"team1"] == "Tottenham Hotspur", .4860,
                                                                                                                ifelse(prem_predict[i,"team1"] == "Wolverhampton", .4818,
                                                                                                                       ifelse(prem_predict[i,"team1"] == "Fulham", .4765,
                                                                                                                              ifelse(prem_predict[i,"team1"] == "West Ham United", .4205,
                                                                                                                                     ifelse(prem_predict[i,"team1"] == "Sheffield United", .4177,
                                                                                                                                            ifelse(prem_predict[i,"team1"] == "Crystal Palace", .4136,
                                                                                                                                                   ifelse(prem_predict[i,"team1"] == "Burnley", .3929,
                                                                                                                                                          ifelse(prem_predict[i,"team1"] == "Newcastle", .3918, .3736)))))))))))))))))))
  prem_predict[i,"time2"] = ifelse(prem_predict[i,"team2"] == "Manchester City", .6548,
                                   ifelse(prem_predict[i,"team2"] == "Liverpool", .6414,
                                          ifelse(prem_predict[i,"team2"] == "Chelsea", .6136,
                                                 ifelse(prem_predict[i,"team2"] == "Leeds United", .6071,
                                                        ifelse(prem_predict[i,"team2"] == "Manchester United", .5523,
                                                               ifelse(prem_predict[i,"team2"] == "Southampton", .5338,
                                                                      ifelse(prem_predict[i,"team2"] == "Leicester City", .5291,
                                                                             ifelse(prem_predict[i,"team2"] == "Arsenal", .5245,
                                                                                    ifelse(prem_predict[i,"team2"] == "Brighton and Hove Albion", .5050,
                                                                                           ifelse(prem_predict[i,"team2"] == "Everton", .4895,
                                                                                                  ifelse(prem_predict[i,"team2"] == "Aston Villa", .4985,
                                                                                                         ifelse(prem_predict[i,"team2"] == "Tottenham Hotspur", .4860,
                                                                                                                ifelse(prem_predict[i,"team2"] == "Wolverhampton", .4818,
                                                                                                                       ifelse(prem_predict[i,"team2"] == "Fulham", .4765,
                                                                                                                              ifelse(prem_predict[i,"team2"] == "West Ham United", .4205,
                                                                                                                                     ifelse(prem_predict[i,"team2"] == "Sheffield United", .4177,
                                                                                                                                            ifelse(prem_predict[i,"team2"] == "Crystal Palace", .4136,
                                                                                                                                                   ifelse(prem_predict[i,"team2"] == "Burnley", .3929,
                                                                                                                                                          ifelse(prem_predict[i,"team2"] == "Newcastle", .3918, .3736)))))))))))))))))))
}

#run Poisson regression
search()
detach()
library(lmtest)
attach(prem_train)
time_main_effects_home = glm(score1~adj1_for+adj2_allowed+form_for1+form_against2+time1, family="poisson")
summary(time_main_effects_home)


time_interaction_home = glm(score1~adj1_for+adj2_allowed+time1+form_for1+form_against2+
                              adj1_for:form_for1+
                              adj2_allowed:form_against2+
                              form_for1:form_against2
                            , family="poisson")

summary(time_interaction_home)

home.glm = glm(score1~adj1_for+adj2_allowed+form_for1+form_against2+time1+
                 I(form_for1^2)+
                 I(form_against2^2)
                 ,family="poisson")

summary(home.glm)


away.glm = glm(score2~adj2_for+adj1_allowed+form_for2+form_against1+time2+
                 form_for2:form_against1+
                 I(form_for2^2)+
                 I(form_against1^2)
               ,family="poisson")
summary(away.glm)

#select upcoming games
prem_predict = prem_predict[3:6,]

home = predict.glm(home.glm,prem_predict,type='response')
away = predict.glm(away.glm,prem_predict,type='response')
feb13 = data.frame(home,away)

#results
feb13
