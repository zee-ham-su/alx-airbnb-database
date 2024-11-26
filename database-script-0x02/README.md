# Database Seed Script for AirBnB Clone

## Overview

This script populates the AirBnB clone database with sample data for the `user`, `property`, `booking`, `payment`, `review`, and `message` tables. This data is intended to demonstrate real-world usage of the application, including multiple users, bookings, payments, reviews, and messaging.

## Setup Instructions

### Step 1: Set Up the Database

Follow the instructions in the [Setup Instructions](#setup-instructions) section to set up your database and create the necessary tables.

### Step 2: Seed the Database

1. **Open your PostgreSQL client** (e.g., `psql` or pgAdmin).
2. **Run the `seed.sql` script** to populate the database with sample data:

   ```bash
   psql -d airbnb_clone_db -f seed.sql
