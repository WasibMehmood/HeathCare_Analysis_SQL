-- CREATING DATABASE NAMED HEALTHCARE--

CREATE DATABASE healthcare_db;
USE healthcare_db;

-- CREATING A TABLE TO MATCH THE STRUCTURE OF DATASET BECAUSE DATA IS TOO LARGE--

CREATE TABLE healthcare_data (
    Name varchar(100),
    Age int not null,
    Gender varchar(10),
    Blood_Type varchar(5),
    Medical_Condition varchar(50),
    Date_of_Admission DATE not null,
    Doctor varchar(100),
    Hospital varchar(100),
    Insurance_Provider varchar(50),
    Billing_Amount float not null,
    Room_Number int not null,
    Admission_Type varchar(20),
    Discharge_Date date not null,
    Medication varchar(50),
    Test_Results varchar(50)
);

-- . List all patients who have been admitted with the medical condition "Cancer".--
SELECT Name 
FROM healthcare_data
where Medical_Condition = 'Cancer';

-- . Find the total number of patients admitted to the hospital.--
SELECT count(Date_of_Admission) as total_patients
FROM healthcare_data;

-- List the names of patients and their corresponding blood types.--
SELECT Name, Blood_Type
FROM healthcare_data;

-- Retrieve the names and ages of all male patients.--
SELECT Name, Age
FROM healthcare_data
WHERE Gender = 'Male';

-- Find the average billing amount for patients with "Obesity".--
SELECT Round(AVG(Billing_Amount),3) as Avg_Billing_Amount
FROM healthcare_data
WHERE Medical_Condition = 'Obesity';

-- List all patients who were admitted to the hospital in the year 2022 --
SELECT Name
FROM healthcare_data
WHERE left(Date_of_admission,4) = '2022';

-- Retrieve the names of doctors and the number of patients they have treated.--
SELECT Doctor, count(Name) as patient_treated
FROM healthcare_data
GROUP BY Doctor;

-- Find the total billing amount for each insurance provider.--
SELECT Insurance_Provider, 
SUM(Billing_Amount) as total_billing_amount
FROM healthcare_data
GROUP BY Insurance_Provider;

-- List the names of patients who have been admitted more than once.--
SELECT Name
FROM healthcare_data
GROUP BY Name
HAVING COUNT(*) > 1;

-- Find the doctor who treated the highest number of patients with "Diabetes".
SELECT Doctor,
COUNT(Name) as total_patients
FROM healthcare_data
WHERE Medical_Condition = 'Diabetes'
GROUP BY Doctor
ORDER BY total_patients desc
LIMIT 1;

-- Calculate the average length of hospital stay for patients with "Urgent" admission type.--
SELECT AVG(DATEDIFF(Discharge_Date, Date_of_Admission)) AS avg_stay_len
FROM healthcare_data
WHERE Admission_Type = 'Urgent';



