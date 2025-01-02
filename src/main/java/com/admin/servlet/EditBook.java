package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDaoImpl;
import com.db.DBConnection;
import com.entity.BookDtls;

@WebServlet("/edit_books")
public class EditBook extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String bookName = request.getParameter("bookName");
			String author = request.getParameter("author");
			String price = request.getParameter("price");
			String bookCategory = request.getParameter("bookCategory");
			String status = request.getParameter("status");

			BookDtls bookDtls = new BookDtls();
			bookDtls.setBookId(id);
			bookDtls.setBookName(bookName);
			bookDtls.setAuthor(author);
			bookDtls.setPrice(price);
			bookDtls.setBookCategory(bookCategory);
			bookDtls.setStatus(status);

			BookDaoImpl bookDaoImpl = new BookDaoImpl(DBConnection.getConn());
			boolean f = bookDaoImpl.updateBook(bookDtls);

			HttpSession session = request.getSession();

			if (f) {
				session.setAttribute("succMsg", "Book Updated Successfully");
				response.sendRedirect("admin/all_books.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went wrong");
				response.sendRedirect("admin/all_books.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}