CREATE DATABASE trekking_booking_system;
USE trekking_booking_system;

CREATE TABLE roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    role_id INT NOT NULL DEFAULT 2,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    profile_image VARCHAR(255),
    is_approved TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

CREATE TABLE treks (
    trek_id INT PRIMARY KEY AUTO_INCREMENT,
    trek_name VARCHAR(100) NOT NULL,
    difficulty ENUM('Easy','Moderate','Hard','Extreme') NOT NULL,
    duration_days INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    max_group_size INT DEFAULT 20,
    region VARCHAR(100),
    start_location VARCHAR(100),
    end_location VARCHAR(100),
    distance_km DECIMAL(6,2),
    image_url VARCHAR(255),
    description TEXT,
    is_active TINYINT(1) DEFAULT 1
);

CREATE TABLE routes (
    route_id INT PRIMARY KEY AUTO_INCREMENT,
    trek_id INT NOT NULL,
    waypoint_order INT NOT NULL,
    waypoint_name VARCHAR(100),
    altitude_m INT,
    notes TEXT,
    UNIQUE (trek_id, waypoint_order),
    FOREIGN KEY (trek_id) REFERENCES treks(trek_id) ON DELETE CASCADE
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    trek_id INT NOT NULL,
    booking_date DATE NOT NULL,
    trek_start_date DATE,
    num_persons INT DEFAULT 1,
    special_requests TEXT,
    status ENUM('pending','confirmed','rejected','cancelled') DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (trek_id) REFERENCES treks(trek_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method ENUM('credit_card','debit_card','paypal','bank_transfer','cash'),
    payment_status ENUM('pending','paid','refunded','failed') DEFAULT 'pending',
    payment_date DATE,
    transaction_ref VARCHAR(100),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    trek_id INT NOT NULL,
    booking_id INT,
    rating TINYINT NOT NULL,
    comment TEXT,
    review_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (trek_id) REFERENCES treks(trek_id),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);