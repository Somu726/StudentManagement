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

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int age = Integer.parseInt(request.getParameter("age"));

        Student student = new Student(id, name, email, age);

        try (Connection connection = DatabaseUtil.getConnection()) {
            String sql = "UPDATE students SET name = ?, email = ?, age = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, student.getName());
            statement.setString(2, student.getEmail());
            statement.setInt(3, student.getAge());
            statement.setInt(4, student.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("list");
    }
}
