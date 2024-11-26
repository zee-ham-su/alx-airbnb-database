# Entity-Relationship Diagram (ERD)

## Entities and Attributes

1. **User**
   - `user_id`: Primary Key, UUID
   - `first_name`: String, NOT NULL
   - `last_name`: String, NOT NULL
   - `email`: String, Unique, NOT NULL
   - `password_hash`: String, NOT NULL
   - `phone_number`: String, Optional
   - `role`: Enum (guest, host, admin), NOT NULL
   - `created_at`: Timestamp, DEFAULT CURRENT_TIMESTAMP

2. **Property**
   - `property_id`: Primary Key, UUID
   - `host_id`: Foreign Key (references User.user_id), NOT NULL
   - `name`: String, NOT NULL
   - `description`: Text, NOT NULL
   - `location`: String, NOT NULL
   - `pricepernight`: Decimal, NOT NULL
   - `created_at`: Timestamp, DEFAULT CURRENT_TIMESTAMP
   - `updated_at`: Timestamp, ON UPDATE CURRENT_TIMESTAMP

3. **Booking**
   - `booking_id`: Primary Key, UUID
   - `property_id`: Foreign Key (references Property.property_id), NOT NULL
   - `user_id`: Foreign Key (references User.user_id), NOT NULL
   - `start_date`: Date, NOT NULL
   - `end_date`: Date, NOT NULL
   - `total_price`: Decimal, NOT NULL
   - `status`: Enum (pending, confirmed, canceled), NOT NULL
   - `created_at`: Timestamp, DEFAULT CURRENT_TIMESTAMP

4. **Payment**
   - `payment_id`: Primary Key, UUID
   - `booking_id`: Foreign Key (references Booking.booking_id), NOT NULL
   - `amount`: Decimal, NOT NULL
   - `payment_date`: Timestamp, DEFAULT CURRENT_TIMESTAMP
   - `payment_method`: Enum (credit_card, paypal, stripe), NOT NULL

5. **Review**
   - `review_id`: Primary Key, UUID
   - `property_id`: Foreign Key (references Property.property_id), NOT NULL
   - `user_id`: Foreign Key (references User.user_id), NOT NULL
   - `rating`: Integer (1-5), NOT NULL
   - `comment`: Text, NOT NULL
   - `created_at`: Timestamp, DEFAULT CURRENT_TIMESTAMP

6. **Message**
   - `message_id`: Primary Key, UUID
   - `sender_id`: Foreign Key (references User.user_id), NOT NULL
   - `recipient_id`: Foreign Key (references User.user_id), NOT NULL
   - `message_body`: Text, NOT NULL
   - `sent_at`: Timestamp, DEFAULT CURRENT_TIMESTAMP

## Relationships

- A **User** (Host) can list multiple **Properties** (1..*).
- A **User** (Guest) can make multiple **Bookings** (1..*).
- A **Property** can have multiple **Bookings** (1..*).
- A **Booking** has one associated **Payment** (1..1).
- A **Property** can have multiple **Reviews** (1..*).
- A **User** can send and receive multiple **Messages** (1..*).

## ER Diagram

- The ER Diagram is stored in the `ERD/` directory of this repository as a PNG file named `er-diagram.png`.

## Instructions

1. Open the `ERD/er-diagram.png` file to view the visual representation of the database schema.
2. Use the diagram to guide database design and implementation.
