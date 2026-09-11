CAREPULSE — PATIENT & CLINIC SCHEDULING SYSTEM

PROJECT OVERVIEW

CarePulse is a database system for managing patients, doctors, clinics, appointments, diagnoses, prescriptions, and doctor referrals across urgent care clinics.
It follows Entity-Relationship Modeling principles and supports organized healthcare data management.

 BUSINESS BACKGROUND
 
CarePulse manages:
•	Clinics and locations
•	Patient registration
•	Doctors and specialties
•	Doctor referrals
•	Appointments
•	Diagnoses
•	Prescriptions
•	Data organization
•	Appointments connect a patient, doctor, and clinic.

PROBLEM STATEMENT

Managing healthcare records separately can cause duplicate data, scheduling conflicts, inconsistent records, weak referral tracking, and difficulty linking diagnoses and prescriptions to appointments.
CarePulse provides a centralized system to organize these records and maintain reliable connections between related information.

PROJECT OBJECTIVE

The main objective is to manage patients, clinics, doctors, appointments, diagnoses, prescriptions, and referrals while maintaining organized healthcare records.

Specific goals include
•	Store clinic and patient information.
•	Manage doctors, specialties, licenses, and clinic assignments.
•	Track doctor-to-doctor referrals.
•	Schedule appointments with patients, doctors, and clinics.
•	Prevent doctor double-booking.
•	Link diagnoses and prescriptions to appointments.
•	Maintain consistent and organized healthcare records.


 SYSTEM REQUIREMENTS
Clinic
Stores:
- Clinic information
- Facility name
- Location
- Emergency contact
- Street
- Operating hours

Patient
Stores:
- Patient information
- National ID
- Name
- Date of birth
- Biological sex
- Emergency contact details



Doctor
Stores:
- Doctor information
- NPI
- Name
- License state
- Specialty
- Clinic assignment
- Referral information


Appointment
Stores:
- Appointment information
- Date and time
- Status
- Doctor information
- Patient information
- Clinic information
It represents:
Patient + Doctor + Clinic

Diagnosis
Stores diagnoses linked to appointments. One appointment can have multiple diagnoses.

Prescription
Stores prescriptions linked to appointments.


Prescription_Item
Stores individual medications within a prescription.

Medical_Practitioner
The physical model also includes "Medical_Practitioner", linked to "Doctor" through "doctor_id". It overlaps with "Doctor" and should ideally be consolidated or used as a subtype or view.

 Data Connections
The system contains connections between clinics, patients, doctors, appointments, diagnoses, prescriptions, and prescription items.
Appointments connect patients, doctors, and clinics. Diagnoses and prescriptions are associated with appointments, while prescription items are associated with prescriptions.
The "Doctor" entity also contains referral information that allows one doctor to refer a patient or case to another doctor.

Appointment Information
An appointment contains information about:
- Patient
- Doctor
- Clinic
- Appointment date and time
- Appointment status
It answers:
- Which patient?
- Which doctor?
- At which clinic?
- When is the appointment scheduled?
- What is the appointment status?


Data Organization
The system organizes information into separate entities:
- Clinics store facility and location information.
- Patients store personal and emergency contact information.
- Doctors store professional and specialty information.
- Appointments connect patients, doctors, and clinics.
- Diagnoses record medical conditions associated with appointments.
- Prescriptions record medications associated with appointments.
- Prescription items store individual medications within prescriptions.
- Medical practitioners provide an additional representation of doctor information and should ideally be consolidated with the Doctor entity or used as a subtype or view.

 Technologies Used
-MySQL
- SQL
- Entity-Relationship Modeling
- Data validation
- Organized database design
- Cascading and nullifying data actions

Key Features

•	Clinic management
•	Patient registration
•	Doctor and specialty management
•	Doctor referrals
•	Appointment scheduling
•	Double-booking prevention
•	Diagnosis and prescription tracking
•	Prescription medication items
•	Organized healthcare records
•	Consistent data management


 Conclusion

CarePulse is a centralized database for managing urgent care operations. It connects patients, doctors, clinics, appointments, diagnoses, and prescriptions while supporting doctor referrals and scheduling controls.

Its structured design and data organization features improve consistency, reduce duplication, and provide a foundation for future features such as billing, insurance, laboratory results, and reporting.
