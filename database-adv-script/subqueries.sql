-- 1. Non-correlated subquery: Find all properties where the average rating is greater than 4.0
SELECT p.property_id, p.name, p.location, avg_rating.average_rating
FROM property p
JOIN (
    SELECT property_id, AVG(rating) as average_rating
    FROM review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
) avg_rating ON p.property_id = avg_rating.property_id;

-- 2. Correlated subquery: Find users who have made more than 3 bookings
SELECT u.user_id, u.first_name, u.last_name, u.email
FROM "user" u
WHERE 3 < (
    SELECT COUNT(*)
    FROM booking b
    WHERE b.user_id = u.user_id
);

