-- ==========================================
-- 4. TRIGGERS
-- ==========================================

USE ClinicManagementSystem;

DELIMITER //

-- Trigger 1: Protects schedule integrity. Prevents data input errors 
-- where an end-time is accidentally input before the start-time.
DROP TRIGGER IF EXISTS Before_Appointment_Insert//
CREATE TRIGGER Before_Appointment_Insert
BEFORE INSERT ON Appointment
FOR EACH ROW
BEGIN
    IF NEW.End_Time <= NEW.Start_Time THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Appointment End_Time cannot be earlier than or equal to Start_Time.';
    END IF;
END//

-- Trigger 2: Audit/Sanitization rule. Automatically capitalizes 
-- critical Patient names during entry to standardize user input records.
DROP TRIGGER IF EXISTS Before_Patient_Insert//
CREATE TRIGGER Before_Patient_Insert
BEFORE INSERT ON Patient
FOR EACH ROW
BEGIN
    SET NEW.Name = CONCAT(UPPER(SUBSTRING(NEW.Name,1,1)), LOWER(SUBSTRING(NEW.Name,2)));
END//

DELIMITER ;