CREATE TABLE Developers (
    developer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100),
    website VARCHAR(150)
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    registration_date DATE
);

CREATE TABLE Games (
    game_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    release_date DATE,
    price DECIMAL(10,2),
    developer_id INT,
    FOREIGN KEY (developer_id) REFERENCES Developers(developer_id)
);

CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

CREATE TABLE Game_Genres (
    game_id INT,
    genre_id INT,
    PRIMARY KEY (game_id, genre_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE Libraries (
    library_id INT PRIMARY KEY,
    user_id INT,
    game_id INT,
    purchase_date DATE,
    playtime_hours INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    user_id INT,
    game_id INT,
    rating INT,
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);
CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY,
    user_id INT,
    game_id INT,
    quantity INT,
    purchase_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);

