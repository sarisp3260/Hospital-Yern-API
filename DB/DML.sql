USE YourDataBaseName;

INSERT INTO Patients (PatientID, PatientName, Age, Gender, Diagnosis, AdmissionDate)
VALUES
    (1, 'Alejandro Fernandez', 35, 'M', 'Fiebre', '2023-01-15'),
    (2, 'Luisa Martínez', 28, 'F', 'Resfriado', '2023-02-20'),
    (3, 'Pedro Ramirez', 45, 'M', 'Dolor de Cabeza', '2023-03-10'),
    (4, 'María García', 50, 'F', 'Dolor de Espalda', '2023-04-05'),
    (5, 'Carmen López', 22, 'F', 'Diabetes', '2023-05-12'),
	(6, 'Mario Gomez', 18, 'M', 'Diabetes Tipo 3', '2023-07-12'),
	(7, 'Sam Montolla', 27, 'F', 'Diabetes', '2023-05-12'),
	(8, 'Pedro Holmes', 76, 'M', 'Diabetes Tipo 1', '2023-12-12'),
	(9, 'Karen Ramirez', 24, 'F', 'Diabetes', '2023-04-12'),
	(10, 'Lola Diaz', 45, 'F', 'Diabetes Tipo 3', '2023-11-12');

INSERT INTO Doctors (DoctorID, DoctorName, Specialty)
VALUES
    (1, 'Dr. Sánchez', 'Médico General'),
    (2, 'Dr. Rodríguez', 'Dermatólogo'),
    (3, 'Dr. Gómez', 'Neurólogo'),
    (4, 'Dr. Pérez', 'Cardiólogo'),
    (5, 'Dr. Flores', 'Ortopedista');

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate)
VALUES
    (1, 1, 1, '2023-01-20'),
    (2, 2, 2, '2023-02-25'),
    (3, 3, 3, '2023-03-15'),
    (4, 4, 1, '2023-04-10'),
    (5, 5, 2, '2023-05-18');



SELECT A.AppointmentID, D.DoctorName, P.PatientName, 
    CASE 
        WHEN A.AppointmentDate > GETDATE() THEN 'Appointment in the future'
        WHEN CONVERT(DATE, A.AppointmentDate) = CONVERT(DATE, GETDATE()) THEN 'Appointment today'
        WHEN A.AppointmentDate < GETDATE() THEN
            CASE 
                WHEN A.AppointmentDate >= DATEADD(DAY, -15, GETDATE()) THEN 'Appointment in the last 15 days'
                ELSE 'Appointment more than 15 days ago'
            END
    END AS appointment_timing
FROM Appointments A
JOIN Doctors D ON A.DoctorID = D.DoctorID
JOIN Patients P ON A.PatientID = P.PatientID;

SELECT *
FROM Doctors AS D
INNER JOIN Appointments AS A ON D.DoctorID = A.DoctorID;


SELECT *
FROM Doctors AS D
LEFT JOIN Appointments AS A ON D.DoctorID = A.DoctorID;

SELECT 
	CASE 
        WHEN Gender = 'M' THEN 'Male'
        ELSE Gender
    END AS Gender,
    COUNT(*) AS TotalPatients,
    AVG(CAST(Age AS FLOAT)) AS AverageAge 
FROM 
    Patients
WHERE 
    Gender = 'M'
    AND Diagnosis LIKE '%Diabetes%'
GROUP BY 
    Gender;