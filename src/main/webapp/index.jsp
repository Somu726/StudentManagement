<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management</title>
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
        .link {
            display: block;
            text-align: center;
            margin: 20px 0;
            padding: 10px;
            background-color: #5cb85c;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        .link:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Student Management System</h2>
        <a class="link" href="list">View Students</a>
        <a class="link" href="add.jsp">Add Student</a>
    </div>
</body>
</html>
