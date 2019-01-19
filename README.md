# Attendance, Class Assessment and Teacher-Student Collaboration System
# LICT Group 3

Java Dynamic Web Application, Using Java EE, Servelet, Oracle DB. This web app provides the necessary functionalities to automate all sorts of student-teacher academic collaboration. The functionalities are provided both for the teacher and the student via their own web module. Some features are highlighted below:

```
1. Personal module for both the teachers and students
2. Attendance taker and calculator
3. Class assessment and exams marks calculator
4. Final result processing
5. Teacher-student messaging and notification management
6. Course registration and other necessary features
```

## Getting Started

Clone this repository to your workspace. Follow the prerequisites, installing and then develop your own version. All codes are neat and self-explanatory.

### Prerequisites

What things you need to install the software and how to install them

```
SDK: Java EE 8 or later
Apache Tomcat Server 8 or later
Oracle Database 10g or later
Any Java IDE

```

### Installing

Install all the development tools listed above.

The database information is given below. It is not created autometically here. You can automate your database creation procedure. Here the database: 
```
CREATE TABLE  "COURSE" 
   ("COURSE_CODE" VARCHAR2(16), 
	"COURSE_NAME" VARCHAR2(100), 
	"COURSE_YEAR" NUMBER, 
	"DEPARTMENT" VARCHAR2(100), 
	"TEACHER_ID" VARCHAR2(100), 
	"TABLE_NAME" VARCHAR2(100), 
	 PRIMARY KEY ("TABLE_NAME") ENABLE
   )
/


CREATE TABLE  "STUDENT" 
   ("ID" VARCHAR2(4000), 
	"NAME" VARCHAR2(4000), 
	"EMAIL" VARCHAR2(4000), 
	"DEPT" VARCHAR2(4000), 
	"SESION" VARCHAR2(4000), 
	"CONU" VARCHAR2(4000), 
	"GNAME" VARCHAR2(4000), 
	"GCONU" VARCHAR2(4000), 
	"USER_NAME" VARCHAR2(4000), 
	"PASSWORD" VARCHAR2(4000), 
	 CONSTRAINT "STUDENT_PK" PRIMARY KEY ("ID") ENABLE
   )
/

CREATE TABLE  "COURSE_REQUEST" 
   ("STUDENT_ID" VARCHAR2(100) NOT NULL ENABLE, 
	"COURSE_CODE" VARCHAR2(100), 
	"DEPARTMENT" VARCHAR2(100), 
	"YEAR" VARCHAR2(100), 
	"TEACHER_ID" VARCHAR2(200), 
	"TABLE_NAME+STUDENT_ID" VARCHAR2(200) NOT NULL ENABLE, 
	 PRIMARY KEY ("TABLE_NAME+STUDENT_ID") ENABLE
   )
/

//Auto created table example:
CREATE TABLE  "CSE2017CSE110" 
   ("STUDENT_ID" VARCHAR2(20), 
	"assessment_1_mark" NUMBER, 
	"assessment_2_mark" NUMBER, 
	"assignment_1_mark" NUMBER, 
	"assignment_2_mark" NUMBER, 
	"assignment_1" BLOB, 
	"assignment_2" BLOB, 
	 PRIMARY KEY ("STUDENT_ID") ENABLE
   )
/

CREATE TABLE  "TEACHER" 
   ("NAME" VARCHAR2(80), 
	"EMAIL" VARCHAR2(80), 
	"PASS" VARCHAR2(32), 
	 CONSTRAINT "TEACHER_PK" PRIMARY KEY ("EMAIL") ENABLE
   )
/

CREATE TABLE  "PPP" 
   (	"ID" VARCHAR2(4000), 
	"DEPT" VARCHAR2(4000), 
	"COURSENO" VARCHAR2(4000), 
	"YEAR" VARCHAR2(4000), 
	"PIC" BLOB
   )
```
 

## Authors

* **Ratul Sikder** 

See also the list of [contributors](https://github.com/ratulsikder/Attendance_ClassAssessment_and_TeacherStudent_Collaboration_System/graphs/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* This web app is a project under LICT 260hr Java Training 2017, BSMRSTU, BD.
