--1) Retrieve information about doctors specializing in any category. 

SELECT doctor_name,gender,specialization FROM Doctor;

--2) List medicines available online through Apollos website.

SELECT age_group, exp_date, mfg_date, online_sale_price, medicine_name 
FROM Apollo_Medical_Store_Online;

--3) Find medical stores with available quantities of any quatity greater than 25.

SELECT DISTINCT store_name, store_address FROM buy_offline WHERE available_qty > 25;

--4) Give the price of the Blood test test

SELECT price FROM Lab WHERE test_name = 'Blood Test';

--5) List ratings given by patients for a specific doctor.

SELECT doctor_name, patient_name,given_rating  FROM Rating natural join Doctor natural join Patient where doctor_id = 'D001';

--6) List details of patients admitted in AC rooms.

SELECT Pa.patient_name, Pa.age, admit.room_id FROM (admit_department natural join admit_data) as admit JOIN patient 
as Pa ON admit.patient_id = Pa.patient_id WHERE ac_non_ac = 'AC';

--7) List all stores details where the medicine is not available offline.

SELECT medicine_name FROM apollo_medical_store_online EXCEPT SELECT medicine_name FROM buy_offline;

--8) List patients' details who are not admitted. 

SELECT patient_id FROM Patient EXCEPT SELECT patient_id FROM Admit_Data;

--9) List all room IDs with per_day_cost where available beds > 10, non-AC rooms, and 
per day cost between 50 to 100. 

SELECT room_id, per_day_cost FROM admit_department WHERE available_beds > 10 AND per_day_cost >= 50
AND per_day_cost <= 100 AND ac_non_ac = 'Non-AC';

--10)  List doctors and Patient details visited on a particular day (date).

SELECT doctor_name, patient_name, visit_date FROM patient_visit natural join health_record natural join
patient natural join doctor WHERE visit_date = '2024-03-20';

--11) Display test results along with patient and test details.

SELECT patient_name, test_name, "result" FROM test natural join patient;

--12) Identify the most prescribed medicine by doctors. 

SELECT medicine_name, count(medicine_name) FROM medicine natural join health_record
GROUP BY medicine_name order by count(medicine_name) desc limit 10;

--13) Retrieve health records for patients with prescriptions suggesting a specific medicine.

SELECT patient_name, doctor_name, prescription, medicine_name FROM 
health_record natural join patient natural join doctor 

--14) Calculate the average rating for each doctor. 

SELECT doctor_id, doctor_name, avg(given_rating) FROM doctor natural join rating 
GROUP BY doctor_id ORDER BY avg(given_rating) DESC; 

--15) List details of staff members worked in perticular room.

SELECT "Name", age, gender FROM department_staff natural join staff WHERE room_id = 'R102';

--16)Retrieve the average age of patients admitted in a specific department:

SELECT AVG(Age) FROM Patient WHERE Room_id = 'R101';

--17)Retrieve all appointments scheduled for a specific doctor:

SELECT * FROM Appointment WHERE Doctor_id = 'D013';

--18) Retrieve the number of patients admitted in each department:

SELECT Room_id, COUNT(*) FROM Admit_Data GROUP BY Room_id;

--19) Retrieve the total number of tests performed by a specific lab technician:

SELECT Lab_tech_name, COUNT(*) FROM Test GROUP BY Lab_tech_name;

--20) Retrieve the total cost of medicines purchased offline from a specific store:

SELECT SUM(Online_sale_price * Available_qty) AS Total_cost FROM Buy_Offline WHERE Store_name = 'Brahma Medical';

--21) Retrieve the names of patients who have been prescribed a specific medicine:

SELECT Patient_name FROM Patient p JOIN Health_Record hr ON p.Patient_id = hr.Patient_id WHERE Medicine_name = 'Paracetamol';

--22) Retrieve the average age of patients admitted under each doctor:

SELECT a.Doctor_id, AVG(p.Age) AS Avg_age 
FROM Appointment a 
JOIN Patient p ON a.Patient_id = p.Patient_id 
GROUP BY a.Doctor_id;

--23) Retrieve the names of patients who have undergone a specific medical test:

SELECT DISTINCT p.Patient_name 
FROM Patient p 
JOIN Test t ON p.Patient_id = t.Patient_id 
WHERE Test_name = 'Blood Test';

--24)Retrieve the names of patients who have not scheduled any appointments:

SELECT Patient.Patient_name
FROM Patient
LEFT JOIN Appointment ON Patient.Patient_id = Appointment.Patient_id
WHERE Appointment.Patient_id IS NULL;

--25) Retrieve the names of patients who have not undergone any medical tests conducted by a specific lab technician:

SELECT Patient.Patient_name
FROM Patient
LEFT JOIN Test ON Patient.Patient_id = Test.Patient_id
WHERE Test.Lab_tech_name != 'specified_lab_technician';