# ✈️ Airline Management System (SQL Database)

A robust relational database system designed to handle the end-to-end operations of an airline. This project maps out the complex relationships between passengers, airports, aircraft fleets, flight schedules, bookings, and payment transactions. 

## 🗄️ Database Schema & Entities
The system is built on **7 interconnected tables** with enforced primary and foreign key constraints to maintain strict data integrity:

*   **`Passenger`**: Stores demographics, contact info, address, and passport details.
*   **`Airport`**: Tracks airport locations, global codes (e.g., DEL, BOM), and flight traffic counts.
*   **`Aircraft`**: Manages fleet inventory, passenger capacity, and specific aircraft models.
*   **`Flights`**: Handles exact scheduling, source/destination routing, and dynamic class-based pricing (Economy vs. Business).
*   **`Booking`**: Links passengers to flights, assigns seat numbers, and tracks booking statuses.
*   **`Tickets`**: Generates exact boarding passes, gate assignments, and departure times.
*   **`Payments`**: Logs transaction amounts, payment methods (UPI, Net Banking, Credit Card), and statuses.

## 🚀 How to Run the Project
1. Install MySQL and open your preferred SQL client (e.g., MySQL Workbench, DBeaver, or CLI).
2. Run the provided SQL script in your environment.
3. The script will automatically:
   * Create the `airline_management_system` database.
   * Build all necessary tables with accurate datatypes and relationships.
   * Seed the database with realistic sample data across all tables.
4. Execute the included `SELECT` queries to extract business logic and insights.

## 📊 Key Business Insights (Included Queries)
The repository contains 30 pre-written SQL queries demonstrating complex data retrieval and analytics, including:
*   **Revenue Analytics:** Calculating total revenue generated per flight, total system-wide payments, and identifying the highest-revenue flights.
*   **Operational Tracking:** Tracking total departures from specific airports and analyzing flight counts by airline code.
*   **Passenger Behavior:** Identifying high-frequency flyers (multiple bookings) and analyzing seat class preferences.
*   **Dynamic Filtering:** Finding specific routes (e.g., Delhi to Mumbai), tracking delayed flights, and filtering flights based on average economy pricing.
*   **Advanced Joins & Aggregations:** Multi-table joins displaying fully detailed itineraries that link passenger details directly to ticket numbers, gates, and payment amounts.

## 🛠️ Tech Stack
*   **Database:** MySQL
*   **Concepts Demonstrated:** DDL (Data Definition), DML (Data Manipulation), Relational Mapping (PK/FK), Multi-table `JOIN`s, Nested Subqueries, Aggregate Functions, and `GROUP BY` / `HAVING` clauses.
