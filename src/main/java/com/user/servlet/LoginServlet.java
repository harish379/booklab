package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDaoImpl;
import com.db.DBConnection;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			UserDaoImpl dao = new UserDaoImpl(DBConnection.getConn());
			HttpSession session = req.getSession();

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			if ("admin379@gmail.com".equals(email) && "admin379".equals(password)) {
				User user = new User();
				user.setName("Admin");
				session.setAttribute("userObj", user);
				resp.sendRedirect("admin/adminhome.jsp");
			} else {
				User user = dao.login(email, password);
				if (user != null) {
					session.setAttribute("userObj", user);
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("msg", "Invalid Email or Password");
					resp.sendRedirect("login.jsp");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
