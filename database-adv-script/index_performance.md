# Index Optimization and Performance Analysis

## Objective

This document explains the purpose of the indexes created for the `User`, `Booking`, and `Property` tables in the AirBnB Clone database. It also outlines how the indexes improve query performance and includes performance measurements (using `EXPLAIN` or `ANALYZE`) before and after applying the indexes.

---

## Indexes Created

### 1. User

- **`idx_user_email`**:
  - **Column**: `email`
  - **Purpose**: Optimizes lookups for users by email, often used in `WHERE` clauses during login or user retrieval.
  
- **`idx_user_role`**:
  - **Column**: `role`
  - **Purpose**: Speeds up filtering queries based on user roles (e.g., `host`, `guest`, `admin`).

### 2. Property Table

- **`idx_property_host_id`**:
  - **Column**: `host_id`
  - **Purpose**: Improves joins between `Property` and `User` tables to retrieve properties by host.
  
- **`idx_property_location`**:
  - **Column**: `location`
  - **Purpose**: Speeds up location-based filtering queries.
  
- **`idx_property_price`**:
  - **Column**: `price_per_night`
  - **Purpose**: Optimizes sorting and filtering queries based on property prices.

### 3. Booking Table

- **`idx_booking_user_id`**:
  - **Column**: `user_id`
  - **Purpose**: Optimizes joins between `Booking` and `User` tables to retrieve bookings by user.

- **`idx_booking_property_id`**:
  - **Column**: `property_id`
  - **Purpose**: Speeds up joins between `Booking` and `Property` tables to retrieve bookings by property.

- **`idx_booking_dates`**:
  - **Columns**: `start_date`, `end_date`
  - **Purpose**: Improves date range queries, such as filtering bookings within a specific date range.
  
- **`idx_booking_status`**:
  - **Column**: `status`
  - **Purpose**: Speeds up filtering queries based on booking status (e.g., `pending`, `confirmed`, `canceled`).
