# Entity-Relationship Diagram (ERD)

## Entities and Attributes

1. **User**
   - `userId`: Primary Key
   - `name`: String
   - `email`: String, Unique
   - `password`: String
   - `role`: Enum (Host, Guest)
   - `createdAt`: Timestamp

2. **Property**
   - `propertyId`: Primary Key
   - `title`: String
   - `description`: Text
   - `price`: Decimal
   - `location`: String
   - `hostId`: Foreign Key (references User.userId)
   - `createdAt`: Timestamp

3. **Booking**
   - `bookingId`: Primary Key
   - `guestId`: Foreign Key (references User.userId)
   - `propertyId`: Foreign Key (references Property.propertyId)
   - `checkInDate`: Date
   - `checkOutDate`: Date
   - `status`: Enum (Confirmed, Canceled)
   - `createdAt`: Timestamp

4. **Payment**
   - `paymentId`: Primary Key
   - `bookingId`: Foreign Key (references Booking.bookingId)
   - `amount`: Decimal
   - `status`: Enum (Paid, Failed)
   - `paymentDate`: Timestamp

## Relationships

- A **User** (Host) can list multiple **Properties** (1..*).
- A **User** (Guest) can make multiple **Bookings** (1..*).
- A **Property** can have multiple **Bookings** (1..*).
- A **Booking** has one associated **Payment** (1..1).

## ER Diagram

- The ER Diagram is stored in the `ERD/` directory of this repository as a PNG file named `er-diagram.png`.

## Instructions

1. Open the `ERD/er-diagram.png` file to view the visual representation of the database schema.
2. Use the diagram to guide database design and implementation.
