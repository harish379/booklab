package com.entity;

public class Book_Order {
	private int id;
	private String username;
	private String orderId;
	private String email;
	private String phno;
	private String fulladd;
	private String paymentType;
	private String bookName;
	private String author;
	private String price;

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookName() {
		return bookName;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getAuthor() {
		return author;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPrice() {
		return price;
	}

	public void setorderId(String orderId) {
		this.orderId = orderId;
	}

	public String getorderId() {
		return orderId;
	}

	public int getId() {
		return id;
	}

	public String getUsername() {
		return username;
	}

	public String getEmail() {
		return email;
	}

	public String getPhno() {
		return phno;
	}

	public String getFulladd() {
		return fulladd;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

}
