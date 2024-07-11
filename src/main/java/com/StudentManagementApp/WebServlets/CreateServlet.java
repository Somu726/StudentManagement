package com.StudentManagementApp.WebServlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.StudentManagementApp.Model.Student;
import com.StudentManagementApp.Utils.DatabaseUtil;

@WebServlet("/create")
public class CreateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int age = Integer.parseInt(request.getParameter("age"));

        Student student = new Student();
        student.setName(name);
        student.setEmail(email);
        student.setAge(age);

        try (Connection connection = DatabaseUtil.getConnection()) {
            String sql = "INSERT INTO students (name, email, age) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, student.getName());
            statement.setString(2, student.getEmail());
            statement.setInt(3, student.getAge());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("list");
    }
}
