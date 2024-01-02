CREATE DATABASE YourDatabaseName;

USE YourDataBaseName;

-- Patients Table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName NVARCHAR(50) NOT NULL,
    Age INT NOT NULL DEFAULT 30,
    Gender NVARCHAR(10) NOT NULL,
    Diagnosis NVARCHAR(100) NOT NULL,
    AdmissionDate DATE NOT NULL DEFAULT GETDATE(),
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedAt DATETIME
);

-- Doctors Table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName NVARCHAR(50) NOT NULL,
    Specialty NVARCHAR(50) NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedAt DATETIME
);

-- Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATE NOT NULL DEFAULT GETDATE(),
	CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedAt DATETIME
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    CONSTRAINT PK_Appointments_Patient_Doctor UNIQUE (PatientID, DoctorID),
);