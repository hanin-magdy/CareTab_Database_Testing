# CareTab Healthcare System - Database Testing Project

## Project Overview
A relational database schema designed for a healthcare platform to execute backend data validation, verify data integrity, and perform SQL testing.

## Database Schema
- 6 Relational Tables: Departments, Doctors, Patients, Appointments, Invoices, and Medical_Records.

## Key SQL Testing Scenarios
- Data Filtering: Extracting active patient records (WHERE).
- Table Joining: Linking patients, doctors, and appointments using LEFT JOIN.
- Data Integrity Checks: Identifying pending or partial payments in invoices.
- Aggregate Functions & Grouping: Calculating net revenue by payment method using SUM and GROUP BY.

## Files Included
- CareTab_Schema_And_Data.sql: Contains the database structure creation and seed data insertion.
- CareTab_Queries_And_Testing.sql: Contains all the validation, filtering, and joining queries.
