CREATE TABLE Medicine (
    Medicine_name VARCHAR(30) NOT NULL,
    Disease VARCHAR(30) NOT NULL,
    PRIMARY KEY (Medicine_name)
);

CREATE TABLE Medical_Store (
    Store_name CHARACTER(50) NOT NULL,
    Store_address CHARACTER(100) NOT NULL,
    PRIMARY KEY (Store_address, Store_name)
);

CREATE TABLE Staff (
    Staff_id INTEGER NOT NULL,
    Gender CHARACTER(1),
    "Name" CHARACTER(30),
    Age INTEGER,
    PRIMARY KEY (Staff_id)
);

CREATE TABLE Admit_Department (
    Room_id VARCHAR(10) NOT NULL,
    Available_beds INTEGER,
    Per_day_cost INTEGER,
    Ac_non_ac CHARACTER(8),
    PRIMARY KEY (Room_id)
);

CREATE TABLE Doctor (
    Doctor_id VARCHAR(10) NOT NULL,
    Doctor_name VARCHAR(30),
    Gender CHARACTER(1),
    Specialization VARCHAR(30),
    PRIMARY KEY (Doctor_id)
);

CREATE TABLE  Lab (
    Test_name VARCHAR(30) NOT NULL,
    Price INTEGER,
    PRIMARY KEY (Test_name)
);

CREATE TABLE Patient (
    Patient_id VARCHAR(10) NOT NULL,
    Patient_name VARCHAR(30),
    Age INTEGER,
    Room_id VARCHAR(10),
    PRIMARY KEY (Patient_id),

    FOREIGN KEY (Room_id) REFERENCES Admit_Department(Room_id)

);

CREATE TABLE Apollo_Medical_Store_Online (
    ProductId VARCHAR NOT NULL,
    Age_group VARCHAR(10),
    Exp_date DATE,
    Mfg_date DATE,
    online_sale_price INTEGER,
    Medicine_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (ProductId),
    FOREIGN KEY (Medicine_name) REFERENCES Medicine(Medicine_name)
 
);

CREATE TABLE Buy_Offline (
    Exp_date DATE,
    Online_sale_price INTEGER,
    Available_qty INTEGER,
    Mfg_date DATE,
    Medicine_name VARCHAR(30) NOT NULL,
    Store_name CHARACTER(50) NOT NULL,
    Store_address CHARACTER(100) NOT NULL,
    PRIMARY KEY (Medicine_name, Store_name, Store_address),
    FOREIGN KEY (Medicine_name) REFERENCES Medicine(Medicine_name),
    FOREIGN KEY (Store_name, Store_address) REFERENCES Medical_Store(Store_name, Store_address)

);

CREATE TABLE Department_Staff (
    Staff_id INTEGER NOT NULL,
    Room_id VARCHAR(10),
    PRIMARY KEY (Staff_id, Room_id),

    FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id),
    FOREIGN KEY (Room_id) REFERENCES Admit_department(Room_id)


);

CREATE TABLE Admit_Data (
    Bed_no INTEGER NOT NULL,
    Duration DATERANGE,
	Patient_id VARCHAR(10) NOT NULL,
    Admit_date DATE,
    Room_id CHARACTER(10),
    PRIMARY KEY (Bed_no),
    
    FOREIGN KEY (Room_id) REFERENCES Admit_Department(Room_id),
    FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id)
);

CREATE TABLE Rating (
    Given_rating NUMERIC(10),
    Doctor_id VARCHAR(10) NOT NULL,
    Patient_id VARCHAR(10) NOT NULL,
    PRIMARY KEY (Patient_id, Doctor_id),
    
    FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id),
    FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id)

);

CREATE TABLE Appointment (
    Doctor_id VARCHAR(10) NOT NULL,
    Patient_id VARCHAR(10) NOT NULL,
    Start_date DATE,
    End_date DATE,
    Charge_taken INT,
    PRIMARY KEY (Doctor_id, Patient_id),
    FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id),
    FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id)
);


CREATE TABLE  Test (
    Result VARCHAR(100),
    Lab_tech_name VARCHAR(30) NOT NULL,
    Patient_id VARCHAR(10) NOT NULL,
    Test_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (Patient_id, Test_name, Lab_tech_name),

    FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id),
    FOREIGN KEY (Test_name) REFERENCES Lab(Test_name)

);

CREATE TABLE Health_Record (
    Prescription VARCHAR(50),
    Patient_id VARCHAR(10) NOT NULL,
    Doctor_id VARCHAR(10) NOT NULL,
    Medicine_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (Medicine_name, Doctor_id, Patient_id),

    FOREIGN KEY (Medicine_name) REFERENCES Medicine(Medicine_name),
    FOREIGN KEY (Doctor_id, Patient_id) REFERENCES Appointment(Doctor_id, Patient_id)

);

CREATE TABLE Patient_visit(
    Visit_date DATE,
    Patient_id VARCHAR(10) NOT NULL,
    Next_visit_date DATE NOT NULL,
    PRIMARY KEY (Patient_id),

    FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id)

);