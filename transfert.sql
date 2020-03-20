------- CREATE DATABASE --------
CREATE DATABASE transferts;
--------USE DATABASE -------
use transferts;
--------- CREATE TABLE Player --------------
CREATE TABLE Player (
    id                  INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    player_api_id       INTEGER NOT NULL,
    player_name         TEXT,
    player_fifa_api_id  INTEGER NOT NULL,
    birthday            TEXT,
    height              INTEGER,
    weight              INTEGER,
    wage_eur            INTEGER,
    value_eur           INTEGER
);
drop table player;
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
	`team_long_name`	TEXT,
	`team_short_name`	TEXT
);
DROP TABLE Team;
---------- TEAM ATTRIBUT TABLE CREATION --------- 
CREATE TABLE `Team_Attributes` (
	`id`	INTEGER PRIMARY KEY AUTO_INCREMENT,
	`team_api_id`	INTEGER UNIQUE,
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
----------------------------------
ALTER TABLE transfert MODIFY COLUMN player_id int null; 
ALTER TABLE Transfert1 
   ADD FOREIGN KEY (player_id) REFERENCES Player (player_fifa_api_id);
ALTER TABLE Transfert1 
   ADD FOREIGN KEY (League_from) REFERENCES League (name);
   ALTER TABLE Transfert 
   ADD FOREIGN KEY (League_to) REFERENCES League (name);
      ALTER TABLE Transfert 
   ADD FOREIGN KEY (Team_from) REFERENCES Team (team_long_name);
      ALTER TABLE Transfert1 
   ADD FOREIGN KEY (Team_to) REFERENCES Team (team_long_name);

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

select * from league ;
-------------------

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
---second query 
select transfert.team_to, transfert.season, league.country_name , sum(transfert.transfert_fee) 
from team, league, transfert
where team.team_long_name = transfert.team_to and league.name = transfert.league_to
group by team.team_long_name, season;
----
select * from team ;
select * from league;
select * from transfert;


--- UPDATE transfert SET  League_from = 'Italy Serie A', League_to = 'Italy Serie A'
 ---WHERE League_to = ' Serie B'

select * from 
(select transfert.team_to, transfert.season, sum(transfert.transfert_fee) 
from team, league, transfert
where team.team_long_name = transfert.team_to 
group by team.team_long_name, season
select team_to, season, fees from
group by team_to, season)
group by team_to, season;



SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
