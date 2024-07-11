package com.StudentManagementApp.WebServlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.StudentManagementApp.Model.Student;
import com.StudentManagementApp.Utils.DatabaseUtil;
@WebServlet("/list")
public class ReadServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        List<Student> students = new ArrayList<>();

        try (Connection connection = DatabaseUtil.getConnection()) {
            String sql = "SELECT * FROM students";
            if (searchQuery != null && !searchQuery.isEmpty()) {
                sql += " WHERE name LIKE ? OR email LIKE ?";
            }

            PreparedStatement statement = connection.prepareStatement(sql);
            if (searchQuery != null && !searchQuery.isEmpty()) {
                statement.setString(1, "%" + searchQuery + "%");
                statement.setString(2, "%" + searchQuery + "%");
            }

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                int age = resultSet.getInt("age");
                students.add(new Student(id, name, email, age));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("students", students);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }
}

