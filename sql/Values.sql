USE trekking_booking_system;

INSERT INTO roles (role_name) VALUES
('admin'),
('customer');

INSERT INTO users (role_id, name, email, password_hash, phone, is_approved) VALUES
(1, 'Admin User', 'admin@trekhub.com', 'hashed_admin_password', '9800000001', 1),
(2, 'Ram Sharma', 'ram@example.com', 'hashed_ram_password', '9800000002', 1),
(2, 'Sita Rai', 'sita@example.com', 'hashed_sita_password', '9811111111', 1),
(2, 'Hari Thapa', 'hari@example.com', 'hashed_hari_password', '9822222222', 0);

INSERT INTO treks
(trek_name, difficulty, duration_days, price, max_group_size, region, start_location, end_location, distance_km, image_url, description, is_active)
VALUES
('Everest Base Camp', 'Hard', 14, 1200.00, 15, 'Everest', 'Lukla', 'Everest Base Camp', 130.50, '/images/ebc.jpg', 'World famous Everest trek.', 1),
('Annapurna Circuit', 'Moderate', 12, 900.00, 20, 'Annapurna', 'Besisahar', 'Nayapul', 160.00, '/images/annapurna.jpg', 'Classic Annapurna circuit trek.', 1),
('Langtang Valley', 'Moderate', 7, 650.00, 18, 'Langtang', 'Syabrubesi', 'Kyanjin Gompa', 65.00, '/images/langtang.jpg', 'Beautiful Langtang valley trek.', 1),
('Ghorepani Poon Hill', 'Easy', 5, 400.00, 25, 'Annapurna', 'Nayapul', 'Birethanti', 43.00, '/images/poonhill.jpg', 'Best beginner trek.', 1);

INSERT INTO routes (trek_id, waypoint_order, waypoint_name, altitude_m, notes) VALUES
(1,1,'Lukla',2860,'Starting point'),
(1,2,'Namche Bazaar',3440,'Acclimatization stop'),
(1,3,'Tengboche',3867,'Monastery'),
(1,4,'Everest Base Camp',5364,'Destination'),
(2,1,'Besisahar',760,'Starting point'),
(2,2,'Manang',3519,'Rest day'),
(2,3,'Thorong La Pass',5416,'Highest point'),
(3,1,'Syabrubesi',1550,'Trailhead'),
(3,2,'Langtang Village',3430,'Village stay'),
(3,3,'Kyanjin Gompa',3870,'Final destination'),
(4,1,'Nayapul',1070,'Starting point'),
(4,2,'Ghorepani',2860,'Overnight stay'),
(4,3,'Poon Hill',3210,'Sunrise viewpoint');

INSERT INTO bookings
(user_id, trek_id, booking_date, trek_start_date, num_persons, special_requests, status)
VALUES
(2,1,'2026-04-20','2026-05-01',2,'Vegetarian meals preferred','confirmed'),
(3,2,'2026-05-10','2026-06-15',1,NULL,'pending'),
(2,3,'2026-05-01','2026-05-20',3,'Need porter for heavy bags','confirmed'),
(4,4,'2026-05-02','2026-05-25',1,NULL,'pending');

INSERT INTO payments
(booking_id, amount, payment_method, payment_status, payment_date, transaction_ref)
VALUES
(1,2400.00,'credit_card','paid','2026-04-20','TXN-001'),
(2,900.00,'paypal','pending','2026-05-10','TXN-002'),
(3,1950.00,'bank_transfer','paid','2026-05-01','TXN-003'),
(4,400.00,'credit_card','pending','2026-05-02','TXN-004');

INSERT INTO reviews
(user_id, trek_id, booking_id, rating, comment, review_date)
VALUES
(2,1,1,5,'Amazing Everest Base Camp experience!','2026-05-16'),
(2,3,3,4,'Beautiful Langtang trek with fewer crowds.','2026-06-04');