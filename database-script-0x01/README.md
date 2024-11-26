# AirBnB Clone Database Schema

## Overview

This repository contains the database schema for the AirBnb Clone application. This project implements a PostgreSQL database schema for an AirBnB clone application. The schema is designed to support core functionalities such as user management, property listings, bookings, payments, reviews, and messaging.

## Table Definitions

It defines the tables, custom ENUM types, relationships, triggers, and indexes needed for efficient data management.

## Database Schema Overview

The schema includes the following key components:

1. **User Table**: Stores information about users, including their name, contact details, role, and account creation time.
2. **Property Table**: Stores property details, including the host (user), property name, description, location, price, and timestamps.
3. **Booking Table**: Stores information about bookings made by users for properties, including booking dates, total price, and booking status.
4. **Payment Table**: Stores payment details for bookings, including the amount, payment method, and payment date.
5. **Review Table**: Stores user reviews for properties, including the rating and comment.
6. **Message Table**: Stores messages exchanged between users (e.g., host and guest).

## Entity Relationship Diagram

The Entity Relationship Diagram (ERD) for this schema can be found in the `ERD/` directory of this repository as `er-diagram.png`.

### Setup Instructions

#### Prerequisites

- PostgreSQL 12 or higher
- psql command-line tool or any PostgreSQL client (e.g., pgAdmin)

#### Steps to Create the Database

1. Ensure PostgreSQL is installed and running on your system.

2. Create a new database for the project:

    ```bash
    createdb airbnb_clone_db
    ```

3. Connect to the database:

    ```bash
    psql -d airbnb_clone_db
    ```

4. Run the SQL schema script to create the tables and relationships. Copy and paste the SQL commands from the `create_tables.sql` file into the `psql` terminal or execute them directly using your PostgreSQL client.

    Example SQL commands:

    ```sql
    -- Enable UUID extension
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

    -- Create custom ENUM types
    CREATE TYPE user_role AS ENUM ('guest', 'host', 'admin');
    CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'canceled');
    CREATE TYPE payment_method AS ENUM ('credit_card', 'paypal', 'stripe');

    -- Create User table
    CREATE TABLE "user" (
        user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        email VARCHAR(100) UNIQUE NOT NULL,
        password_hash VARCHAR(255) NOT NULL,
        phone_number VARCHAR(20),
        role user_role NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    -- Create Property table
    CREATE TABLE property (
        property_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
        host_id UUID NOT NULL,
        name VARCHAR(100) NOT NULL,
        description TEXT NOT NULL,
        location VARCHAR(255) NOT NULL,
        price_per_night DECIMAL(10, 2) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (host_id) REFERENCES "user"(user_id)
    );

    -- Create Booking table
    CREATE TABLE booking (
        booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
        property_id UUID NOT NULL,
        user_id UUID NOT NULL,
        start_date DATE NOT NULL,
        end_date DATE NOT NULL,
        total_price DECIMAL(10, 2) NOT NULL,
        status booking_status NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (property_id) REFERENCES property(property_id),
        FOREIGN KEY (user_id) REFERENCES "user"(user_id)
    );

    -- Create Payment table
    CREATE TABLE payment (
        payment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
        booking_id UUID NOT NULL,
        amount DECIMAL(10, 2) NOT NULL,
        payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        payment_method payment_method NOT NULL,
        FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
    );

    -- Create Review table
    CREATE TABLE review (
        review_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
        property_id UUID NOT NULL,
        user_id UUID NOT NULL,
        rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
        comment TEXT NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (property_id) REFERENCES property(property_id),
        FOREIGN KEY (user_id) REFERENCES "user"(user_id)
    );

    -- Create Message table
    CREATE TABLE message (
        message_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
        sender_id UUID NOT NULL,
        recipient_id UUID NOT NULL,
        message_body TEXT NOT NULL,
        sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (sender_id) REFERENCES "user"(user_id),
        FOREIGN KEY (recipient_id) REFERENCES "user"(user_id)
    );
    ```

5. After the tables are created, run the following commands to create indexes for improved performance:

    ```sql
    -- Create indexes
    CREATE INDEX idx_user_email ON "user"(email);
    CREATE INDEX idx_property_host_id ON property(host_id);
    CREATE INDEX idx_booking_property_id ON booking(property_id);
    CREATE INDEX idx_booking_user_id ON booking(user_id);
    CREATE INDEX idx_booking_dates ON booking(start_date, end_date);
    CREATE INDEX idx_payment_booking_id ON payment(booking_id);
    CREATE INDEX idx_review_property_id ON review(property_id);
    CREATE INDEX idx_review_user_id ON review(user_id);
    CREATE INDEX idx_message_sender_id ON message(sender_id);
    CREATE INDEX idx_message_recipient_id ON message(recipient_id);
    ```

### Step 6: Verify the Database Schema

After running the SQL commands, verify the schema by checking the tables and relationships. You can use PostgreSQL's `\dt` to list the tables, or use a tool like pgAdmin to inspect the database structure.

```bash
-- List all tables in the current database
\dt
