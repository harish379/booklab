package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Order;

public class BookOrderImpl implements BookOrderDao {

	private Connection conn;

	public BookOrderImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public int getOrderNo() {
		int i = 0;
		try {
			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public boolean saveOrder(List<Book_Order> order) {
		boolean f = false;
		try {
			String sql = "INSERT INTO book_order(order_id, user_name, email, address, phone, book_name, author, price, payment) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (Book_Order b : order) {
				ps.setString(1, b.getorderId());
				ps.setString(2, b.getUsername());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladd());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getBookName());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.addBatch();

			}

			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Book_Order> getBook(String email) {
		List<Book_Order> list = new ArrayList<>();
		Book_Order b = null;

		try {

			String sql = "select * from book_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Book_Order();
				b.setId(rs.getInt(1));
				b.setorderId(rs.getString(2));
				b.setUsername(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFulladd(rs.getString(5));
				b.setPhno(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getString(9));
				b.setPaymentType(rs.getString(10));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Book_Order> getAllOrders() {

		List<Book_Order> list = new ArrayList<>();
		Book_Order b = null;
		try {

			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Book_Order();
				b.setId(rs.getInt(1));
				b.setorderId(rs.getString(2));
				b.setUsername(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFulladd(rs.getString(5));
				b.setPhno(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getString(9));
				b.setPaymentType(rs.getString(10));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

}
