
<%@ page import="java.util.List" %>
<%@ page import="com.StudentManagementApp.Model.Student" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .search-bar {
            margin-bottom: 20px;
            text-align: center;
        }
        .search-bar input[type="text"] {
            padding: 10px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .search-bar input[type="submit"] {
            padding: 10px 15px;
            background-color: #5cb85c;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .search-bar input[type="submit"]:hover {
            background-color: #4cae4c;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 15px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .actions a {
            text-decoration: none;
            color: #337ab7;
            margin: 0 5px;
        }
        .actions a:hover {
            text-decoration: underline;
        }
        .add-new {
            display: block;
            width: 150px;
            margin: 0 auto;
            padding: 10px;
            text-align: center;
            background-color: #5cb85c;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        .add-new:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Student List</h2>
        <div class="search-bar">
            <form action="list" method="get">
                <input type="text" name="search" placeholder="Search by name or email">
                <input type="submit" value="Search">
            </form>
        </div>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Age</th>
                <th>Actions</th>
            </tr>
            <% 
                List<Student> students = (List<Student>) request.getAttribute("students");
                if (students != null) {
                    for (Student student : students) {
            %>
            <tr>
                <td><%= student.getId() %></td>
                <td><%= student.getName() %></td>
                <td><%= student.getEmail() %></td>
                <td><%= student.getAge() %></td>
                <td class="actions">
                    <a href="update.jsp?id=<%= student.getId() %>">Update</a>
                    <a href="delete?id=<%= student.getId() %>">Delete</a>
                </td>
            </tr>
            <% 
                    }
                }
            %>
        </table>
        <a class="add-new" href="add.jsp">Add New Student</a>
    </div>
</body>
</html>
