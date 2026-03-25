DROP TABLE IF EXISTS Hospital_data;

CREATE TABLE Hospital_data(
	"Hospital Name" VARCHAR(100),
	"Location" VARCHAR(100),
	"Department" VARCHAR(50),
	"Doctors Count" INT,
	"Patients Count" INT,
	"Admission Date" DATE,
	"Discharge Date" DATE,
	"Medical Expenses" NUMERIC(10,2)

);

SELECT * FROM Hospital_data;


--1.Total number of patients.
SELECT "Hospital Name",SUM("Patients Count") AS total_patients
FROM Hospital_data
GROUP BY "Hospital Name";


--2.Average number of doctors per hospital.
SELECT "Hospital Name",ROUND(AVG("Doctors Count" )) AS avg_doctors 
FROM Hospital_data
GROUP BY "Hospital Name";

--3.Top 3 Departments with the highest nuMber of patients
SELECT "Department",SUM("Patients Count") AS total_patients
FROM Hospital_data
GROUP BY "Department" 
ORDER BY total_patients DESC
LIMIT 3;

--4.Hospital with the maximum medical expenses.
SELECT  "Hospital Name",SUM("Medical Expenses") AS total_expenses
FROM Hospital_data
GROUP BY "Hospital Name" 
ORDER BY total_expenses DESC
LIMIT 1;

--5.Daily average Medical expenses.
SELECT  "Hospital Name","Admission Date" ,AVG("Medical Expenses") AS avg_expenses
FROM Hospital_data
GROUP BY "Hospital Name","Admission Date" 
ORDER BY "Hospital Name","Admission Date";

--6.Longest Hospital Stay
SELECT  "Hospital Name","Discharge Date","Admission Date",("Discharge Date"-"Admission Date") AS stay_days
FROM Hospital_data
ORDER BY stay_days DESC LIMIT 1;


--7.Total patients treated Per City.
SELECT "Location",SUM("Patients Count") AS total_patients
FROM Hospital_data
GROUP BY "Location"
ORDER BY total_patients;

--8.Average length of Stay Per Department.
SELECT "Department",
AVG("Discharge Date"-"Admission Date") AS avg_stay_days
FROM Hospital_data
GROUP BY "Department"
ORDER BY  avg_stay_days;


--9.Indentify the department with lowest nuMber of patients.
SELECT "Department",SUM("Patients Count") AS total_patients
FROM Hospital_data
GROUP BY "Department" 
ORDER BY total_patients
LIMIT 1;

--10.Monthly medical expenses Report
SELECT DATE_TRUNC('month',"Admission Date") AS monthnow,
SUM("Medical Expenses") AS total_expenses
FROM Hospital_data
GROUP BY monthnow 
ORDER BY monthnow;



