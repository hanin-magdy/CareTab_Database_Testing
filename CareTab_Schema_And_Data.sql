-- 1. إنشاء قاعدة البيانات
DROP DATABASE IF EXISTS CareTab_DB;
CREATE DATABASE CareTab_DB;
USE CareTab_DB;

-- 2. جدول الأقسام
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY AUTO_INCREMENT,
    Department_Name VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);

-- 3. جدول الأطباء
CREATE TABLE Doctors (
    Doctor_ID INT PRIMARY KEY AUTO_INCREMENT,
    Doctor_Name VARCHAR(100) NOT NULL,
    Specialty VARCHAR(50),
    Department_ID INT,
    Consultation_Fee DECIMAL(10,2),
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

-- 4. جدول المرضى
CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY AUTO_INCREMENT,
    Full_Name VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    Age INT,
    Phone VARCHAR(20),
    Insurance_Status VARCHAR(20) DEFAULT 'Inactive',
    Created_At DATE
);

-- 5. جدول الحجوزات
CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

-- 6. جدول الفواتير
CREATE TABLE Invoices (
    Invoice_ID INT PRIMARY KEY AUTO_INCREMENT,
    Appointment_ID INT,
    Total_Amount DECIMAL(10,2),
    Discount_Amount DECIMAL(10,2) DEFAULT 0.00,
    Payment_Status VARCHAR(20),
    Payment_Method VARCHAR(20),
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID)
);





INSERT INTO Departments (Department_Name, Location) VALUES
('Cardiology', 'Building A - Floor 2'),
('Pediatrics', 'Building B - Floor 1'),
('Dermatology', 'Building A - Floor 3');

INSERT INTO Doctors (Doctor_Name, Specialty, Department_ID, Consultation_Fee) VALUES
('Dr. Ahmed Hassan', 'Cardiology', 1, 500.00),
('Dr. Sara Ali', 'Pediatrics', 2, 350.00),
('Dr. Omar Khaled', 'Dermatology', 3, 400.00);

INSERT INTO Patients (Full_Name, Gender, Age, Phone, Insurance_Status, Created_At) VALUES
('Mohamed Reda', 'Male', 35, '01012345678', 'Active', '2026-01-10'),
('Mona El-Sayed', 'Female', 28, '01123456789', 'Active', '2026-01-15'),
('Khaled Tarek', 'Male', 50, '01234567890', 'Inactive', '2026-02-01');

INSERT INTO Appointments (Patient_ID, Doctor_ID, Appointment_Date, Status) VALUES
(1, 1, '2026-10-01', 'Completed'),
(2, 2, '2026-10-05', 'Scheduled'),
(3, 3, '2026-10-10', 'Cancelled');

INSERT INTO Invoices (Appointment_ID, Total_Amount, Discount_Amount, Payment_Status, Payment_Method) VALUES
(1, 500.00, 50.00, 'Paid', 'Insurance'),
(2, 350.00, 0.00, 'Pending', 'Credit Card');

