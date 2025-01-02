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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			long phone = Long.parseLong(req.getParameter("pno"));
			String password = req.getParameter("password");

			// System.out.println(name+" "+ email+" "+phone+" "+password) ;
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhno(phone);
			user.setPassword(password);

			HttpSession session = req.getSession();

			UserDaoImpl dao = new UserDaoImpl(DBConnection.getConn());
			boolean reg = dao.userRegister(user);

			if (reg) {
				session.setAttribute("succ", "success");
				resp.sendRedirect("register.jsp");
				System.out.println("success");
			} else {
				System.out.println("failed");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
