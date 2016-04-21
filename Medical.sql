CREATE TABLE Patient 
(  
PatientID smallint unsigned not null auto_increment,
FirstName varchar(255) not null,
LastName varchar(255)  not null,
Gender varchar(255)  not null,
DOB date  not null,
MobileNo int  not null,
HomeNo int,
Injury varchar(255) not null,
DoctorName varchar(255) not null,
primary key (PatientID)
) engine=Innodb;

INSERT INTO Patient (FirstName, LastName, Gender, DOB, MobileNo, HomeNo, Injury, DoctorName )
                       VALUES
                       ("Peter", "O Grady", "Male", "19520923", "0875568851", "09426391", "Broken Leg", "John Smith"),
					   ("Martin", "Walsh", "Male", "19830117", "0852257841", "09125125", "Stroke", "Micheal Walsh"),
					   ("Michael", "Murphy", "Male", "19650302", "0835987112", "09825555", "Heart Attack", "John Smith"),
					   ("Ann", "Coleman", "Female", "19750101", "0868853591", "07463521", "Pneumonia", "Ken Jones"),
					   ("Julie", "Jones", "Female", "19451225", "0879157539", "09336647", "Pneumonia", "Ken Jones"),
					   ("Lorna", "McBride", "Female", "19780306", "0863335555", "07114563", "Broken Leg", "John Smith"),
					   ("Patrick", "Lavelle", "Male", "19890321", "0852525636", "08525654", "Broken Arm", "Peter Byrne"),
					   ("Jason", "McTigue", "Male", "19950912", "0874513624", "09827104", "Stroke", "Micheal Walsh");
					   
					   
					   
CREATE TABLE Doctor
(  
DoctorID smallint unsigned not null auto_increment,
FirstName varchar(255) not null,
LastName varchar(255)  not null,
Gender varchar(255)  not null,
DOB date  not null,
MobileNo int  not null,
HomeNo int,
JobTitle varchar(255) not null,
primary key (DoctorID)
) engine=Innodb;

INSERT INTO Doctor (FirstName, LastName, Gender, DOB, MobileNo, HomeNo, JobTitle )
                       VALUES
                       ("John", "Smith", "Male", "19750512", "0862554732", "09826874", "Neurologist"),
					   ("Michael", "Walsh", "Male", "19830117", "0835896712", "09328531", "Oncologist"),
					   ("John", "Smith", "Male", "19790329", "0862145841", "09425651", "Surgeon"),
					   ("Ken", "Jones", "Male", "19720516", "0868853591", "07425584", "Dermatologist"),
					   ("Peter", "Byrne", "Male", "19451225", "0879157539", "09336647", "Paramedic"),
					   ("Mary", "O Brien", "Female", "19830306", "0862552631", "07124481", "Nurse"),
					   ("Patrick", "Meehan", "Male", "19890321", "0852525636", "08525654", "Oncologist"),
					   ("Rachel", "Lynn", "Female", "19930309", "0852654514", "07125351", "Surgeon");

