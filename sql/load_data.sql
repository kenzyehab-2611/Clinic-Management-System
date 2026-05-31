-- ==========================================
-- 2. LOAD_DATA
-- ==========================================

USE ClinicManagementSystem;

-- Insert sample data into Department table (13 rows)
INSERT INTO Department (Name, Description) VALUES
('Dermatology', 'Deals with skin-related issues'),
('Orthopedics', 'Deals with musculoskeletal system disorders'),
('Pediatrics', 'Deals with medical care of infants, children, and adolescents'),
('Cardiology', 'Deals with heart-related issues'),
('Psychiatry', 'Deals with mental health disorders'),
('Urology', 'Deals with urinary tract and male reproductive system disorders'),
('Rheumatology', 'Deals with autoimmune and inflammatory disorders'),
('Pulmonology', 'Deals with respiratory system disorders'),
('Neurology', 'Deals with nervous system disorders'),
('Ophthalmology', 'Deals with eye-related issues'),
('Endocrinology', 'Deals with hormone-related disorders'),
('Gastroenterology', 'Deals with digestive system disorders'),
('ENT', 'Deals with ear, nose, and throat disorders');

-- Insert sample data into Clinic table (13 rows)
INSERT INTO Clinic (Clinic_ID, Name, Address, Department_ID) VALUES
(12211, 'Al Rawda Clinic', '1111 Paris St, Menoufia, eg', 1),
(23322, 'AL Sallam Center', '1212 Sallam St, Suiz, eg', 2),
(34433, 'Dar Al Chafaa Clinic', '15 Gomhorya, Sohag, eg', 3),
(45544, 'Abn Sina Center', '1414 Sallam, Bor Saeed, eg', 4),
(56655, 'Khawatya Clinic', '1515 Baher, Gerga, eg', 5),
(67766, 'Dar Al Foud Center', '1616 Al Hosary, 6 Oct, eg', 6),
(78877, 'Om Masryin Clinic', '1717 Cournesh nile, Maady, eg', 7),
(89988, 'Nabd Heart Center', '404 Al Tahrer St, Cairo, eg', 8),
(91199, 'NeuroHealth Clinic', '505 Elm St, Alexandria, eg', 9),
(10222, 'EyeCare Center', '606 Nile St, Giza, eg', 10),
(11333, 'Hormone Health Clinic', '707 Pyramids St, Giza, eg', 11),
(12444, 'Digestive Health Clinic', '808 Freedom St, Mansura, eg', 12),
(13555, 'ENT Specialist Clinic', '909 Unity St, Ismailia, eg', 13);

-- Insert sample data into Doctor table (14 rows)
INSERT INTO Doctor (Doctor_ID, Name, Phone_Number, Address, Department_ID) VALUES
(122955, 'Dr. Mohamed', '234-567-8901', '789 Sallam St, Asyout, eg', 1),
(133895, 'Dr. Nada', '345-678-9012', '234 Oroba St, Sohag, eg', 2),
(144695, 'Dr. Omar', '567-890-1234', '567 Al Nile St, Aswan, eg', 3),
(155295, 'Dr. Ekram', '678-901-2345', '890 Al Baher St, Tanta, eg', 4),
(166285, 'Dr. Sara', '901-234-5678', '123 Al Hram, Geza, eg', 5),
(177735, 'Dr. Emad', '123-456-7890', '456 Dahshour, Helwan, eg', 6),
(988465, 'Dr. Yousef', '234-567-8901', '789 Osmaan, Suiz, eg', 7),
(599245, 'Dr. Hanen', '345-678-9012', '123 Abdel Nasser, Menoufia, eg', 8),
(110235, 'Dr. Reem', '385-688-9812', '1618 Al Tahrer, Cairo, eg', 1),
(211346, 'Dr. Hossam', '123-987-6543', '101 Freedom St, Cairo, eg', 9),
(222457, 'Dr. Dina', '234-876-5432', '202 Liberation St, Giza, eg', 10),
(233568, 'Dr. Khaled', '345-765-4321', '303 Justice St, Giza, eg', 11),
(244679, 'Dr. Ayman', '456-654-3210', '404 Independence St, Mansura, eg', 12),
(255790, 'Dr. Laila', '567-543-2109', '505 National St, Ismailia, eg', 13);

-- Insert sample data into Patient table (13 rows)
INSERT INTO Patient (Patient_ID, Name, Phone_Number, Address, Birth_Date, Job) VALUES
(12527, 'Rawda Al Safty', '111-222-3333', '101 Mobark St, Menoufia, eg', '1980-01-01', 'Engineer'),
(92346, 'Fares Fawzy', '444-555-6666', '202 Mobara St, Tanta, eg', '1990-05-15', 'Teacher'),
(82345, 'Shahd Khalaf', '777-888-9999', '303 Faisal St, Geza, eg', '1975-10-20', 'Nurse'),
(78360, 'Radwan Khattap', '222-333-4444', '404 Korba St, Cairo, eg', '1988-03-05', 'Doctor'),
(61213, 'Haidy Naser', '555-666-7777', '505 Paris St, Menoufia, eg', '1982-07-12', 'Lawyer'),
(51516, 'Tina Moheb', '888-999-0000', '606 Abo Sympile St, Aswan, eg', '1995-12-30', 'Artist'),
(41819, 'Omar Tarek', '111-484-5885', '707 Shobra St, Banha, eg', '1970-08-25', 'Dentist'),
(85258, 'Esraa Madian', '333-224-5225', '707 Elshohada St, Menoufia, eg', '1970-08-25', 'Engineer'),
(96369, 'Marwa Ali', '222-774-5775', '707 Mydan Sallam St, Mansura, eg', '1970-08-25', 'Engineer'),
(10721, 'Ahmad Hossam', '111-333-5555', '808 Unity St, Ismailia, eg', '1985-09-15', 'Architect'),
(11832, 'Yasmine Khaled', '222-444-6666', '909 Liberation St, Giza, eg', '1992-08-19', 'Librarian'),
(12943, 'Mustafa Ali', '333-555-7777', '1010 National St, Ismailia, eg', '1978-11-22', 'Pharmacist'),
(14054, 'Hana Saad', '444-666-8888', '1111 Independence St, Mansura, eg', '1983-04-13', 'Scientist');

-- Insert sample data into Appointment table (13 rows)
INSERT INTO Appointment (Date, Patient_ID, Doctor_ID, Start_Time, End_Time, Cost, Status, Patient_Diagnosis) VALUES
('2023-09-01', 12527, 122955, '10:00:00', '11:00:00', 100.00, 'Scheduled', 'Fatty Liver'),
('2023-09-15', 92346, 133895, '14:00:00', '15:00:00', 150.00, 'In Progress', 'Hypertension'),
('2023-07-03', 82345, 122955, '09:00:00', '10:00:00', 120.00, 'Postponed', 'Fatty Liver'),
('2023-08-20', 12527, 144695, '11:00:00', '12:00:00', 130.00, 'In Progress', 'Eye Infection'),
('2023-09-10', 61213, 155295, '15:00:00', '16:00:00', 140.00, 'Scheduled', 'Knee Pain'),
('2023-10-05', 51516, 166285, '08:00:00', '09:00:00', 160.00, 'In Progress', 'Migraine'),
('2023-11-12', 41819, 177735, '13:00:00', '14:00:00', 170.00, 'Scheduled', 'Childhood Illness'),
('2023-11-30', 96369, 988465, '10:00:00', '11:00:00', 110.00, 'Scheduled', 'Asthma'),
('2023-12-05', 78360, 599245, '09:00:00', '10:00:00', 200.00, 'In Progress', 'Heart Disease'),
('2023-12-15', 14054, 211346, '12:00:00', '13:00:00', 220.00, 'Postponed', 'Migraine'),
('2023-12-20', 10721, 222457, '11:00:00', '12:00:00', 210.00, 'Postponed', 'Eye Infection'),
('2023-12-25', 12943, 233568, '14:00:00', '15:00:00', 230.00, 'Scheduled', 'Diabetes Checkup'),
('2023-12-30', 11832, 244679, '15:00:00', '16:00:00', 250.00, 'Scheduled', 'Digestive Issues');