DROP DATABASE IF EXISTS formula1_db;
CREATE DATABASE formula1_db;
show databases;
USE formula1_db;

-- T A B L E S
-- TABLE 1: Teams
DROP TABLE IF EXISTS teams;
CREATE TABLE teams(
	team_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- TABLE 2: Drivers
DROP TABLE IF EXISTS drivers;
CREATE TABLE drivers(
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);



-- TABLE 3: Seasons
DROP TABLE IF EXISTS seasons;
CREATE TABLE seasons(
	season_id INT PRIMARY KEY AUTO_INCREMENT,
	year INT NOT NULL
);

-- TABLE 4: Circuits
DROP TABLE IF EXISTS circuits;
CREATE TABLE circuits(
	circuit_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    length DECIMAL(5, 2) NOT NULL
);

-- TABLE 5: Races
DROP TABLE IF EXISTS races;
CREATE TABLE races(
	race_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    location VARCHAR(100) NOT NULL,
    season_id INT,
    FOREIGN KEY (season_id) REFERENCES seasons(season_id)
);

-- TABLE 6: Results
DROP TABLE IF EXISTS results;
CREATE TABLE results(
	result_id INT PRIMARY KEY AUTO_INCREMENT,
    race_id INT,
    driver_id INT,
    team_id INT,
    position INT NOT NULL,
    points INT NOT NULL,
    FOREIGN KEY (race_id) REFERENCES races(race_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

-- TABLE 7: Fastest Laps
DROP TABLE IF EXISTS fastest_laps;
CREATE TABLE fastest_laps(
	fastest_lap_id INT PRIMARY KEY AUTO_INCREMENT,
    race_id INT,
    driver_id INT,
    time VARCHAR(10) NOT NULL,
    FOREIGN KEY (race_id) REFERENCES races(race_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

-- TABLE 8: Qualifying
DROP TABLE IF EXISTS qualifying;
CREATE TABLE qualifying(
    qualifying_id INT PRIMARY KEY AUTO_INCREMENT,
    race_id INT,
    driver_id INT,
    position INT NOT NULL,
    FOREIGN KEY (race_id) REFERENCES races(race_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

-- TABLE 9: Penalties
DROP TABLE IF EXISTS penalties;
CREATE TABLE penalties(
    penalty_id INT PRIMARY KEY AUTO_INCREMENT,
    driver_id INT,
    race_id INT,
    description VARCHAR(255) NOT NULL,
    time_penalty VARCHAR(50) NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (race_id) REFERENCES races(race_id)
);

-- TABLE 10: Engineers
DROP TABLE IF EXISTS engineers;
CREATE TABLE engineers(
    engineer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- TABLE 11: Engineering Team
DROP TABLE IF EXISTS engineering_team;
CREATE TABLE engineering_team(
    engineering_team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_id INT,
    engineer_id INT,
    season_id INT,
    FOREIGN KEY (team_id) REFERENCES teams(team_id),
    FOREIGN KEY (engineer_id) REFERENCES engineers(engineer_id),
    FOREIGN KEY (season_id) REFERENCES seasons(season_id)
);

-- TABLE 12: Sponsors
DROP TABLE IF EXISTS sponsors;
CREATE TABLE sponsors(
    sponsor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- TABLE 13: Team Sponsors
DROP TABLE IF EXISTS team_sponsors;
CREATE TABLE team_sponsors(
    team_sponsor_id INT PRIMARY KEY AUTO_INCREMENT,
    team_id INT,
    sponsor_id INT,
    season_id INT,
    FOREIGN KEY (team_id) REFERENCES teams(team_id),
    FOREIGN KEY (sponsor_id) REFERENCES sponsors(sponsor_id),
    FOREIGN KEY (season_id) REFERENCES seasons(season_id)
);

-- I N S E R T - ( D A T A )
-- Insert data into Teams
INSERT INTO teams (name, country) VALUES
('Mercedes-AMG Petronas Formula One Team', 'Germany'),
('Red Bull Racing', 'Austria'),
('Scuderia Ferrari', 'Italy'),
('McLaren F1 Team', 'United Kingdom'),
('Alpine F1 Team', 'France'),
('Aston Martin Cognizant F1 Team', 'United Kingdom'),
('Williams Racing', 'United Kingdom'),
('Alfa Romeo Racing Orlen', 'Switzerland'),
('Haas F1 Team', 'United States'),
('Scuderia AlphaTauri', 'Italy');

select * from teams;

-- Insert data into Drivers
INSERT INTO drivers (first_name, last_name, nationality, date_of_birth, team_id) VALUES
('Lewis', 'Hamilton', 'British', '1985-01-07', 1),
('George', 'Russell', 'British', '1998-02-15', 1),
('Max', 'Verstappen', 'Dutch', '1997-09-30', 2),
('Sergio', 'Perez', 'Mexican', '1990-01-26', 2),
('Charles', 'Leclerc', 'Monacan', '1997-10-16', 3),
('Carlos', 'Sainz', 'Spanish', '1994-09-01', 3),
('Lando', 'Norris', 'British', '1999-11-13', 4),
('Daniel', 'Ricciardo', 'Australian', '1989-07-01', 4),
('Fernando', 'Alonso', 'Spanish', '1981-07-29', 5),
('Esteban', 'Ocon', 'French', '1996-09-17', 5),
('Sebastian', 'Vettel', 'German', '1987-07-03', 6),
('Lance', 'Stroll', 'Canadian', '1998-10-29', 6),
('Nicholas', 'Latifi', 'Canadian', '1995-06-29', 7),
('Alex', 'Albon', 'Thai', '1996-03-23', 7),
('Valtteri', 'Bottas', 'Finnish', '1989-08-28', 8),
('Zhou', 'Guanyu', 'Chinese', '1999-05-30', 8),
('Kevin', 'Magnussen', 'Danish', '1992-10-05', 9),
('Mick', 'Schumacher', 'German', '1999-03-22', 9),
('Pierre', 'Gasly', 'French', '1996-02-07', 10),
('Yuki', 'Tsunoda', 'Japanese', '2000-05-11', 10);

select * from drivers;

-- Insert data into Seasons
INSERT INTO seasons (year) VALUES
(2020),
(2021),
(2022),
(2023);

select * from seasons;

-- Insert data into Circuits
INSERT INTO circuits (name, country, length) VALUES
('Silverstone Circuit', 'United Kingdom', 5.89),
('Circuit de Monaco', 'Monaco', 3.34),
('Monza Circuit', 'Italy', 5.79),
('Spa-Francorchamps', 'Belgium', 7.00),
('Circuit de Barcelona-Catalunya', 'Spain', 4.65),
('Circuit Gilles Villeneuve', 'Canada', 4.36),
('Suzuka International Racing Course', 'Japan', 5.81),
('Yas Marina Circuit', 'UAE', 5.55),
('Interlagos Circuit', 'Brazil', 4.31),
('Bahrain International Circuit', 'Bahrain', 5.41),
('Hungaroring', 'Hungary', 4.38),
('Circuit of the Americas', 'United States', 5.51),
('Autodromo Hermanos Rodriguez', 'Mexico', 4.30),
('Shanghai International Circuit', 'China', 5.45),
('Marina Bay Street Circuit', 'Singapore', 5.07),
('Sochi Autodrom', 'Russia', 5.84),
('Red Bull Ring', 'Austria', 4.32),
('Nurburgring', 'Germany', 5.15),
('Zandvoort', 'Netherlands', 4.26),
('Losail International Circuit', 'Qatar', 5.38);

select * from circuits;


-- Insert data into Races
INSERT INTO races (name, date, location, season_id) VALUES
('British Grand Prix', '2023-07-16', 'Silverstone', 4),
('Monaco Grand Prix', '2023-05-28', 'Monaco', 4),
('Italian Grand Prix', '2023-09-03', 'Monza', 4),
('Belgian Grand Prix', '2023-08-27', 'Spa-Francorchamps', 4),
('Spanish Grand Prix', '2023-06-04', 'Barcelona', 4),
('Canadian Grand Prix', '2023-06-18', 'Montreal', 4),
('Japanese Grand Prix', '2023-10-08', 'Suzuka', 4),
('Abu Dhabi Grand Prix', '2023-11-26', 'Yas Marina', 4),
('Brazilian Grand Prix', '2023-11-05', 'Interlagos', 4),
('Bahrain Grand Prix', '2023-03-05', 'Bahrain', 4),
('Hungarian Grand Prix', '2023-07-30', 'Hungaroring', 4),
('United States Grand Prix', '2023-10-22', 'Austin', 4),
('Mexican Grand Prix', '2023-10-29', 'Mexico City', 4),
('Chinese Grand Prix', '2023-04-16', 'Shanghai', 4),
('Singapore Grand Prix', '2023-09-17', 'Marina Bay', 4),
('Russian Grand Prix', '2023-09-24', 'Sochi', 4),
('Austrian Grand Prix', '2023-07-02', 'Spielberg', 4),
('German Grand Prix', '2023-08-13', 'Nurburgring', 4),
('Dutch Grand Prix', '2023-09-03', 'Zandvoort', 4),
('Qatar Grand Prix', '2023-11-19', 'Losail', 4);

select * from races;

-- Insert data into Results
INSERT INTO results (race_id, driver_id, team_id, position, points) VALUES
(1, 1, 1, 1, 25),
(1, 2, 1, 2, 18),
(2, 3, 2, 1, 25),
(2, 4, 2, 2, 18),
(3, 5, 3, 1, 25),
(3, 6, 3, 2, 18),
(4, 7, 4, 1, 25),
(4, 8, 4, 2, 18),
(5, 9, 5, 1, 25),
(5, 10, 5, 2, 18),
(6, 11, 6, 1, 25),
(6, 12, 6, 2, 18),
(7, 13, 7, 1, 25),
(7, 14, 7, 2, 18),
(8, 15, 8, 1, 25),
(8, 16, 8, 2, 18),
(9, 17, 9, 1, 25),
(9, 18, 9, 2, 18),
(10, 19, 10, 1, 25),
(10, 20, 10, 2, 18),
(11, 1, 1, 1, 25),
(11, 2, 1, 2, 18),
(12, 3, 2, 1, 25),
(12, 4, 2, 2, 18),
(13, 5, 3, 1, 25),
(13, 6, 3, 2, 18),
(14, 7, 4, 1, 25),
(14, 8, 4, 2, 18),
(15, 9, 5, 1, 25),
(15, 10, 5, 2, 18),
(16, 11, 6, 1, 25),
(16, 12, 6, 2, 18),
(17, 13, 7, 1, 25),
(17, 14, 7, 2, 18),
(18, 15, 8, 1, 25),
(18, 16, 8, 2, 18),
(19, 17, 9, 1, 25),
(19, 18, 9, 2, 18),
(20, 19, 10, 1, 25),
(20, 20, 10, 2, 18);

select * from results;

-- Insert data into Fastest Laps
INSERT INTO fastest_laps (race_id, driver_id, time) VALUES
(1, 1, '1:27.097'),
(2, 3, '1:12.909'),
(3, 5, '1:21.046'),
(4, 7, '1:46.409'),
(5, 9, '1:18.456'),
(6, 11, '1:13.909'),
(7, 13, '1:30.983'),
(8, 15, '1:40.240'),
(9, 17, '1:11.098'),
(10, 19, '1:31.447'),
(11, 1, '1:28.097'),
(12, 3, '1:13.009'),
(13, 5, '1:22.046'),
(14, 7, '1:45.409'),
(15, 9, '1:19.456'),
(16, 11, '1:12.909'),
(17, 13, '1:31.983'),
(18, 15, '1:39.240'),
(19, 17, '1:10.098'),
(20, 19, '1:32.447');

select * from fastest_laps;


-- Insert data into Qualifying
INSERT INTO qualifying (race_id, driver_id, position) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(2, 4, 2),
(3, 5, 1),
(3, 6, 2),
(4, 7, 1),
(4, 8, 2),
(5, 9, 1),
(5, 10, 2),
(6, 11, 1),
(6, 12, 2),
(7, 13, 1),
(7, 14, 2),
(8, 15, 1),
(8, 16, 2),
(9, 17, 1),
(9, 18, 2),
(10, 19, 1),
(10, 20, 2),
(11, 1, 1),
(11, 2, 2),
(12, 3, 1),
(12, 4, 2),
(13, 5, 1),
(13, 6, 2),
(14, 7, 1),
(14, 8, 2),
(15, 9, 1),
(15, 10, 2),
(16, 11, 1),
(16, 12, 2),
(17, 13, 1),
(17, 14, 2),
(18, 15, 1),
(18, 16, 2),
(19, 17, 1),
(19, 18, 2),
(20, 19, 1),
(20, 20, 2);

select * from qualifying;

-- Insert data into Penalties
INSERT INTO penalties (driver_id, race_id, description, time_penalty) VALUES
(1, 1, 'Speeding in the pit lane', '5 seconds'),
(2, 1, 'Unsafe release from pit stop', '10 seconds'),
(3, 2, 'Causing a collision', '10 seconds'),
(4, 2, 'Track limits violation', '5 seconds'),
(5, 3, 'Blocking another driver', '5 seconds'),
(6, 3, 'Jump start', '10 seconds'),
(7, 4, 'Exceeding track limits', '5 seconds'),
(8, 4, 'Ignoring blue flags', '10 seconds'),
(9, 5, 'Causing a collision', '10 seconds'),
(10, 5, 'Pit lane speeding', '5 seconds'),
(11, 6, 'Causing a collision', '10 seconds'),
(12, 6, 'Track limits violation', '5 seconds'),
(13, 7, 'Speeding in the pit lane', '5 seconds'),
(14, 7, 'Causing a collision', '10 seconds'),
(15, 8, 'Unsafe release from pit stop', '10 seconds'),
(16, 8, 'Ignoring blue flags', '5 seconds'),
(17, 9, 'Causing a collision', '10 seconds'),
(18, 9, 'Track limits violation', '5 seconds'),
(19, 10, 'Exceeding track limits', '5 seconds'),
(20, 10, 'Unsafe release from pit stop', '10 seconds'),
(1, 11, 'Unsafe release from pit stop', '10 seconds'),
(2, 11, 'Causing a collision', '10 seconds'),
(3, 12, 'Track limits violation', '5 seconds'),
(4, 12, 'Blocking another driver', '5 seconds'),
(5, 13, 'Jump start', '10 seconds'),
(6, 13, 'Exceeding track limits', '5 seconds'),
(7, 14, 'Ignoring blue flags', '10 seconds'),
(8, 14, 'Causing a collision', '10 seconds'),
(9, 15, 'Pit lane speeding', '5 seconds'),
(10, 15, 'Causing a collision', '10 seconds'),
(11, 16, 'Track limits violation', '5 seconds'),
(12, 16, 'Blocking another driver', '5 seconds'),
(13, 17, 'Jump start', '10 seconds'),
(14, 17, 'Exceeding track limits', '5 seconds'),
(15, 18, 'Ignoring blue flags', '10 seconds'),
(16, 18, 'Causing a collision', '10 seconds'),
(17, 19, 'Pit lane speeding', '5 seconds'),
(18, 19, 'Causing a collision', '10 seconds'),
(19, 20, 'Track limits violation', '5 seconds'),
(20, 20, 'Blocking another driver', '5 seconds');

select * from penalties;

-- Insert data into Engineers
INSERT INTO engineers (name, country) VALUES
('James Allison', 'United Kingdom'),
('Adrian Newey', 'United Kingdom'),
('Mattia Binotto', 'Italy'),
('Andrew Green', 'United Kingdom'),
('Simone Resta', 'Italy'),
('Nikolas Tombazis', 'Greece'),
('Rory Byrne', 'South Africa'),
('Paddy Lowe', 'United Kingdom'),
('Aldo Costa', 'Italy'),
('Peter Prodromou', 'Cyprus'),
('Ross Brawn', 'United Kingdom'),
('Gordon Murray', 'South Africa'),
('Pat Symonds', 'United Kingdom'),
('Rob Smedley', 'United Kingdom'),
('James Key', 'United Kingdom'),
('Mario Illien', 'Switzerland'),
('Eric Boullier', 'France'),
('Neil Oatley', 'United Kingdom'),
('John Barnard', 'United Kingdom'),
('Frank Dernie', 'United Kingdom');

select * from engineers;

-- Insert data into Engineering Team
INSERT INTO engineering_team (team_id, engineer_id, season_id) VALUES
(1, 1, 4),
(2, 2, 4),
(3, 3, 4),
(4, 4, 4),
(5, 5, 4),
(6, 6, 4),
(7, 7, 4),
(8, 8, 4),
(9, 9, 4),
(10, 10, 4),
(1, 11, 3),
(2, 12, 3),
(3, 13, 3),
(4, 14, 3),
(5, 15, 3),
(6, 16, 3),
(7, 17, 3),
(8, 18, 3),
(9, 19, 3),
(10, 20, 3);

select * from engineering_team;

-- Insert data into Sponsors
INSERT INTO sponsors (name, country) VALUES
('Petronas', 'Malaysia'),
('Oracle', 'United States'),
('Shell', 'Netherlands'),
('Dell Technologies', 'United States'),
('Pirelli', 'Italy'),
('Emirates', 'UAE'),
('Rolex', 'Switzerland'),
('Heineken', 'Netherlands'),
('Honda', 'Japan'),
('PepsiCo', 'United States'),
('Coca-Cola', 'United States'),
('Santander', 'Spain'),
('Castrol', 'United Kingdom'),
('Microsoft', 'United States'),
('IBM', 'United States'),
('Red Bull', 'Austria'),
('Vodafone', 'United Kingdom'),
('Tata Communications', 'India'),
('DHL', 'Germany'),
('Monster Energy', 'United States');

select * from sponsors;

-- Insert data into Team Sponsors
INSERT INTO team_sponsors (team_id, sponsor_id, season_id) VALUES
(1, 1, 4),
(2, 2, 4),
(3, 3, 4),
(4, 4, 4),
(5, 5, 4),
(6, 6, 4),
(7, 7, 4),
(8, 8, 4),
(9, 9, 4),
(10, 10, 4),
(1, 11, 3),
(2, 12, 3),
(3, 13, 3),
(4, 14, 3),
(5, 15, 3),
(6, 16, 3),
(7, 17, 3),
(8, 18, 3),
(9, 19, 3),
(10, 20, 3);

select * from team_sponsors;

-- V I E W S
-- VIEW 1: Team and Driver Info
CREATE OR REPLACE VIEW team_drivers AS
SELECT 
	t.name AS team_name,
    t.country AS team_country,
    d.first_name AS drive_first_name,
    d.last_name AS driver_last_name,
    d.nationality AS driver_nationality,
    d.date_of_birth AS driver_date_of_birth
FROM
	teams t
JOIN
	drivers d ON t.team_id = d.team_id;

select * from team_drivers;


-- VIEW 2: Race Results with Driver and Team Information
CREATE OR REPLACE VIEW race_results AS
SELECT 
	r.name AS race_name,
    r.date AS race_date,
    r.location AS race_location,
    s.year AS season_year,
    d.first_name AS driver_first_name,
    d.last_name AS driver_last_name,
    t.name AS team_name,
    res.position,
    res.points
FROM 
	races r
JOIN
	results res ON r.race_id = res.race_id
JOIN 
	drivers d ON res.driver_id = d.driver_id
JOIN 
	teams t ON res.team_id = t.team_id
JOIN 
	seasons s ON r.season_id = s.season_id;

select * from race_results;


-- View 3: Teams and Their Engineers
CREATE OR REPLACE VIEW team_engineers AS
SELECT 
	t.name AS team_name,
    t.country AS team_country,
    e.name AS engineer_name,
    e.country AS engineer_country,
    s.year AS season_year
FROM
	teams t
JOIN
	engineering_team et ON t.team_id = et.team_id
JOIN 
	engineers e ON et.engineer_id = e.engineer_id
JOIN
	seasons s ON et.season_id = s.season_id;
    
select * from team_engineers;

-- View 4: Teams and Their Sponsors
CREATE OR REPLACE VIEW team_sponsorsView AS
SELECT 
    t.name AS team_name,
    t.country AS team_country,
    s.name AS sponsor_name,
    s.country AS sponsor_country,
    se.year AS season_year
FROM 
    teams t
JOIN 
    team_sponsors ts ON t.team_id = ts.team_id
JOIN 
    sponsors s ON ts.sponsor_id = s.sponsor_id
JOIN 
    seasons se ON ts.season_id = se.season_id;

SELECT * FROM team_sponsorsView;

-- F U N C T I O N S
-- Function 1 Calculate Points Per Race
USE formula1_db;
DROP FUNCTION IF EXISTS calculate_points_per_race;

DELIMITER $$
CREATE FUNCTION `calculate_points_per_race` (position INT) RETURNS INT 
DETERMINISTIC
BEGIN 
	DECLARE points INT;
    
     IF position = 1 THEN
        SET points = 25;
    ELSEIF position = 2 THEN
        SET points = 18;
    ELSEIF position = 3 THEN
        SET points = 15;
    ELSEIF position = 4 THEN
        SET points = 12;
    ELSEIF position = 5 THEN
        SET points = 10;
    ELSEIF position = 6 THEN
        SET points = 8;
    ELSEIF position = 7 THEN
        SET points = 6;
    ELSEIF position = 8 THEN
        SET points = 4;
    ELSEIF position = 9 THEN
        SET points = 2;
    ELSEIF position = 10 THEN
        SET points = 1;
    ELSE
        SET points = 0; -- No points for positions below 10th
    END IF;
    
    RETURN points;
END $$
DELIMITER ;

-- Query to get points for position 1
SELECT calculate_points_per_race(1) AS points_for_position_1;

-- Query to get points for position 5
SELECT calculate_points_per_race(5) AS points_for_position_5;

-- Query to get points for position 10
SELECT calculate_points_per_race(10) AS points_for_position_10;

-- Query to get points for position 15 (outside the top 10)
SELECT calculate_points_per_race(15) AS points_for_position_15;


-- Function 2: Determine Champion Status
USE formula1_db;
DROP FUNCTION IF EXISTS determine_champion_status;
DELIMITER $$
CREATE FUNCTION `determine_champion_status` (championship INT) RETURNS VARCHAR(20)
NO SQL
BEGIN 
	DECLARE status VARCHAR(20);
    
    IF championship > 0 THEN
		SET status = 'Champion';
	ELSE 
		SET status = 'Not a Champion';
	END IF;
    
    RETURN status;
	
END $$

SELECT determine_champion_status(0) AS champion_status;
SELECT determine_champion_status(1) AS champion_status;
SELECT determine_champion_status(7) AS champion_status;


-- S t o r e d - P r o c e d u r e s
-- Stored Procedure 1: Get Number of Races per Season
USE formula1_db;
DROP PROCEDURE IF EXISTS sp_get_races_per_season;
DELIMITER $$
CREATE PROCEDURE sp_get_races_per_season()
BEGIN
	SELECT seasons.year AS season_year, COUNT(races.race_id) AS number_of_races
    FROM seasons
    LEFT JOIN races ON seasons.season_id = races.season_id
    GROUP BY seasons.year;
END $$

call sp_get_races_per_season();


-- Stored Procedure 2: Get Race Results for a Driver
USE formula1_db;
DROP PROCEDURE IF EXISTS sp_get_driver_results;
DELIMITER $$
CREATE PROCEDURE sp_get_driver_results (IN driver_id INT)
BEGIN
	SELECT races.name AS race_name, races.date AS race_date, results.position AS race_position, results.points AS race_points
    FROM results
    INNER JOIN races ON results.race_id = races.race_id
    WHERE results.driver_id = driver_id
    ORDER BY races.date DESC;
END $$

-- Results per Driver id
call sp_get_driver_results(1);
call sp_get_driver_results(10);
call sp_get_driver_results(20);
