-- 1. Total number of bookings made by each user
SELECT u.user_id, u.first_name, u.last_name, COUNT(b.booking_id) as total_bookings
FROM "user" u
LEFT JOIN booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;

-- 2. Rank properties based on the total number of bookings they have received
SELECT 
    p.property_id, 
    p.name, 
    p.location, 
    COUNT(b.booking_id) as total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) as booking_rank,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) as booking_rank_with_ties
FROM 
    property p
LEFT JOIN 
    booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name, p.location
ORDER BY 
    total_bookings DESC;

