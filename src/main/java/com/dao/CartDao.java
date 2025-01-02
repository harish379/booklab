package com.dao;

import java.util.List;

import com.entity.Cart;

public interface CartDao {

	public boolean addCart(Cart c);

	public List<Cart> getBookByUser(int id);

	public boolean deleteBook(int bid, int uid, int cid);
}