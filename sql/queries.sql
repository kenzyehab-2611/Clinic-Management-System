-- ==========================================
-- 3. QUERIES
-- ==========================================

USE ClinicManagementSystem;

-- Query 1: Patients diagnosed with Fatty Liver within a specific timeline
SELECT Patient.Name
FROM Patient
JOIN Appointment ON Patient.Patient_ID = Appointment.Patient_ID
WHERE Appointment.Patient_Diagnosis = 'Fatty Liver'
  AND Appointment.Date >= '2023-01-01';

-- Query 2: Addresses of clinics that are within the 'Cardiology' Department
SELECT Clinic.Name, Clinic.Address
FROM Clinic
JOIN Department ON Clinic.Department_ID = Department.Department_ID
WHERE Department.Name = 'Cardiology';

-- Query 3: Total monetary investment from a specific patient
SELECT SUM(Appointment.Cost) AS Total_Cost
FROM Appointment
WHERE Appointment.Patient_ID = 12527;

-- Query 4: Detailed Master List showing Patient, Doctor, and Appointment scheduling parameters
SELECT p.Name AS Patient_Name, d.Name AS Doctor_Name, a.Date, a.Start_Time, a.End_Time, a.Cost, a.Status, a.Patient_Diagnosis
FROM Appointment a
INNER JOIN Patient p ON a.Patient_ID = p.Patient_ID
INNER JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID;

-- Query 5: Find all appointments scheduled for a specific patient by Name
SELECT a.Date, a.Start_Time, a.End_Time, a.Cost, a.Status, a.Patient_Diagnosis
FROM Appointment a
INNER JOIN Patient p ON a.Patient_ID = p.Patient_ID
WHERE p.Name = 'Omar Tarek';

-- Query 6: Find target appointments for a specific Doctor within a date window
SELECT a.Date, a.Start_Time, a.End_Time, a.Cost, a.Status, a.Patient_Diagnosis
FROM Appointment a
INNER JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID
WHERE d.Name = 'Dr. Mohamed'
AND a.Date BETWEEN '2023-09-01' AND '2023-09-30';

-- Query 7: Aggregate check showing total operations load per doctor
SELECT d.Name AS Doctor_Name, COUNT(*) AS Total_Appointments
FROM Doctor d
INNER JOIN Appointment a ON d.Doctor_ID = a.Doctor_ID
GROUP BY d.Name;

-- Query 8: Average cost breakdown per appointment operational status
SELECT Status, AVG(Cost) AS Average_Cost
FROM Appointment
GROUP BY Status;

-- Query 9: Selection from the custom defined View
SELECT * FROM View_UpcomingAppointments;

-- Query 10: State manipulation check (Update transaction)
UPDATE Appointment
SET Status = 'Postponed'
WHERE Appointment_ID = 1;

-- Query 11: System clean-up test rule (Delete execution check)
DELETE FROM Appointment
WHERE Appointment_ID = 13;