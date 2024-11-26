-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    b.booking_id, 
    b.start_date, 
    b.end_date, 
    b.total_price, 
    b.status,
    u.user_id, 
    u.first_name, 
    u.last_name, 
    u.email
FROM 
    booking b
INNER JOIN 
    "user" u ON b.user_id = u.user_id;

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    p.property_id, 
    p.name AS property_name, 
    p.description, 
    p.location, 
    p.price_per_night,
    r.review_id, 
    r.rating, 
    r.comment
FROM 
    property p
LEFT JOIN 
    review r ON p.property_id = r.property_id;
ORDER BY
    p.property_id;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    u.email,
    b.booking_id, 
    b.start_date, 
    b.end_date, 
    b.total_price, 
    b.status
FROM 
    "user" u
FULL OUTER JOIN 
    booking b ON u.user_id = b.user_id;
