DROP DATABASE IF EXISTS formula1_db;

CREATE DATABASE formula1_db;

show databases;

USE formula1_db;

-- TABLE 1
DROP TABLE IF EXISTS teams;
CREATE TABLE teams(
	team_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- TABLE 2
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

-- TABLE 3
DROP TABLE IF EXISTS seasons;
CREATE TABLE seasons(
	season_id INT PRIMARY KEY AUTO_INCREMENT,
	year INT NOT NULL
);

-- TABLE 4
DROP TABLE IF EXISTS circuits;
CREATE TABLE circuits(
	circuit_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    length DECIMAL(5, 2) NOT NULL
);

-- TABLE 5
DROP TABLE IF EXISTS races;
CREATE TABLE races(
	race_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    location VARCHAR(100) NOT NULL,
    season_id INT,
    FOREIGN KEY (season_id) REFERENCES seasons(season_id)
);

-- TABLE 6
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



