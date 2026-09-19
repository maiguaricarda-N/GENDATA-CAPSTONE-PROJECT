CREATE TABLE IF NOT EXISTS `Clinic` (
	`Clinic_ID` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`FacultyName` VARCHAR(255) NOT NULL,
	`City` VARCHAR(255) NOT NULL,
	`State` VARCHAR(255) NOT NULL,
	`Zip Code` VARCHAR(255),
	`EmergencyContantsLine` VARCHAR(255),
	`Street` VARCHAR(255),
	`Operating Hours` VARCHAR(255),
	PRIMARY KEY(`Clinic_ID`)
);


CREATE TABLE IF NOT EXISTS `Patient` (
	`Patient_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`NationalIDnumber` INTEGER NOT NULL UNIQUE,
	`FirstName` VARCHAR(255) NOT NULL,
	`lastName` VARCHAR(255) NOT NULL,
	`DateofBirth` DATE,
	`Biological Sex` VARCHAR(255),
	`EmergencyContactName` VARCHAR(255),
	`EmergencyContactRelationship` VARCHAR(255),
	`EmergencyContactPhoneNUmber` VARCHAR(255),
	PRIMARY KEY(`Patient_id`)
);


CREATE TABLE IF NOT EXISTS `Doctor` (
	`Doctor_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`NPI` VARCHAR(255) NOT NULL UNIQUE,
	`First Name` VARCHAR(255) NOT NULL,
	`Last Name` VARCHAR(255) NOT NULL,
	`Lisence State` VARCHAR(255),
	`Primary speciaty` VARCHAR(255),
	`Clinic_ID` INTEGER NOT NULL,
	`ReferredByDoctorID` INTEGER,
	PRIMARY KEY(`Doctor_id`)
);


CREATE TABLE IF NOT EXISTS `Appointments` (
	`Appointment_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`AppointmentDateTome` DATETIME,
	`Status` VARCHAR(255),
	`Doctor_ID` INTEGER NOT NULL,
	`Patient-ID` INTEGER NOT NULL,
	`Clinic_ID` INTEGER NOT NULL,
	PRIMARY KEY(`Appointment_id`)
);


CREATE UNIQUE INDEX `uq_doctor_datetime`
ON `Appointments` (`Doctor_ID`, `AppointmentDateTome`);
CREATE TABLE IF NOT EXISTS `Diagnosis` (
	`Diagnosis_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`Appointment_id` INTEGER UNSIGNED NOT NULL,
	`ICDcode` VARCHAR(255) NOT NULL,
	`Description` VARCHAR(255),
	PRIMARY KEY(`Diagnosis_id`)
);


CREATE TABLE IF NOT EXISTS `Prescription` (
	`Prescription_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`Appointments_id` INTEGER NOT NULL UNIQUE,
	PRIMARY KEY(`Prescription_id`)
);


CREATE TABLE IF NOT EXISTS `Medical_Practitioner` (
	`doctor_id` INTEGER UNSIGNED NOT NULL,
	`NPI` VARCHAR(255),
	`Full_name` VARCHAR(255),
	`Lisence_State` VARCHAR(255),
	`primary_specialty` VARCHAR(255) NOT NULL,
	`primary_clinic_id` INTEGER,
	PRIMARY KEY(`doctor_id`)
);


CREATE TABLE IF NOT EXISTS `Prescription_item` (
	`Item_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	`Prescription_id` INTEGER NOT NULL,
	`MedicationName` VARCHAR(255) NOT NULL,
	`Dosage` VARCHAR(255) NOT NULL,
	`Duration` VARCHAR(255) NOT NULL,
	`Frequency` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`Item_id`)
);


ALTER TABLE `Appointments`
ADD FOREIGN KEY(`Patient-ID`) REFERENCES `Patient`(`Patient_id`)
ON UPDATE NO ACTION ON DELETE CASCADE;
ALTER TABLE `Diagnosis`
ADD FOREIGN KEY(`Appointment_id`) REFERENCES `Appointments`(`Appointment_id`)
ON UPDATE NO ACTION ON DELETE CASCADE;
ALTER TABLE `Medical_Practitioner`
ADD FOREIGN KEY(`doctor_id`) REFERENCES `Doctor`(`Doctor_id`)
ON UPDATE NO ACTION ON DELETE CASCADE;
ALTER TABLE `Appointments`
ADD FOREIGN KEY(`Doctor_ID`) REFERENCES `Doctor`(`Doctor_id`)
ON UPDATE NO ACTION ON DELETE CASCADE;
ALTER TABLE `Appointments`
ADD FOREIGN KEY(`Clinic_ID`) REFERENCES `Clinic`(`Clinic_ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Prescription_item`
ADD FOREIGN KEY(`Prescription_id`) REFERENCES `Prescription`(`Prescription_id`)
ON UPDATE NO ACTION ON DELETE CASCADE;
ALTER TABLE `Doctor`
ADD FOREIGN KEY(`Clinic_ID`) REFERENCES `Clinic`(`Clinic_ID`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Doctor`
ADD FOREIGN KEY(`ReferredByDoctorID`) REFERENCES `Doctor`(`Doctor_id`)
ON UPDATE NO ACTION ON DELETE SET NULL;
ALTER TABLE `Prescription`
ADD FOREIGN KEY(`Appointments_id`) REFERENCES `Appointments`(`Appointment_id`)
ON UPDATE NO ACTION ON DELETE CASCADE;