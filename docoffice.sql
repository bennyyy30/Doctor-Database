CREATE DATABASE IF NOT EXISTS DocOffice;

CREATE TABLE PERSON(
    `PersonID` varchar(15) PRIMARY KEY NOT NULL,    
    `FirstName` varchar(225) NOT NULL,
    `LastName` varchar(225) NOT NULL,
    `StreetAddress` varchar(225) NOT NULL,
    `City` varchar(225) NOT NULL,
    `State` varchar(225) NOT NULL,
    `Zip` int NOT NULL,
    `PhoneNumber` varchar(225) NOT NULL,
    `SSN` int NOT NULL
);

CREATE TABLE PATIENT (
    `PatientID`  varchar(15) PRIMARY KEY NOT NULL, 
    `PhoneNumber` varchar(15) NOT NULL,
    `DOB` date NOT NULL,
    `PersonID` varchar(15) NOT NULL,
    FOREIGN KEY (PersonID) References Person(PersonID)
);

CREATE TABLE TEST (
    `TestID` varchar(15) NOT NULL PRIMARY KEY,
    `TestName`  varchar(225) NOT NULL
);

CREATE TABLE PVISITTEST (
    `VisitID` varchar(15) NOT NULL PRIMARY KEY,
    `TestID`  varchar(15)  NOT NULL,
    FOREIGN KEY(TestID) References TEST(TestID)
);

CREATE TABLE DOCTOR (
    `DoctorID` varchar(15) NOT NULL PRIMARY KEY,
    `FirstName` varchar(25) NOT NULL,
    `LastName` varchar(25) NOT NULL,
    `MedicalDegrees` varchar(225) NOT NULL,
    `PersonID` varchar(15) NOT NULL,
    FOREIGN KEY(PersonID) References Person(PersonID)
);

CREATE TABLE PATIENTVISIT(
    `VisitID` varchar(15) NOT NULL PRIMARY KEY,
    `PatientID` varchar(15)  NOT NULL,     
    `DoctorID` varchar(15)  NOT NULL,
    `VisitDate` date  NOT NULL,
    `DocNote` varchar(225),
    FOREIGN KEY(PatientID) References PATIENT(PatientID),
    FOREIGN KEY(DoctorID) References DOCTOR(DoctorID)
);


CREATE TABLE SPECIALTY (
    `SpecialtyID` varchar(15) PRIMARY KEY,
    `SpecialtyName` varchar(225)
);

CREATE TABLE SPECIALTYAUDIT (
  `FirstName` varchar(25) PRIMARY KEY,
  `SpecialtyName` varchar(25),
  `Action` varchar(25),
  `DateModified` date
);
  
CREATE TABLE DOCTORSPECIALTY (
`DoctorID` varchar(15) NOT NULL,
`SpecialtyID` varchar(15) ,
FOREIGN KEY (DoctorID) references DOCTOR(DoctorID),
FOREIGN KEY (SpecialtyID) references SPECIALTY(SpecialtyID)
);

CREATE TABLE PRESCRIPTION (
    PrescriptionID varchar(15) NOT NULL PRIMARY KEY,
    PrescriptionName varchar(225) NOT NULL
);

CREATE TABLE PVISITPRESCRIPTION (
    VisitID varchar(15) NOT NULL PRIMARY KEY,
    PrescriptionID varchar(15) NOT NULL ,
    FOREIGN KEY (VisitID) references  PATIENTVISIT(VisitID),
    FOREIGN KEY (PrescriptionID) references PRESCRIPTION(PrescriptionID)
);


INSERT INTO PERSON(`PersonID`, `FirstName`,  `LastName`,  `StreetAddress`, `City`, `State`, `Zip`, `PhoneNumber`, `SSN`) 
VALUES ('123456', 'Massimo', 'Villareal', 'First Street', 'First City', 'First State', 12345, '1234567890', '12345678'),
       ('123457', 'Bnon', 'Nguyen', 'Second Street', 'Second City', 'Second State', 12345, '0987654321', '22345678'),
       ('123458', 'Katelyn', 'Nguyen', 'Third Street', 'Third City', 'Third State', 12347, '1234567891', '32345678'),
       ('123459', 'Benson', 'Lee', 'Fourth Street', 'Fourth City', 'Fourth State', 12348, '1234567891', '42345678'),
       ('123450', 'Mauricio', 'Martinez', 'Fifth Street', 'Fifth City', 'Fifth State', 12349, '1234567891', '52345678');
 
INSERT INTO PERSON(`PersonID`, `FirstName`, `LastName`, `StreetAddress`, `City`, `State`, `Zip`, `PhoneNumber`, `SSN`) 
VALUES ('212345', 'Robert', 'Stevens', 'Sixth Street', 'Sixth City', 'Sixth State', 12345, '9584736251', '85947362'),
	   ('212346', 'Jane', 'Goodall', 'Seventh Street', 'Seventh City', 'Seventh State', 12347, '0896847362', '74635489'),
	   ('212347', 'Doyoung', 'Kim', 'Eighth Street', 'Eighth City', 'Eighth State', 12348, '5746786743', '85734789');

INSERT INTO PATIENT(`PatientID`, `PhoneNumber`, `DOB`, `PersonID`)
VALUES ('1234561', '1234567890', '1950-11-11', '123456'),
       ('1234562', '0987654321', '1950-11-12', '123457'),
       ('1234563', '1234567891', '1950-11-13', '123458'),
       ('1234564', '1234567891', '1950-11-14', '123459'),
       ('1234565', '1234567891', '1950-11-15', '123450');

INSERT INTO TEST(`TestID`, `TestName`)
VALUES ('867563', 'Acetaminophen Level'),
	   ('840374', 'Acid-Fast Bacillus (AFB) Tests'),
	   ('402964', 'ADHD Screening'),
	   ('489285', 'Allergy Skin Test'),
	   ('263854', 'Amniocentesis (amniotic fluid test)');

INSERT INTO PVISITTEST(`VisitID`, `TestID`)
VALUES ('123', '867563'),
       ('456', '840374'),
       ('789', '402964'),
       ('876', '489285'),
       ('432', '263854');

INSERT INTO DOCTOR (`DoctorID`, `FirstName`, `LastName`, `MedicalDegrees`, `PersonID`)
VALUES ('1234', 'Robert', 'Stevens', 'Doctor of Medicine', '212345'),
       ('1235', 'Jane', 'Goodall', 'Doctor of Medicine','212346'),
	   ('1236', 'Doyoung', 'Kim', 'Doctor of Medicine', '212347');

INSERT INTO PATIENTVISIT(`VisitID`, `PatientID`, `DoctorID`, `VisitDate`)
VALUES ('123', '1234561', '1234', '1959-11-12'),
       ('456', '1234562', '1235', '1959-11-13'),
       ('789', '1234563', '1235','1959-11-14'),
	   ('876', '1234564', '1234', '1959-11-15'),
       ('432', '1234565', '1236', '1959-11-16');

INSERT INTO SPECIALTY(`SpecialtyID`, `SpecialtyName`)
VALUES ('01', 'Family Medicine'),
       ('02', 'Neurology'),
	   ('03', 'Pediatrics');

INSERT INTO DOCTORSPECIALTY(`DoctorID`, `SpecialtyID`)
VALUES ('1234', '01'),
       ('1235', '03');
       
INSERT INTO PRESCRIPTION(`PrescriptionID`, `PrescriptionName`)
VALUES ('678', 'Vicodin'),
       ('876', 'Steroids'),
       ('532', 'Painkillers');  
       
INSERT INTO PVISITPRESCRIPTION(`VisitID`, `PrescriptionID`)
VALUES ('123', '678'),
	   ('456', '532');

-- #2
CREATE VIEW RobertPatients AS
SELECT PERSON.FirstName, PERSON.LastName, PATIENT.PhoneNumber FROM DOCTOR
INNER JOIN PATIENTVISIT ON PATIENTVISIT.DoctorID = DOCTOR.DoctorID
INNER JOIN PATIENT ON PATIENT.PatientID = PATIENTVISIT.PatientID
INNER JOIN PERSON ON PERSON.PersonID = PATIENT.PersonID
WHERE DOCTOR.FirstName = 'Robert' AND DOCTOR.LastName = 'Stevens';

-- #3
CREATE VIEW VicodinDrug AS
SELECT P.FirstName, P.LastName FROM PERSON P
INNER JOIN DOCTOR D ON P.PersonID = D.PersonID
INNER JOIN PATIENTVISIT PV ON D.DoctorID = PV.DoctorID
INNER JOIN PVISITPRESCRIPTION PVP ON PV.VisitID = PVP.VisitID
INNER JOIN PRESCRIPTION PR ON PVP.PrescriptionID = PR.PrescriptionID
WHERE PR.PrescriptionName = 'Vicodin';

-- #4
CREATE VIEW docwSpecialty AS
SELECT P.FirstName, P.LastName, S.SpecialtyName FROM PERSON P
INNER JOIN DOCTOR D ON P.PersonID = D.PersonID
INNER JOIN DOCTORSPECIALTY DS ON D.DoctorID = DS.DoctorID
INNER JOIN SPECIALTY S ON DS.SpecialtyID = S.SpecialtyID;

-- #5
ALTER VIEW docwSpecialty AS
SELECT P.FirstName, P.LastName, S.SpecialtyName FROM PERSON P
INNER JOIN DOCTOR D ON P.PersonID = D.PersonID
LEFT OUTER JOIN DOCTORSPECIALTY DS ON D.DoctorID = DS.DoctorID
LEFT OUTER JOIN SPECIALTY S ON DS.SpecialtyID = S.SpecialtyID;

-- #6
CREATE TRIGGER insertSpecialty
AFTER INSERT ON DOCTORSPECIALTY
FOR EACH ROW
INSERT INTO SPECIALTYAUDIT(`FirstName`, `Action`, `SpecialtyName`, `DateModified`)
VALUES((SELECT FirstName FROM PERSON
		WHERE PersonID in (SELECT PersonID FROM DOCTOR WHERE DoctorID = NEW.DoctorID)), "Doctor added",
						  (SELECT SpecialtyName FROM SPECIALTY WHERE SpecialtyID in 
						  (SELECT SpecialtyID FROM DOCTORSPECIALTY WHERE SpecialtyID = NEW.SpecialtyID)), current_timestamp());


CREATE TRIGGER updateSpecialty
AFTER UPDATE ON DOCTORSPECIALTY
FOR EACH ROW
INSERT INTO SPECIALTYAUDIT(`FirstName`, `Action`, `SpecialtyName`, `DateModified`)
VALUES((SELECT FirstName FROM PERSON
		WHERE PersonID in (SELECT PersonID FROM DOCTOR WHERE DoctorID = NEW.DoctorID)), "Doctor updated",
						  (SELECT SpecialtyName FROM SPECIALTY WHERE SpecialtyID in 
						  (SELECT SpecialtyID FROM DOCTORSPECIALTY WHERE SpecialtyID = NEW.SpecialtyID)), current_timestamp());
                          
BACKUP DATABASE DocOffice
TO DISK = 'C:\backups\testDB.bak';