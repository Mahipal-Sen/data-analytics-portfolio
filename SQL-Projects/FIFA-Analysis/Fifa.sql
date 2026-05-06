create database Fifa;
use Fifa;

-- 1.Write an sql query to show all the UNIQUE team names

select distinct team 
from  team_data td  ; 

-- 2.Write an SQL query to show name of team which has rank 1 from group 7

select team 
from group_stats gs 
where `rank` = 1 and `group` = 7 ;

-- 3.Write an sql query to show count of all teams

select count(*)
from team_data td  ;

-- 4.Write an SQL query to show matches_played by each team

select team, matches_played
from group_stats gs  ; 

-- 5.Write an SQL query to show team, percent of wins with respect to matches_played by each team and name the resulting column as wins_percent

select team,(wins*100.0 / matches_played ) Wins_Percent 
from group_stats gs ; 

-- 6.Write an SQL query to show which team has maximum goals_scored and their count


select team, goals_scored
from group_stats gs 
where goals_scored = (
    select max(goals_scored) 
    from group_stats gs
); 


-- 7.Write an SQL query to show percent of draws with respect to matches_played round of to 2 digits by each team

select team,round(draws*100.0 / matches_played ,2 ) Draw_Percentage
from group_stats gs  ;

-- 8.Write an SQL query to show which team has minimum goals_scored and their count

select team, goals_scored
from group_stats gs  
where goals_scored = (
    select min(goals_scored) 
    from group_stats gs 
);

-- 9.Write an SQL query to show percent of losses with respect to matches_played by each team in ascending order by losses and name the resulting column as losses_percent

select team,round(losses *100.0 / matches_played ,2 ) Losses_percentage
from group_stats gs   
order by losses_percentage ;


-- 10.Write an SQL query to show the average goal_difference


select avg(goal_difference)
from group_stats gs  ;

-- 11.Write an SQL query to show name of the team where points are 0

select team,points  from group_stats gs  
where points = 0;

-- 12.Write a SQL query to show all data where expected_goal_scored is less than exp_goal_conceded

select *
from group_stats gs  
where expected_goal_scored < exp_goal_conceded ;



-- 13.Write an SQL query to show data where exp_goal_difference is in between -0.5 and 0.5

select *
from group_stats gs  
where exp_goal_difference between  -0.5 and 0.5 ;


-- 14.Write an SQL query to show all data in ascending order by exp_goal_difference_per_90

select *
from group_stats gs  
order by exp_goal_difference_per_90 ;



-- 15.Write an SQL query to show team which has maximum number of players_used

select team , players_used  
from team_data td  
where players_used= (
    select max(players_used ) 
    from team_data td   
); 




-- 16.Write an SQL query to show each team name and avg_age in ascending order by avg_age

select team, avg_age
from team_data td 
order by avg_age ;

-- 17.Write an sql query to show average possession of teams

select avg(possession )
from team_data td   ; 

-- 18.Write a SQL query to show team which has played atleast 5 games

select team, games 
from team_data td  
where games  >= 5;

-- 19.Write an SQL query to show all data for which minutes is greater than 600

select * 
from team_data td  
where minutes > 600;

-- 20.Write an SQL query to show team, goals, assists in ascending order by goals

select team, goals ,assists 
from team_data td 
order by goals ;

-- 21.Write an SQL query to show team, pens_made, pens_att in descending order by pens_made

select team, pens_made, pens_att  
from team_data td 
order by pens_made desc ;


-- 22.Write an SQL query to show team, cards_yellow, cards_red where cards_red is equal to 1 in ascending order by cards_yellow


select team, cards_yellow , cards_red   
from team_data td  
where cards_red = 1
order by cards_yellow  asc ;


-- 23.Write an SQL query to show team, goals_per90, assists_per90, goals_assists_per90 in descending order by goals_assists_per90

select team, goals_per90, assists_per90, goals_assists_per90   
from team_data td 
order by goals_assists_per90 desc ;

-- 24.Write an SQL query to show team, goals_pens_per90, goals_assists_pens_per90 in ascending order by goals_assists_pens_per90

select team, goals_pens_per90, goals_assists_pens_per90  
from team_data td 
order by goals_assists_pens_per90 ;

-- 25.Write an SQL query to show team, shots, shots_on_target, shots_on_target_pct where shots_on_target_pct is less than 30 in ascending order by shots_on_target_pct

select team, shots, shots_on_target, shots_on_target_pct   
from team_data td 
where shots_on_target_pct < 30
order by shots_on_target_pct  ;

-- 26.Write an SQL query to show team, shots_per90, shots_on_target_per90 for team Belgium

select team, shots_per90, shots_on_target_per90   
from team_data td 
where team = 'Belgium';

-- 27.Write an SQL query to show team, goals_per_shot, goals_per_shot_on_target, average_shot_distance in descending order by average_shot_distance

select team, goals_per_shot, goals_per_shot_on_target, average_shot_distance
from team_data td 
order by average_shot_distance desc ;

-- 28.Write an SQL query to show team, errors, touches for which errors is 0 and touches is less than 1500

select team, errors, touches
from team_data td 
where errors = 0 
and touches < 1500;

-- 29.Write an SQL query to show team, fouls which has maximum number of fouls

select team, fouls
from team_data td 
where fouls = (
      select max(fouls )
      from team_data td 
      );

-- 30.Write an SQL query to show team, offisdes which has offsides less than 10 or greater than 20

select team, offsides
from team_data td 
where offsides  < 10 
or offsides > 20;

-- 31.Write an SQL query to show team, aerials_won, aerials_lost, aerials_won_pct in descending order by aerials_won_pct

select team, aerials_won, aerials_lost, aerials_won_pct  
from team_data td 
order by aerials_won_pct desc;

-- 32.Write an SQL query to show number of teams each group has!

select `group`  ,count(team)
from group_stats gs  
group by `group`; 

-- 33.Write a SQL query to show team names group 6 has

select team
from group_stats gs  
where `group` = 6;

-- 34.Write an SQL query to show Australia belongs to which group

select `group` 
from group_stats gs  
where team  = 'Australia';

-- 35.Write an SQL query to show group, average wins by each group

select `group` , avg(wins )
from  group_stats gs  
group by `group` ;

-- 36.Write an SQL query to show group, maximum expected_goal_scored by each group in ascending order by expected_goal_scored

select `group` , max(expected_goal_scored )
from  group_stats gs  
group by `group` 
order by max(expected_goal_scored);

-- 37.Write an SQL query to show group, minimum exp_goal_conceded by each group in descending order by exp_goal_conceded

select `group` , min(exp_goal_conceded )
from  group_stats gs  
group by `group` 
order by min(exp_goal_conceded) desc ;

-- 38.Write an SQL query to show group, average exp_goal_difference_per_90 for each group in ascending order by exp_goal_difference_per_90

select `group` , avg(exp_goal_difference_per_90 )
from  group_stats gs  
group by `group` 
order by avg(exp_goal_difference_per_90);


-- 39.Write an SQL query to show which team has equal number of goals_scored and goals_against

select team ,goals_scored,goals_against
from group_stats gs  
where goals_scored = goals_against ;

-- 40.Write an SQL query to show which team has maximum players_used

select team , players_used  
from team_data td  
where players_used= (
    select max(players_used ) 
    from team_data td 
); 

-- 41.Write an SQL query to show team, players_used, avg_age, games, minutes where minutes lessthan 500 and greater than 200

select gs.team, players_used, avg_age, games, minutes 
from group_stats gs 
join team_data td  
on td.team = gs.team 
where td.minutes > 200 and td.minutes < 500;

-- 42.Write an SQL query to show all data of group_stats in ascending order BY points

select * 
from group_stats gs   
order by points ;

-- 43.Write an SQL query to show ALL UNIQUE team in ascending order by team

select distinct team
from group_stats gs  
order by team ;

-- 44.Write an SQL query to show average avg_age of each group and arrange it in descending order by avg_age.

select gs.`group`, avg(td.avg_age)  
from group_stats gs 
join team_data td  
on td.team =gs.team 
group by `group` 
order by avg(td.avg_age ) desc ;

-- 45.Write an SQL query to show sum of fouls for each group and arrange it in ascending order by fouls.

select gs.`group`, sum(td.fouls )  
from group_stats gs 
join team_data td  
on td.team =gs.team 
group by `group` 
order by sum(td.fouls  )  ;

-- 46.Write an SQL query to show total number of games for each group and arrange it in descending order by games.

select gs.`group`, sum( td.games  )  
from group_stats gs 
join team_data td  
on td.team =gs.team 
group by `group` 
order by sum(games) desc  ;

-- 47.Write an SQL query to show total number of players_used for each group and arrange it in ascending order by players_used.

select gs.`group`, sum( td.players_used  )  
from group_stats gs 
join team_data td  
on td.team = gs.team 
group by `group` 
order by sum(td.players_used  )  ;

-- 48.Write an SQL query to show total number of offsides for each group and arrange it in ascending order by offsides.

select gs.`group`, sum( td.offsides  )  
from group_stats gs 
join team_data td  
on td.team =gs.team 
group by `group` 
order by sum(td.offsides  )  ;


-- 49.Write an SQL query to show average passes_pct for each group and arrange it in descending order by passes_pct.

select gs.`group`, avg(td.passes_pct)  
from group_stats gs 
join team_data td  
on td.team =gs.team 
group by `group` 
order by avg(td.passes_pct ) desc ;

-- 50.Write an SQL query to show average goals_per90 for each group and arrange it in ascending order by goals_per90.

select gs.`group`, avg(td.goals_per90)  
from group_stats gs 
join team_data td  
on td.team =gs.team 
group by `group` 
order by avg(td.goals_per90 )  ;

