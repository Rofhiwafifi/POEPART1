RaceDay Management System

Project Overview

RaceDay Management System is a system for managing running events, organisers, participants, enrolments and race results.

The project uses ASP.NET Core Web API, C#, SQL Server and Swagger.

Project Objectives

- Allow users to register and log in.
- Allow organisers to create and manage events.
- Allow participants to view and enrol in events.
- Manage race categories.
- Store participant enrolments and results.
- Provide API endpoints for interacting with the system.

Database

Database name: RaceManagementDB

The database contains 6 tables:

1. Users
2. Events
3. Categories
4. EventCategories
5. Enrolments
6. Results

The database includes primary keys, foreign keys, constraints and relationships between the tables.

API
The planned API includes:
- Authentication – Register and Login
- User Profile – View and Update Profile
- Events – Create, View, Update and Delete Events
- Categories – Manage Race Categories
- Enrolments – Register and manage event enrolments
- Results – Add, View and Update Results

Sample Data
The database includes:
- 2 Organisers
- 4 Participants
- 3 Events
- 5 Categories
- Sample Event Enrolments
- Sample Results

Project Files
The Docs folder contains:
- `RaceDay_ERD.pdf` – PDF version of the ERD
- `API ENDPOINT PLAN.pdf` – PDF version of the API plan
- `RaceDayDB.sql` – Database creation and sample data script

How to Run
1. Open `RaceManagementDB.sql` in SQL Server Management Studio.
2. Execute the script.
3. Refresh the Databases section.
4. The `RaceManagementDB` database will be created.
5. The API can be tested using Swagger once the ASP.NET Core Web API is running.

Part 1 Deliverables
Part 1 includes the ERD, API Endpoint Plan, SQL Server database script, sample data and project documentation.
