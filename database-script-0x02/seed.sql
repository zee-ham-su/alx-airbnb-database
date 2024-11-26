-- Sample Data for User table

-- Users (Hosts and Guests) with Ghanaian names and phone numbers
INSERT INTO "user" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    (uuid_generate_v4(), 'Kwame', 'Mensah', 'kwame.mensah@example.com', 'hashed_password_1', '+233246789012', 'host', CURRENT_TIMESTAMP),
    (uuid_generate_v4(), 'Ama', 'Bediako', 'ama.bediako@example.com', 'hashed_password_2', '+233245678903', 'guest', CURRENT_TIMESTAMP),
    (uuid_generate_v4(), 'Kojo', 'Adu', 'kojo.adu@example.com', 'hashed_password_3', '+233233456789', 'guest', CURRENT_TIMESTAMP),
    (uuid_generate_v4(), 'Yaa', 'Asante', 'yaa.asante@example.com', 'hashed_password_4', '+233224567890', 'host', CURRENT_TIMESTAMP);

-- Sample Data for Property table

-- Properties listed by hosts, using locations in Ghana
INSERT INTO property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
    (uuid_generate_v4(), (SELECT user_id FROM "user" WHERE email = 'kwame.mensah@example.com'), 'Accra City Apartment', 'A 2-bedroom apartment located in the heart of Accra.', 'Accra', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (uuid_generate_v4(), (SELECT user_id FROM "user" WHERE email = 'yaa.asante@example.com'), 'Kumasi Luxury Villa', 'A 5-bedroom luxury villa with a garden and pool.', 'Kumasi', 450.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (uuid_generate_v4(), (SELECT user_id FROM "user" WHERE email = 'kwame.mensah@example.com'), 'Takoradi Beach House', 'A beach house located on the Takoradi coastline with beautiful ocean views.', 'Takoradi', 350.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Sample Data for Booking table

-- Bookings made by guests, using Ghanaian cities and dates
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    (uuid_generate_v4(), (SELECT property_id FROM property WHERE name = 'Accra City Apartment'), (SELECT user_id FROM "user" WHERE email = 'ama.bediako@example.com'), '2024-12-01', '2024-12-10', 2500.00, 'confirmed', CURRENT_TIMESTAMP),
    (uuid_generate_v4(), (SELECT property_id FROM property WHERE name = 'Kumasi Luxury Villa'), (SELECT user_id FROM "user" WHERE email = 'kojo.adu@example.com'), '2024-12-05', '2024-12-12', 2700.00, 'confirmed', CURRENT_TIMESTAMP);

-- Sample Data for Payment table

-- Payments for bookings, using Ghanaian Cedi (GHS)
INSERT INTO payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    (uuid_generate_v4(), (SELECT booking_id FROM booking WHERE property_id = (SELECT property_id FROM property WHERE name = 'Accra City Apartment')), 2500.00, CURRENT_TIMESTAMP, 'credit_card'),
    (uuid_generate_v4(), (SELECT booking_id FROM booking WHERE property_id = (SELECT property_id FROM property WHERE name = 'Kumasi Luxury Villa')), 2700.00, CURRENT_TIMESTAMP, 'paypal');

-- Sample Data for Review table

-- Reviews for properties, with realistic review comments
INSERT INTO review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    (uuid_generate_v4(), (SELECT property_id FROM property WHERE name = 'Accra City Apartment'), (SELECT user_id FROM "user" WHERE email = 'kojo.adu@example.com'), 5, 'The apartment was perfect! Great location and amenities.', CURRENT_TIMESTAMP),
    (uuid_generate_v4(), (SELECT property_id FROM property WHERE name = 'Kumasi Luxury Villa'), (SELECT user_id FROM "user" WHERE email = 'ama.bediako@example.com'), 4, 'The villa was luxurious, but the pool could use some maintenance.', CURRENT_TIMESTAMP);

-- Sample Data for Message table

-- Messages exchanged between users
INSERT INTO message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    (uuid_generate_v4(), (SELECT user_id FROM "user" WHERE email = 'kwame.mensah@example.com'), (SELECT user_id FROM "user" WHERE email = 'ama.bediako@example.com'), 'Hello Ama, welcome to Accra City Apartment! Enjoy your stay.', CURRENT_TIMESTAMP),
    (uuid_generate_v4(), (SELECT user_id FROM "user" WHERE email = 'yaa.asante@example.com'), (SELECT user_id FROM "user" WHERE email = 'kojo.adu@example.com'), 'Hey Kojo, hope you enjoy your stay at Kumasi Luxury Villa!', CURRENT_TIMESTAMP);
