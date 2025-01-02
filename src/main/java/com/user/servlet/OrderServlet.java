package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookOrderImpl;
import com.dao.CartDaoImpl;
import com.db.DBConnection;
import com.entity.Book_Order;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");

			String fulladdress = address + ", " + landmark + ", " + city + ", " + state + ", " + pincode;

			CartDaoImpl dao = new CartDaoImpl(DBConnection.getConn());
			List<Cart> b = dao.getBookByUser(id);

			if (b.isEmpty()) {
				session.setAttribute("failedMsg", "Please add books to the cart");
				resp.sendRedirect("checkout.jsp");
			}

			else {

				BookOrderImpl dao2 = new BookOrderImpl(DBConnection.getConn());

				Book_Order o = new Book_Order();

				ArrayList<Book_Order> list = new ArrayList<>();

				Random r = new Random();

				for (Cart cart : b) {
					o.setorderId("BOOK-ORD-00" + r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phone);
					o.setFulladd(fulladdress);
					o.setPaymentType(paymentType);
					o.setBookName(cart.getBookname());
					o.setAuthor(cart.getAuthor());
					o.setPrice((cart.getPrice() + ""));

					list.add(o);

				}

				boolean f = dao2.saveOrder(list);

				if (f) {
					resp.sendRedirect("order_success.jsp");

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
