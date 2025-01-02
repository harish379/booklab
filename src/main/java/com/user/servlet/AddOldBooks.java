package com.user.servlet;

import java.io.File;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.BookDaoImpl;
import com.db.DBConnection;
import com.entity.BookDtls;

@MultipartConfig
@WebServlet("/add_old_books")
public class AddOldBooks extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {

		try {
			String bookName = request.getParameter("bookName");
			String author = request.getParameter("author");
			String price = request.getParameter("price");
			String bookCategory = "New Book";
			String status = "Launched";
			Part part = request.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			String userEmail = request.getParameter("user");

			BookDtls bookDtls = new BookDtls(bookName, author, price, bookCategory, status, fileName, userEmail);

			BookDaoImpl bookDaoImpl = new BookDaoImpl(DBConnection.getConn());
			boolean f = bookDaoImpl.addBooks(bookDtls);

			HttpSession session = request.getSession();
			if (f) {
				String path = getServletContext().getRealPath("") + "books";
				System.out.println(path);
				File file = new File(path);
				part.write(path + File.separator + fileName);
				session.setAttribute("succMsg", "Book Added Successfully");
				response.sendRedirect("sellbooks.jsp");

			} else {
				session.setAttribute("failedMsg", "Something went wrong");
				response.sendRedirect("sellbooks.jsp");
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

	}
}