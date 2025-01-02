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

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		long phone = Long.parseLong(req.getParameter("pno"));
		String password = req.getParameter("password");

		UserDaoImpl dao = new UserDaoImpl(DBConnection.getConn());
		HttpSession session = req.getSession();

		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setEmail(email);
		user.setPhno(phone);

		boolean f = dao.checkPassword(id, password);
		if (f) {
			boolean f2 = dao.updateProfile(user);
			if (f2) {
				session.setAttribute("succMsg", "user profile update success");
				resp.sendRedirect("edit_profile.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went wrong");
				resp.sendRedirect("edit_profile.jsp");
			}
		} else {
			session.setAttribute("succMsg", "password not matched");
			resp.sendRedirect("edit_profile.jsp");
		}

	}
}
