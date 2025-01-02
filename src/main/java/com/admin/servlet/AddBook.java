package com.admin.servlet;

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
@WebServlet("/add_books")
public class AddBook extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {

		try {
			String bookName = request.getParameter("bookName");
			String author = request.getParameter("author");
			String price = request.getParameter("price");
			String bookCategory = request.getParameter("bookCategory");
			String status = request.getParameter("status");
			Part part = request.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			BookDtls bookDtls = new BookDtls(bookName, author, price, bookCategory, status, fileName,
					"admin379@gmail.com");

			BookDaoImpl bookDaoImpl = new BookDaoImpl(DBConnection.getConn());
			boolean f = bookDaoImpl.addBooks(bookDtls);

			HttpSession session = request.getSession();
			if (f) {
				String path = getServletContext().getRealPath("") + "books";
				System.out.println(path);
				File file = new File(path);
				part.write(path + File.separator + fileName);
				session.setAttribute("succMsg", "Book Added Successfully");
				response.sendRedirect("admin/add_books.jsp");

			} else {
				session.setAttribute("failedMsg", "Something went wrong");
				response.sendRedirect("admin/add_books.jsp");
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

	}
}
