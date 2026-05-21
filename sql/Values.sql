USE trekking_booking_system;

INSERT INTO roles (role_name) VALUES
('admin'),
('customer');

INSERT INTO users (role_id, name, email, password_hash, phone, is_approved) VALUES
(1, 'Admin User', 'admin@trekhub.com', 'JAvlGPq9JyTdtvBO6x2llnRI1+gxwIyPqCKAn3THIKk=', '9800000001', 1),
(2, 'Ram Sharma', 'ram@example.com', 'hashed_ram_password', '9800000002', 1),
(2, 'Sita Rai', 'sita@example.com', 'hashed_sita_password', '9811111111', 1),
(2, 'Hari Thapa', 'hari@example.com', 'hashed_hari_password', '9822222222', 1);

INSERT INTO treks (trek_id, trek_name, difficulty, duration_days, price, max_group_size, region, start_location, end_location, distance_km, image_url, description, is_active) VALUES
(1, 'Everest Base Camp Trek', 'Hard', 14, 1290.00, 15, 'Everest', 'Lukla', 'Everest Base Camp', 130.50, '/image/Everest Base Camp Trek 14 Days Banner.png', 'World famous Everest Base Camp trek with stunning mountain views.', 1),
(2, 'Annapurna Base Camp Trek', 'Moderate', 14, 650.00, 20, 'Annapurna', 'Nayapul', 'Annapurna Base Camp', 70.00, '/image/Annapurna-Dhaulagiri.png', 'Beautiful trek to the base camp of Annapurna with mountain views.', 1),
(3, 'Langtang Valley Trek', 'Moderate', 10, 560.00, 18, 'Langtang', 'Syabrubesi', 'Kyanjin Gompa', 65.00, '/image/Langtang Valley Trek Banner.png', 'Beautiful Langtang valley trek with glacier views.', 1),
(4, 'Mera Peak Climbing', 'Hard', 14, 1800.00, 10, 'Everest', 'Lukla', 'Mera Peak', 120.00, '/image/mera%20peak.png', 'Highest trekking peak in Nepal at 6,476m.', 1),
(5, 'Island Peak Climbing', 'Hard', 18, 1600.00, 10, 'Everest', 'Lukla', 'Island Peak', 130.00, '/image/island%20peak.png', 'Popular climbing peak at 6,189m with spectacular views.', 1),
(6, 'Three Highest Passes Trek', 'Extreme', 19, 1680.00, 12, 'Everest', 'Salleri', 'Lukla', 180.00, '/image/Three Highest Passes Trek Banner.png', 'Ultimate challenge crossing three high passes in Everest region.', 1),
(7, 'Sleep at Base Camp Trek', 'Hard', 15, 1450.00, 12, 'Everest', 'Lukla', 'Everest Base Camp', 140.00, '/image/Sleep at Base Camp on Everest Trek Banner.png', 'Unique experience camping overnight at Everest Base Camp.', 1),
(8, 'Ghorepani Poon Hill Trek', 'Easy', 8, 280.00, 25, 'Annapurna', 'Nayapul', 'Ghandruk', 43.00, '/image/Ghorepani Poon Hill Trek Banner.png', 'Best beginner trek with sunrise views from Poon Hill.', 1),
(9, 'Annapurna Circuit with Poon Hill', 'Hard', 16, 890.00, 20, 'Annapurna', 'Besisahar', 'Nayapul', 160.00, '/image/Annapurna Circuit.png', 'Classic Annapurna Circuit with Poon Hill sunrise view.', 1),
(10, 'Ama Yangri Trek', 'Moderate', 3, 210.00, 15, 'Langtang', 'Tarkeghyang', 'Ama Yangri', 25.00, '/image/ama-yangri-trekking.png', 'Short spiritual trek to the sacred peak of Ama Yangri.', 1),
(11, 'Gosaikunda Lake Trek', 'Moderate', 7, 420.00, 18, 'Langtang', 'Dhunche', 'Gosaikunda', 45.00, '/image/Gosaikunda Lake Trek Banner.png', 'Sacred alpine lake trek with religious significance.', 1),
(12, 'Langtang Ganja La Pass Trek', 'Hard', 14, 1150.00, 10, 'Langtang', 'Syabrubesi', 'Melamchi', 110.00, '/image/Langtang Ganja La Pass Trek Banner.png', 'Challenging high pass trek for experienced hikers.', 1)
ON DUPLICATE KEY UPDATE 
    trek_name = VALUES(trek_name),
    difficulty = VALUES(difficulty),
    duration_days = VALUES(duration_days),
    price = VALUES(price),
    max_group_size = VALUES(max_group_size),
    region = VALUES(region),
    image_url = VALUES(image_url),
    description = VALUES(description);

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