<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.StudentManagementApp.Utils.DatabaseUtil" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = "";
    String email = "";
    int age = 0;
    try (Connection connection = DatabaseUtil.getConnection()) {
        String sql = "SELECT * FROM students WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            name = resultSet.getString("name");
            email = resultSet.getString("email");
            age = resultSet.getInt("age");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 10px 0 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="email"], input[type="number"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            margin-top: 20px;
            padding: 10px;
            background-color: #5cb85c;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Student</h2>
        <form action="update" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= name %>" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= email %>" required>
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" value="<%= age %>" required>
            <input type="submit" value="Update Student">
        </form>
        <a class="back-link" href="list">Back to Student List</a>
    </div>
</body>
</html>
