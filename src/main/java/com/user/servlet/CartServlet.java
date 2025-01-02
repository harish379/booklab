package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDaoImpl;
import com.dao.CartDaoImpl;
import com.db.DBConnection;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int bid = Integer.parseInt(request.getParameter("bid"));

		int uid = Integer.parseInt(request.getParameter("uid"));

		BookDaoImpl dao = new BookDaoImpl(DBConnection.getConn());

		BookDtls b = dao.getBookById(bid);

		Cart c = new Cart();
		c.setBid(bid);
		c.setUserId(uid);
		c.setBookname(b.getBookName());
		c.setAuthor(b.getAuthor());
		c.setPrice(Double.parseDouble((b.getPrice())));

		c.setTotalPrice(Double.parseDouble((b.getPrice())));

		CartDaoImpl dao1 = new CartDaoImpl(DBConnection.getConn());

		boolean f = dao1.addCart(c);

		HttpSession session = request.getSession();

		if (f) {

			session.setAttribute("addCart", "Book added to cart successfully");

			response.sendRedirect("allnewbooks.jsp");
		} else {
			session.setAttribute("Failed", "Something went wrong");

			response.sendRedirect("allnewbooks.jsp");
		}
	}
}
