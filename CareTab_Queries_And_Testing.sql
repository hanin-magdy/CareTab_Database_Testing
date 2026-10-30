-- 1.   (Data Filtering)
SELECT * FROM Patients WHERE Insurance_Status = 'Active';

-- 2.   ( LEFT JOIN)
SELECT P.Full_Name AS Patient_Name, D.Doctor_Name, A.Appointment_Date, A.Status
FROM Appointments A
LEFT JOIN Patients P ON A.Patient_ID = P.Patient_ID
LEFT JOIN Doctors D ON A.Doctor_ID = D.Doctor_ID;

-- 3.  (Backend Data Integrity)
SELECT * FROM Invoices WHERE Payment_Status = 'Pending';

-- 4. (Aggregate Functions & GROUP BY)
SELECT Payment_Method, SUM(Total_Amount - Discount_Amount) AS Net_Revenue FROM Invoices WHERE Payment_Status = 'Paid' GROUP BY Payment_Method;
 