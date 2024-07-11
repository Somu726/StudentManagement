
# Student Management System

This is a Java EE web application that performs CRUD (Create, Read, Update, Delete) operations on a database table using JDBC, Servlets, and JSP. The application manages student records in a student_db database.





## Project structure
```bash
 StudentManagementApp/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── StudentManagementApp/
│       │           ├── Utils/
│       │           │   └── DatabaseUtil.java
│       │           ├── Servlets/
│       │           │   ├── CreateServlet.java
│       │           │   ├── ReadServlet.java
│       │           │   ├── UpdateServlet.java
│       │           │   └── DeleteServlet.java
│       │           └── Models/
│       │               └── Student.java
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml
│           ├── index.jsp
│           ├── add.jsp
│           ├── list.jsp
│           └── update.jsp
└── README.md

```


## Requirements


- Java Development Kit (JDK) 8 or higher
- Apache Tomcat 9.0 or higher
- MySQL database

## Database Setup


- Create a database named student_db.
- Create a database named student_db.

Sql
```sql
  CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(50),
    age INT
);

```
## Deployment

Update the database connection details in DatabaseUtil.java:

java
```java
private static final String URL = "jdbc:mysql://localhost:3306/student_db";
private static final String USER = "your_username";
private static final String PASSWORD = "your_password";

```


## Setup Instructions

1. Clone the repository:

```bash
  git clone https://github.com/yourusername/StudentManagementApp.git

```
2. Open the project in your IDE (Eclipse or IntelliJ IDEA).

3. Add the necessary JAR files for JDBC and Servlets to the project's build path.

4. Configure Tomcat in your IDE and deploy the project.


5. Access the application at http://localhost:8080/StudentManagementApp.
    
## Functionality

- Create: Add a new student record using the add.jsp form.
- Read: View the list of all students in the list.jsp page.
- Update: Update an existing student record using the update.jsp form.
- Delete: Delete a student record from the list in list.jsp.


##  Servlets

- CreateServlet: Handles the creation of new student records.
- ReadServlet: Retrieves and displays the list of students.
- UpdateServlet: Handles the updating of existing student records.
- DeleteServlet: Handles the deletion of student records.
##  Jsp Pages

- index.jsp: Home page with links to the list of students and add student form.
- add.jsp: Form to add a new student.
- list.jsp: Displays the list of students with options to update or delete each record.
- update.jsp: Form to update an existing student's details.
##  Deployment

- Ensure MySQL is running and the student_db database is created.
- Deploy the application on Tomcat.
- Navigate to http://localhost:8080/StudentManagementApp to access the application.
## TroubleShooting
- Ensure the database connection details are correct in DatabaseUtil.java.
- Verify Tomcat is running on the specified port (default is 8080).
- Check the Tomcat logs for any errors during deployment.


Feel free to adjust any part of the description to better fit your project specifics or personal preferences.
