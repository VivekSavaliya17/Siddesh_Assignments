CREATE DATABASE feedback_db_final;
USE feedback_db_final;

CREATE TABLE feedback(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    comment VARCHAR(100)
);
