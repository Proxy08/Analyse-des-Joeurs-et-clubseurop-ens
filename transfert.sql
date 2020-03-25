-------reproduce Ony once --------

------- CREATE DATABASE --------
CREATE DATABASE transferts;
--------USE DATABASE -------
use transferts;
--------- CREATE TABLE Player --------------
CREATE TABLE Player (
    id                  INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    player_api_id       INTEGER NOT NULL,
    player_name         VARCHAR(255),
    player_fifa_api_id  INTEGER NOT NULL,
    birthday            TEXT,
    height              INTEGER,
    weight              INTEGER,
    wage_eur            INTEGER,
    value_eur           INTEGER
);
---------LEAGUE TABLE CREATION -----------
CREATE TABLE League (
    id           INTEGER PRIMARY KEY AUTO_INCREMENT,
    country_id    INTEGER NOT NULL,
    name          VARCHAR(255),
    country_name  VARCHAR(255)
);

----------- TEAM TABLE CREATION ----------
CREATE TABLE `Team` (
	`id`	INTEGER PRIMARY KEY AUTO_INCREMENT,
	`team_api_id`	INTEGER UNIQUE,
	`team_fifa_api_id`	INTEGER ,
	`team_long_name`	VARCHAR(255),
	`team_short_name`	TEXT
);

---------- TEAM ATTRIBUT TABLE CREATION --------- 
CREATE TABLE `Team_Attributes` (
	`id`	INTEGER PRIMARY KEY AUTO_INCREMENT,
	`team_api_id`	INTEGER,
	`team_fifa_api_id`	INTEGER,
	`date`	TEXT,
	`buildUpPlaySpeed`	INTEGER,
	`buildUpPlaySpeedClass`	TEXT,
	`buildUpPlayDribbling`	INTEGER,
	`buildUpPlayDribblingClass`	TEXT,
	`buildUpPlayPassing`	INTEGER,
	`buildUpPlayPassingClass`	TEXT,
	`buildUpPlayPositioningClass`	TEXT,
	`chanceCreationPassing`	INTEGER,
	`chanceCreationPassingClass`	TEXT,
	`chanceCreationCrossing`	INTEGER,
	`chanceCreationCrossingClass`	TEXT,
	`chanceCreationShooting`	INTEGER,
	`chanceCreationShootingClass`	TEXT,
	`chanceCreationPositioningClass`	TEXT,
	`defencePressure`	INTEGER,
	`defencePressureClass`	TEXT,
	`defenceAggression`	INTEGER,
	`defenceAggressionClass`	TEXT,
	`defenceTeamWidth`	INTEGER,
	`defenceTeamWidthClass`	TEXT,
	`defenceDefenderLineClass`	TEXT
);

----------- CREATION PLAYER ATTRIBUT ------- 
CREATE TABLE `Player_Attributes` (
	`id`	INTEGER PRIMARY KEY AUTO_INCREMENT,
	`player_fifa_api_id`	INTEGER,
	`player_api_id`	INTEGER,
	`date`	TEXT,
	`overall_rating`	INTEGER,
	`potential`	INTEGER,
	`preferred_foot`	TEXT,
	`attacking_work_rate`	TEXT,
	`defensive_work_rate`	TEXT,
	`crossing`	INTEGER,
	`finishing`	INTEGER,
	`heading_accuracy`	INTEGER,
	`short_passing`	INTEGER,
	`volleys`	INTEGER,
	`dribbling`	INTEGER,
	`curve`	INTEGER,
	`free_kick_accuracy`	INTEGER,
	`long_passing`	INTEGER,
	`ball_control`	INTEGER,
	`acceleration`	INTEGER,
	`sprint_speed`	INTEGER,
	`agility`	INTEGER,
	`reactions`	INTEGER,
	`balance`	INTEGER,
	`shot_power`	INTEGER,
	`jumping`	INTEGER,
	`stamina`	INTEGER,
	`strength`	INTEGER,
	`long_shots`	INTEGER,
	`aggression`	INTEGER,
	`interceptions`	INTEGER,
	`positioning`	INTEGER,
	`vision`	INTEGER,
	`penalties`	INTEGER,
	`marking`	INTEGER,
	`standing_tackle`	INTEGER,
	`sliding_tackle`	INTEGER,
	`gk_diving`	INTEGER,
	`gk_handling`	INTEGER,
	`gk_kicking`	INTEGER,
	`gk_positioning`	INTEGER,
	`gk_reflexes`	INTEGER
);
---------- INDEXING PART FOR FOREIGN KEY -------- 
--------- index and foreign key for player ----- 
CREATE INDEX player_fifa_api_id
ON player (player_fifa_api_id);
CREATE INDEX player_api_id
ON player (player_api_id);
ALTER TABLE Player_Attributes 
   ADD FOREIGN KEY (player_fifa_api_id) REFERENCES Player (player_fifa_api_id);
ALTER TABLE Player_Attributes 
   ADD FOREIGN KEY (player_api_id) REFERENCES Player (player_api_id);
------------index and foreign key for team -------   
   CREATE INDEX team_fifa_api_id
ON team (team_fifa_api_id);
CREATE INDEX team_api_id
ON team (team_api_id);
ALTER TABLE Team_Attributes 
   ADD FOREIGN KEY (team_api_id) REFERENCES Team (team_api_id);
ALTER TABLE Team_Attributes 
   ADD FOREIGN KEY (team_fifa_api_id) REFERENCES Team (team_fifa_api_id);
   
   
---------------------------------
CREATE INDEX name
ON League (name);
CREATE INDEX team_long_name
ON Team (team_long_name);
-----------------------------------
ALTER TABLE team
MODIFY COLUMN team_long_name varchar(255);
----------------Transfert table------------------


CREATE TABLE "Transfert" (
    player_id  INT,
    `Name` varchar(255),
    `Position` varchar(255),
    Age INT,
    Team_from varchar(255),
    League_from varchar(255),
    Team_to varchar(255),
    League_to varchar(255),
    Market_value int,
    Transfert_fee int);



----------
ALTER TABLE transfert MODIFY COLUMN player_id int null; 
ALTER TABLE Transfert 
   ADD FOREIGN KEY (player_id) REFERENCES Player (player_fifa_api_id);
ALTER TABLE Transfert 
   ADD FOREIGN KEY (League_from) REFERENCES League (name);
   ALTER TABLE Transfert 
   ADD FOREIGN KEY (League_to) REFERENCES League (name);
      ALTER TABLE Transfert 
   ADD FOREIGN KEY (Team_from) REFERENCES Team (team_long_name);
      ALTER TABLE Transfert 
   ADD FOREIGN KEY (Team_to) REFERENCES Team (team_long_name);



----------------------------------------------
CREATE TABLE `Match` (
	`id`	INTEGER PRIMARY KEY AUTO_INCREMENT,
	`country_id`	INTEGER,
	`league_id`	INTEGER,
	`season`	TEXT,
	`stage`	INTEGER,
	`date`	TEXT,
	`match_api_id`	INTEGER UNIQUE,
	`home_team_api_id`	INTEGER,
	`away_team_api_id`	INTEGER,
	`home_team_goal`	INTEGER,
	`away_team_goal`	INTEGER,
	`home_player_X1`	INTEGER,
	`home_player_X2`	INTEGER,
	`home_player_X3`	INTEGER,
	`home_player_X4`	INTEGER,
	`home_player_X5`	INTEGER,
	`home_player_X6`	INTEGER,
	`home_player_X7`	INTEGER,
	`home_player_X8`	INTEGER,
	`home_player_X9`	INTEGER,
	`home_player_X10`	INTEGER,
	`home_player_X11`	INTEGER,
	`away_player_X1`	INTEGER,
	`away_player_X2`	INTEGER,
	`away_player_X3`	INTEGER,
	`away_player_X4`	INTEGER,
	`away_player_X5`	INTEGER,
	`away_player_X6`	INTEGER,
	`away_player_X7`	INTEGER,
	`away_player_X8`	INTEGER,
	`away_player_X9`	INTEGER,
	`away_player_X10`	INTEGER,
	`away_player_X11`	INTEGER,
	`home_player_Y1`	INTEGER,
	`home_player_Y2`	INTEGER,
	`home_player_Y3`	INTEGER,
	`home_player_Y4`	INTEGER,
	`home_player_Y5`	INTEGER,
	`home_player_Y6`	INTEGER,
	`home_player_Y7`	INTEGER,
	`home_player_Y8`	INTEGER,
	`home_player_Y9`	INTEGER,
	`home_player_Y10`	INTEGER,
	`home_player_Y11`	INTEGER,
	`away_player_Y1`	INTEGER,
	`away_player_Y2`	INTEGER,
	`away_player_Y3`	INTEGER,
	`away_player_Y4`	INTEGER,
	`away_player_Y5`	INTEGER,
	`away_player_Y6`	INTEGER,
	`away_player_Y7`	INTEGER,
	`away_player_Y8`	INTEGER,
	`away_player_Y9`	INTEGER,
	`away_player_Y10`	INTEGER,
	`away_player_Y11`	INTEGER,
	`home_player_1`	INTEGER,
	`home_player_2`	INTEGER,
	`home_player_3`	INTEGER,
	`home_player_4`	INTEGER,
	`home_player_5`	INTEGER,
	`home_player_6`	INTEGER,
	`home_player_7`	INTEGER,
	`home_player_8`	INTEGER,
	`home_player_9`	INTEGER,
	`home_player_10`	INTEGER,
	`home_player_11`	INTEGER,
	`away_player_1`	INTEGER,
	`away_player_2`	INTEGER,
	`away_player_3`	INTEGER,
	`away_player_4`	INTEGER,
	`away_player_5`	INTEGER,
	`away_player_6`	INTEGER,
	`away_player_7`	INTEGER,
	`away_player_8`	INTEGER,
	`away_player_9`	INTEGER,
	`away_player_10`	INTEGER,
	`away_player_11`	INTEGER,
	`goal`	TEXT,
	`shoton`	TEXT,
	`shotoff`	TEXT,
	`foulcommit`	TEXT,
	`card`	TEXT,
	`cross`	TEXT,
	`corner`	TEXT,
	`possession`	TEXT,
	`B365H`	NUMERIC,
	`B365D`	NUMERIC,
	`B365A`	NUMERIC,
	`BWH`	NUMERIC,
	`BWD`	NUMERIC,
	`BWA`	NUMERIC,
	`IWH`	NUMERIC,
	`IWD`	NUMERIC,
	`IWA`	NUMERIC,
	`LBH`	NUMERIC,
	`LBD`	NUMERIC,
	`LBA`	NUMERIC,
	`PSH`	NUMERIC,
	`PSD`	NUMERIC,
	`PSA`	NUMERIC,
	`WHH`	NUMERIC,
	`WHD`	NUMERIC,
	`WHA`	NUMERIC,
	`SJH`	NUMERIC,
	`SJD`	NUMERIC,
	`SJA`	NUMERIC,
	`VCH`	NUMERIC,
	`VCD`	NUMERIC,
	`VCA`	NUMERIC,
	`GBH`	NUMERIC,
	`GBD`	NUMERIC,
	`GBA`	NUMERIC,
	`BSH`	NUMERIC,
	`BSD`	NUMERIC,
	`BSA`	NUMERIC,
	FOREIGN KEY(`home_team_api_id`) REFERENCES `Team`(`team_api_id`),
	FOREIGN KEY(`away_team_api_id`) REFERENCES `Team`(`team_api_id`)
); 
----------------------------------------------



--------------LOAD CSV DATA TO THE DATA BASE  --------
  -- SET GLOBAL local_infile = true;

  SET FOREIGN_KEY_CHECKS=0;
  LOAD DATA LOCAL INFILE '/PATH/team.csv' INTO TABLE Team FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS (id,team_api_id,team_fifa_api_id,team_long_name,team_short_name);
  LOAD DATA LOCAL INFILE '/PATH/league.csv' INTO TABLE League FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS (id,country_id,name,country_name);
  LOAD DATA LOCAL INFILE '/PATH/Team_Attributes.csv' INTO TABLE Team_Attributes FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS (id,team_fifa_api_id,team_api_id,date,buildUpPlaySpeed,buildUpPlaySpeedClass,buildUpPlayDribbling,buildUpPlayDribblingClass,buildUpPlayPassing,buildUpPlayPassingClass,buildUpPlayPositioningClass,chanceCreationPassing,chanceCreationPassingClass,chanceCreationCrossing,chanceCreationCrossingClass,chanceCreationShooting,chanceCreationShootingClass,chanceCreationPositioningClass,defencePressure,defencePressureClass,defenceAggression,defenceAggressionClass,defenceTeamWidth,defenceTeamWidthClass,defenceDefenderLineClass);
  LOAD DATA LOCAL INFILE '/PATH/Player_Attributes.csv' INTO TABLE Player_Attributes FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS (id,player_fifa_api_id,player_api_id,date,overall_rating,potential,preferred_foot,attacking_work_rate,defensive_work_rate,crossing,finishing,heading_accuracy,short_passing,volleys,dribbling,curve,free_kick_accuracy,long_passing,ball_control,acceleration,sprint_speed,agility,reactions,balance,shot_power,jumping,stamina,strength,long_shots,aggression,interceptions,positioning,vision,penalties,marking,standing_tackle,sliding_tackle,gk_diving,gk_handling,gk_kicking,gk_positioning,gk_reflexes);
  LOAD DATA LOCAL INFILE '/PATH/Player.csv' INTO TABLE Player FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS (id,player_api_id,player_name,player_fifa_api_id,birthday,height,weight,value_eur,wage_eur);
  LOAD DATA LOCAL INFILE '/PATH/transfert.csv' INTO TABLE transfert1 FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS (player_id,Name,Position,Age,Team_from,League_from,Team_to,League_to,Market_value,Transfert_fee,Season);
  ----------

select transfert.team_to, transfert.season, sum(transfert.transfert_fee) 
from team, league, transfert
where team.team_long_name = transfert.team_to 
group by team.team_long_name, season;

ALTER TABLE league
ADD UNIQUE (name);

set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


--- first query  
select transfert.team_to,season, sum(transfert.transfert_fee) AS fees
from transfert
group by team_to,season ;
-----




select * from 
(select transfert.team_to, transfert.season, sum(transfert.transfert_fee) 
from team, league, transfert
where team.team_long_name = transfert.team_to 
group by team.team_long_name, season
select team_to, season, fees from
group by team_to, season)
group by team_to, season;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


------------- 1er query -------------- 
select transfert.team_to, transfert.season, league.country_name , sum(transfert.transfert_fee) 
from team, league, transfert
where team.team_long_name = transfert.team_to and league.name = transfert.league_to
group by team.team_long_name, season;


select transfert.team_to, transfert.season, league.country_name , sum(transfert.transfert_fee) as fees 
from team, league, transfert
where team.team_long_name = transfert.team_to and league.name = transfert.league_to
group by team.team_long_name
order by fees desc;

---------------------------------

--------------- 2nd query -------------- 
SELECT transfert.team_to, league.country_name , RANK() OVER (ORDER BY sum(transfert.transfert_fee) desc) as fees 
FROM team, league, transfert
WHERE team.team_long_name = transfert.team_to and league.name = transfert.league_to
GROUP BY team.team_long_name limit 10;
-------------------------------------

---------------  3rd query --------------------
select team.team_long_name , sum(player.wage_eur)  as wages
from team, league, transfert, player
where team.team_long_name = transfert.team_to and league.name = transfert.league_to and player.player_fifa_api_id = transfert.player_id
group by team.team_long_name
ORDER BY wages DESC;
-----------------4th query part 1 --------------------
SELECT team_long_name, team_api_id, home_goales, match_home ,count(match_api_id) as match_away , sum(`Match`.away_team_goal)  as away_goales
FROM (SELECT team_long_name, team_api_id , count(match_api_id) as match_home ,  sum(`Match`.home_team_goal)  as home_goales       
      FROM (select * from team where  team.team_long_name ='Paris Saint-Germain') as q1, `Match`
       where  `Match`.home_team_api_id = q1.team_api_id   and `Match`.date >= '2012-12-26 00:00:00'
     ) as q2, `Match`
       where  `Match`.away_team_api_id = team_api_id   and `Match`.date >= '2012-12-26 00:00:00';
       
       
       ---------------4th part 2 
     --  group by rollup( home_goales, match_home, away_goales, match_away);
   SELECT team_long_name, team_api_id, home_goales , match_home ,count(match_api_id) as match_away , sum(`Match`.away_team_goal)  as away_goales
FROM (SELECT team_long_name, team_api_id , count(match_api_id) as match_home ,  sum(`Match`.home_team_goal)  as home_goales       
      FROM (select * from team where  team.team_long_name ='Paris Saint-Germain') as q1, `Match`
       where  `Match`.home_team_api_id = q1.team_api_id   and `Match`.date <= '2012-12-26 00:00:00'
     ) as q2, `Match`
       where  `Match`.away_team_api_id = team_api_id   and `Match`.date <= '2012-12-26 00:00:00';  
     ------------------------------- 4th part 3----------------------
     SELECT team_long_name, team_api_id, conceded_home_goales, match_home ,count(match_api_id) as match_away , sum(`Match`.home_team_goal)  as conceded_away_goales
FROM (SELECT team_long_name, team_api_id , count(match_api_id) as match_home ,  sum(`Match`.away_team_goal)  as conceded_home_goales       
      FROM (select * from team where  team.team_long_name ='Paris Saint-Germain') as q1, `Match`
       where  `Match`.home_team_api_id = q1.team_api_id   and `Match`.date >= '2012-12-26 00:00:00'
     ) as q2, `Match`
       where  `Match`.away_team_api_id = team_api_id   and `Match`.date >= '2012-12-26 00:00:00';
       ---------------------------4th part 4 ----------------
       SELECT team_long_name, team_api_id, conceded_home_goales, match_home ,count(match_api_id) as match_away , sum(`Match`.home_team_goal)  as conceded_away_goales
FROM (SELECT team_long_name, team_api_id , count(match_api_id) as match_home ,  sum(`Match`.away_team_goal)  as conceded_home_goales       
      FROM (select * from team where  team.team_long_name ='Paris Saint-Germain') as q1, `Match`
       where  `Match`.home_team_api_id = q1.team_api_id   and `Match`.date <= '2012-12-26 00:00:00'
     ) as q2, `Match`
       where  `Match`.away_team_api_id = team_api_id   and `Match`.date <= '2012-12-26 00:00:00';
       
       
     
     ----------------------------------------------- 5th query ----------------------
     select  transfert.name, transfert.age, transfert_fee, transfert.market_value,transfert.team_to,player_attributes.overall_rating,player_attributes.potential, player_attributes.finishing, player_attributes.dribbling, player_attributes.vision, player_attributes.agility, player_attributes.stamina,player_attributes.strength   from 
     transfert, player, player_attributes
     where transfert.season ='2013-2014'  and year(player_attributes.date)='2014' and month(player_attributes.date)='09'  and  player.player_fifa_api_id = transfert.player_id and player_attributes.player_fifa_api_id =player.player_fifa_api_id  
     order by transfert_fee desc limit 2;
    -----------------------------------    
 ---------------------------------6th query part 1------------------
     
     select league_to , right(season,4) as season,market_value, transfert_fee  from transfert;
     
     SELECT league_to , season,market_value, transfert_fee
     FROM (select league_to , right(season,4) as season,market_value, transfert_fee  from transfert) as t1
     WHERE season >= '2013'   and market_value >0
     group by league_to
     order by transfert_fee desc ; 
     
      ---------------------------------6th query part2------------------
     SELECT league_to , market_value, transfert_fee
     FROM (select league_to , right(season,4) as season,market_value, transfert_fee  from transfert) as t1
     WHERE season <= '2012'   and market_value > 0
     group by league_to
     order by transfert_fee desc ;
     ---------------------------------------------
     
     SELECT * FROM transfert;
     
     -----------------------  7th query ---------------------------------------
     
select   league.country_name  , count(transfert.team_to) as  destination 
from team, league, transfert
where team.team_long_name = transfert.team_to and league.name = transfert.league_to
group by league.name
order by destination desc;
     
     
     select * from transfert;
     ----------------------------------------------------------
select team_long_name, team_api_id , sum(`Match`.home_team_goal)  as goales
from (select * from team where  team.team_long_name ='Paris Saint-Germain') as q1, `Match`
 where  `Match`.home_team_api_id = q1.team_api_id  or  `Match`.away_team_api_id = q1.team_api_id   and `Match`.date >= '2012-12-26 00:00:00';

select * from team where  team.team_long_name ='Paris Saint-Germain';

select * from `Match` where `Match`.home_team_api_id = '9847' or `Match`.away_team_api_id ='9847'  and `Match`.date <= '2012-12-26 00:00:00';