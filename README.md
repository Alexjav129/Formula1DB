# Formula1 DB 🏎️ 🧩

# Project Description

## Managing Formula 1 with MySQL
- This relational database is designed to manage and store detailed information related to Formula 1, one of the most prestigious and followed motor racing competitions in the world. Using MySQL, a relational database management system, this project allows for efficient and structured organization and analysis of historical and current competition data.

## Objective 🎯
- The main objective of this database is to provide a solid and flexible structure to record and query information about Formula 1 seasons, including race details, teams, drivers, engineers, sponsors, and results. The database is designed to facilitate data analysis, statistics generation, and retrieval of relevant information for fans, journalists, and sports analysts.

## Key Components 🗂️
### 1. Seasons and Races:
- The database stores information about different Formula 1 seasons and the races held in each season, including specific race data such as date and location.

### 2. Teams and Drivers:
- Teams competing in Formula 1 are registered along with the drivers who are part of each team. The database allows tracking the career paths of drivers and their associations with different teams over time.

### 3. Engineering Teams and Sponsors:
- The database also includes information about the engineering teams behind the teams' cars and the sponsors supporting them. This information is crucial for understanding the dynamics and financing behind each team.

### 4. Results and Statistics:
- Race results are recorded, including final positions of drivers, points earned, fastest laps, and any penalties received. This enables detailed tracking of driver and team performance throughout the season.

# Technology Used 💻
- SQL (Structured Query Language): Language used to manage and manipulate the database, allowing for creation, updating, querying, and deletion of data.
- MySQL: Relational database management system (RDBMS) chosen to implement this project due to its scalability and widespread adoption in the industry.

<br>
- In summary, this relational database for Formula 1, implemented using MySQL, offers a solution for comprehensive management of information for one of the most complex and exciting sports competitions in the world. 🏁

<br>
<br>
<br>


# E-R Diagram 🧩


<details>
<summary>Tables and Relationships</summary>


### 1️⃣ Drivers:
- driver_id (PK)
- first_name
- last_name
- nationality
- date_of_birth
- team_id (FK)

**Relationships:**
- (1-n) with Teams
- (1-n) with Results
- (1-n) with Fastest_Laps
- (1-n) with Qualifying
- (1-n) with Penalties


### 2️⃣ Teams:
- team_id (PK)
- name
- country

**Relationships:**
- (1-n) with Drivers
- (1-n) with Results
- (1-n) with Fastest_Laps
- (1-n) with Qualifying
- (1-n) with Penalties
- (m-n) with Engineers through Engieering Teams
- (m-n) with Sponsors through Team_Sponsors

### 3️⃣ Seasons:

season_id (PK)
year
Relationships:
(1-n) with Races
(1-n) with Team_Constructors
(1-n) with Team_Sponsors
Circuits (Additional, not directly related in the simplified design):

circuit_id (PK)
name
country
length
Races:

race_id (PK)
name
date
location
season_id (FK)
Relationships:
(1-n) with Results
(1-n) with Fastest_Laps
(1-n) with Qualifying
(1-n) with Penalties
Results:

result_id (PK)
race_id (FK)
driver_id (FK)
team_id (FK)
position
points
Relationships:
(n-1) with Races
(n-1) with Drivers
(n-1) with Teams
Fastest_Laps:

fastest_lap_id (PK)
race_id (FK)
driver_id (FK)
time
Relationships:
(n-1) with Races
(n-1) with Drivers
Qualifying:

qualifying_id (PK)
race_id (FK)
driver_id (FK)
position
Relationships:
(n-1) with Races
(n-1) with Drivers
Penalties:

penalty_id (PK)
driver_id (FK)
race_id (FK)
description
time_penalty
Relationships:
(n-1) with Drivers
(n-1) with Races
Constructors:

constructor_id (PK)
name
country
Relationships:
(1-n) with Team_Constructors
Team_Constructors:

team_constructor_id (PK)
team_id (FK)
constructor_id (FK)
season_id (FK)
Relationships:
(n-1) with Constructors
(n-1) with Teams
(n-1) with Seasons
Sponsors:

sponsor_id (PK)
name
country
Relationships:
(1-n) with Team_Sponsors
Team_Sponsors:

team_sponsor_id (PK)
team_id (FK)
sponsor_id (FK)
season_id (FK)
Relationships:
(n-1) with Sponsors
(n-1) with Teams
(n-1) with Seasons


</details>

<br><br><br>

# Spanish Version 

<details>
<summary>Esp</summary>

# Formula1 DB 🏎️ 🧩

# Descripción del proyecto

## Gestión de la Fórmula 1 con MySQL
- Esta base de datos relacional está diseñada para gestionar y almacenar información detallada relacionada con la Fórmula 1, una de las competiciones automovilísticas más prestigiosas y seguidas en el mundo. Utilizando MySQL, un sistema de gestión de bases de datos relacional, este proyecto permite organizar y analizar datos históricos y actuales de la competición de manera eficiente y estructurada.

## Objetivo 🎯
- El objetivo principal de esta base de datos es proporcionar una estructura sólida y flexible para registrar y consultar información sobre las temporadas de Fórmula 1, incluyendo detalles de carreras, equipos, pilotos, constructores, patrocinadores y resultados. La base de datos está diseñada para facilitar el análisis de datos, la generación de estadísticas y la obtención de información relevante para aficionados, periodistas y analistas deportivos.

## Componentes Principales 🗂️
### 1. Temporadas y Carreras:
- La base de datos almacena información sobre las distintas temporadas de Fórmula 1 y las carreras que se llevan a cabo en cada temporada, incluyendo datos específicos de cada carrera como la fecha y la ubicación.

### 2. Equipos y Pilotos: 
- Se registran los equipos que compiten en la Fórmula 1, junto con los pilotos que forman parte de cada equipo. La base de datos permite seguir la trayectoria de los pilotos y sus asociaciones con diferentes equipos a lo largo del tiempo.

### 3. Equipo de Ingenieros y Patrocinadores: 
- La base de datos también incluye información sobre el equipo de Ingenieros de los autos de los equipos y los patrocinadores que los apoyan. Esta información es crucial para comprender las dinámicas y financiaciones detrás de cada equipo.

### 4. Resultados y Estadísticas: 
- Se registran los resultados de cada carrera, incluyendo las posiciones finales de los pilotos, los puntos obtenidos, las vueltas rápidas y cualquier penalización recibida. Esto permite realizar un seguimiento detallado del rendimiento de pilotos y equipos a lo largo de la temporada.


# Tecnología Utilizada 💻
- SQL (Structured Query Language): Lenguaje utilizado para gestionar y manipular la base de datos, permitiendo la creación, actualización, consulta y eliminación de datos.
- MySQL: Sistema de gestión de bases de datos relacional (RDBMS) elegido para implementar este proyecto debido a su escalabilidad y amplia adopción en el sector.

<br>
- En resumen, esta base de datos relacional sobre la Fórmula 1, implementada utilizando MySQL, ofrece una solución para la gestión integral de información de una de las competencias deportivas más complejas y emocionantes del mundo. 🏁

<br>
  
</details>
