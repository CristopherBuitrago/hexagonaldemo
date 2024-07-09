DROP DATABASE IF EXISTS LigaBetPlay;
CREATE DATABASE LigaBetPlay;
USE LigaBetPlay;

-- Independent Tables

-- User Database
CREATE TABLE role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
); 



CREATE TABLE permission (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description MEDIUMTEXT NOT NULL
);



-- Communication Database
CREATE TABLE communication (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(45) NOT NULL,
    content MEDIUMTEXT NOT NULL,
    publicationDate DATE NOT NULL
);



-- Sponsor Database
CREATE TABLE sponsor_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    description MEDIUMTEXT NOT NULL
);



CREATE TABLE sponsor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type INT NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    FOREIGN KEY (type) REFERENCES sponsor_type (id)
);



-- Player Database
CREATE TABLE position (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    description MEDIUMTEXT NOT NULL
);




CREATE TABLE injury_severity (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    description MEDIUMTEXT NOT NULL
);




CREATE TABLE injury_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    description MEDIUMTEXT NOT NULL
);



CREATE TABLE injury(
    id INT AUTO_INCREMENT PRIMARY KEY,
    injuryType INT,
    injurySeverity INT,
    startDate DATE NOT NULL,
    finishDate DATE NOT NULL,
    FOREIGN KEY (injuryType) REFERENCES injury_type (id),
    FOREIGN KEY (injurySeverity) REFERENCES injury_severity (id)
);




CREATE TABLE player (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    age INT NOT NULL,
    nationality VARCHAR(45) NOT NULL,
    position INT,
    shirtNumber INT,
    FOREIGN KEY (position) REFERENCES `position`(id)
);




-- Game Database
CREATE TABLE stadium (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    country VARCHAR(45) NOT NULL,
    city VARCHAR(45) NOT NULL,
    capacity INT NOT NULL
);




CREATE TABLE card_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    color VARCHAR(45) NOT NULL,
    description MEDIUMTEXT NOT NULL
);




-- Team Database
CREATE TABLE trainer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    age INT NOT NULL
);




CREATE TABLE team (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    city VARCHAR(45) NOT NULL,
    country VARCHAR(45) NOT NULL,
    stadium INT,
    trainer INT,
    FOREIGN KEY (stadium) REFERENCES stadium(id),
    FOREIGN KEY (trainer) REFERENCES trainer(id)
);




-- game part II
CREATE TABLE game (
    id INT AUTO_INCREMENT PRIMARY KEY,
    localTeam INT,
    guestTeam INT,
    gameDate DATETIME NOT NULL,
    stadium INT,
    FOREIGN KEY (localTeam) REFERENCES team(id),
    FOREIGN KEY (guestTeam) REFERENCES team(id),
    FOREIGN KEY (stadium) REFERENCES stadium(id)
);




-- Dependent Tables

-- User Database
CREATE TABLE role_has_permission (
    role INT,
    permission INT,
    PRIMARY KEY (role, permission),
    FOREIGN KEY (role) REFERENCES role(id),
    FOREIGN KEY (permission) REFERENCES permission(id)
);




CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(45) NOT NULL,
    role INT,
    FOREIGN KEY (role) REFERENCES role(id)
);




-- Communication Database
CREATE TABLE role_has_communication (
    role INT,
    communication INT,
    PRIMARY KEY (role, communication),
    FOREIGN KEY (role) REFERENCES role(id),
    FOREIGN KEY (communication) REFERENCES communication(id)
);




-- Player Database
CREATE TABLE player_has_injury (
    player INT,
    injury INT,
    PRIMARY KEY (player, injury),
    FOREIGN KEY (player) REFERENCES player(id),
    FOREIGN KEY (injury) REFERENCES injury (id)
);




CREATE TABLE performance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player INT,
    game INT,
    playedMinutes INT NOT NULL,
    goals INT NOT NULL,
    assists INT NOT NULL,
    yellowCards INT NOT NULL,
    redCards INT NOT NULL,
    FOREIGN KEY (player) REFERENCES player(id),
    FOREIGN KEY (game) REFERENCES game(id)
);




-- Game Database
CREATE TABLE result (
    id INT AUTO_INCREMENT PRIMARY KEY,
    game INT,
    goalsLocalTeam INT NOT NULL,
    goalsGuestTeam INT NOT NULL,
    FOREIGN KEY (game) REFERENCES game(id)
);




CREATE TABLE goal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player INT,
    game INT,
    minute INT NOT NULL,
    FOREIGN KEY (player) REFERENCES player(id),
    FOREIGN KEY (game) REFERENCES game(id)
);




CREATE TABLE card (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player INT,
    game INT,
    type INT,
    minute INT NOT NULL,
    FOREIGN KEY (player) REFERENCES player(id),
    FOREIGN KEY (game) REFERENCES game(id),
    FOREIGN KEY (type) REFERENCES card_type(id)
);




CREATE TABLE incident (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description MEDIUMTEXT NOT NULL,
    minute INT NOT NULL
);




CREATE TABLE entrance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    game INT,
    buyer INT,
    buyDate DATE NOT NULL,
    amount INT NOT NULL,
    totalPrice DECIMAL(12, 2) NOT NULL,
    seatingLocation VARCHAR(45) NOT NULL,
    FOREIGN KEY (game) REFERENCES game(id),
    FOREIGN KEY (buyer) REFERENCES user(id)
);




-- Training Database
CREATE TABLE training (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team INT,
    trainingDate DATETIME NOT NULL,
    stadium INT,
    FOREIGN KEY (team) REFERENCES team(id),
    FOREIGN KEY (stadium) REFERENCES stadium(id)
);




CREATE TABLE activity (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(45) NOT NULL,
    description MEDIUMTEXT NOT NULL,
    duration TIME NOT NULL
);




CREATE TABLE training_has_activity (
    training INT,
    activity INT,
    PRIMARY KEY (training, activity),
    FOREIGN KEY (training) REFERENCES training(id),
    FOREIGN KEY (activity) REFERENCES activity(id)
);




-- Team Database
CREATE TABLE transfer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player INT,
    originTeam INT,
    targetTeam INT,
    amount DECIMAL(12, 2) NOT NULL,
    transferDate DATE NOT NULL,
    FOREIGN KEY (player) REFERENCES player(id),
    FOREIGN KEY (originTeam) REFERENCES team(id),
    FOREIGN KEY (targetTeam) REFERENCES team(id)
);




CREATE TABLE team_has_player (
    team INT,
    player INT,
    PRIMARY KEY (team, player),
    FOREIGN KEY (team) REFERENCES team(id),
    FOREIGN KEY (player) REFERENCES player(id)
);




CREATE TABLE team_has_game (
    team INT,
    game INT,
    PRIMARY KEY (team, game),
    FOREIGN KEY (team) REFERENCES team(id),
    FOREIGN KEY (game) REFERENCES game(id)
);