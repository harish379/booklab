package com.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDaoImpl implements CartDao {
	private Connection conn;

	public CartDaoImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {

		boolean flag = false;

		try {
			String query = "insert into cart(bid,uid,bookName,author,price,totalPrice) values (?,?,?,?,?,?)";
			java.sql.PreparedStatement pst = this.conn.prepareStatement(query);
			pst.setInt(1, c.getBid());
			pst.setInt(2, c.getUserId());
			pst.setString(3, c.getBookname());
			pst.setString(4, c.getAuthor());
			pst.setDouble(5, c.getPrice());
			pst.setDouble(6, c.getTotalPrice());

			int i = pst.executeUpdate();
			if (i == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<Cart> getBookByUser(int id) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double totaPrice = 0;
		try {
			String query = "select * from cart where uid=?";
			java.sql.PreparedStatement pst = this.conn.prepareStatement(query);
			pst.setInt(1, id);
			java.sql.ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setBookname(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));

				totaPrice = totaPrice + rs.getDouble(7);
				c.setTotalPrice(totaPrice);

				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public boolean deleteBook(int bid, int uid, int cid) {
		boolean f = false;
		try {
			String query = "delete from cart where cid=? and uid=?";
			java.sql.PreparedStatement pst = this.conn.prepareStatement(query);
			pst.setInt(1, cid);
			pst.setInt(2, uid);
			int i = pst.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
