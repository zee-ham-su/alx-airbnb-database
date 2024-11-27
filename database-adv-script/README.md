# SQL Joins Queries - AirBnB Clone Database

## Overview

This repository contains SQL queries that demonstrate the use of different types of joins (INNER JOIN, LEFT JOIN, and FULL OUTER JOIN) to retrieve data from the AirBnB Clone database.

## Queries

### 1. INNER JOIN Query

This query retrieves all bookings and the respective users who made those bookings.

### 2. LEFT JOIN Query

This query retrieves all properties and their reviews, including properties that have no reviews.

### 3. FULL OUTER JOIN Query

This query  retrieves all users and all bookings, even if the user has no booking or a booking is not linked to a user.

## Advanced Queries with Subqueries

A set of advanced queries using both correlated and non-correlated subqueries. These queries demonstrate how to retrieve complex data sets from the AirBnB clone database.

### Query Descriptions

1. **Non-correlated Subquery**: Find all properties where the average rating is greater than 4.0
   - This query uses a subquery in the FROM clause (also known as a derived table).
   - It first calculates the average rating for each property in the subquery.
   - Then it joins this result with the property table to get property details.
   - Only properties with an average rating greater than 4.0 are included in the result.

2. **Correlated Subquery**: Find users who have made more than 3 bookings
   - This query uses a correlated subquery in the WHERE clause.
   - For each user in the outer query, the subquery counts the number of bookings made by that user.
   - Only users with more than 3 bookings are included in the result.

### Queries with Aggregations and Window Functions

a set of advanced queries using SQL aggregations and window functions. These queries demonstrate how to perform complex data analysis on our AirBnB clone database.

## Descriptions

1. **Aggregation Query**: Total number of bookings made by each user
   - This query uses the COUNT function and GROUP BY clause.
   - It joins the "user" and booking tables to count bookings for each user.
   - Results are ordered by the total number of bookings in descending order.
   - Users with no bookings will still appear in the results with a count of 0.

2. **Window Function Query**: Rank properties based on the total number of bookings
   - This query uses both aggregation (COUNT and GROUP BY) and window functions (ROW_NUMBER and RANK).
   - It counts the total bookings for each property.
   - ROW_NUMBER() assigns a unique rank to each property.
   - RANK() allows for ties, so properties with the same number of bookings get the same rank.
   - Results are ordered by the total number of bookings in descending order.
  