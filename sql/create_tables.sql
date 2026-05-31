-- ==========================================
-- 1. CREATE_TABLES
-- ==========================================

CREATE DATABASE IF NOT EXISTS ClinicManagementSystem;
USE ClinicManagementSystem;

-- Drop tables if they exist to allow clean re-runs
DROP VIEW IF EXISTS View_UpcomingAppointments;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS Clinic;
DROP TABLE IF EXISTS Department;

-- Create Department table
CREATE TABLE Department (
    Department_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(200) NOT NULL,
    Description VARCHAR(300)
);

-- Create Clinic table
CREATE TABLE Clinic (
    Clinic_ID INT PRIMARY KEY,
    Name VARCHAR(200) NOT NULL,
    Address VARCHAR(250),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) 
        ON DELETE SET NULL ON UPDATE CASCADE
);

-- Create Doctor table
CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY,
    Name VARCHAR(200) NOT NULL,
    Phone_Number VARCHAR(20),
    Address VARCHAR(250),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
        ON DELETE SET NULL ON UPDATE CASCADE
);

-- Create Patient table
CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(200) NOT NULL,
    Phone_Number VARCHAR(20),
    Address VARCHAR(250),
    Birth_Date DATE,
    Job VARCHAR(150)
);

-- Create Appointment table
CREATE TABLE Appointment (
    Appointment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE NOT NULL,
    Start_Time TIME NOT NULL,
    End_Time TIME NOT NULL,
    Cost DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    Status ENUM('Scheduled', 'In Progress', 'Postponed') NOT NULL DEFAULT 'Scheduled',
    Patient_Diagnosis VARCHAR(250),
    Patient_ID INT,
    Doctor_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) ON DELETE CASCADE,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID) ON DELETE CASCADE
);

-- Bonus Requirement: Helpful View for Application/UI Reporting
CREATE VIEW View_UpcomingAppointments AS
SELECT 
    a.Appointment_ID,
    a.Date,
    a.Start_Time,
    p.Name AS Patient_Name,
    d.Name AS Doctor_Name,
    dept.Name AS Department_Name,
    a.Cost,
    a.Status
FROM Appointment a
JOIN Patient p ON a.Patient_ID = p.Patient_ID
JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID
JOIN Department dept ON d.Department_ID = dept.Department_ID;