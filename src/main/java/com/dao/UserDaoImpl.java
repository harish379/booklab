package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDaoImpl implements UserDao {
	private Connection conn;

	public UserDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User user) {
		boolean flag = false;

		try {
			String sql = "insert into user(name,email,phone,password) values(?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setLong(3, user.getPhno());
			pst.setString(4, user.getPassword());

			int exec = pst.executeUpdate();

			if (exec == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public User login(String email, String password) {
		User user = null;

		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);

			ResultSet rst = pst.executeQuery();

			while (rst.next()) {
				user = new User();
				user.setId(rst.getInt(1));
				user.setName(rst.getString(2));
				user.setEmail(rst.getString(3));
				user.setPhno(rst.getLong(4));
				user.setPassword(rst.getString(5));
				user.setAddress(rst.getString(6));
				user.setLandmark(rst.getString(7));
				user.setCity(rst.getString(8));
				user.setState(rst.getString(9));
				user.setPincode(rst.getLong(10));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public boolean checkPassword(int id, String oldPassword) {

		boolean flag = false;

		try {
			String sql = "select * from user where id=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, oldPassword);

			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	@Override
	public boolean updateProfile(User user) {
		boolean flag = false;

		try {
			String sql = "update user set name=?,email=?,phone=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setLong(3, user.getPhno());
			pst.setInt(4, user.getId());

			int exec = pst.executeUpdate();

			if (exec == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

}
