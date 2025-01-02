package com.dao;

import java.util.List;

import com.entity.BookDtls;

public interface BookDao {

	public boolean addBooks(BookDtls b);

	public List<BookDtls> getAllBooks();

	public BookDtls getBookById(int id);

	public boolean updateBook(BookDtls b);

	public boolean deleteBook(int id);

	public List<BookDtls> getBookByNew();

	public List<BookDtls> getBookByTop();

	public List<BookDtls> getBookByOutOfStock();

	public List<BookDtls> getallrecentBooks();

	public List<BookDtls> getalltopSellingBooks();

	public List<BookDtls> getalloldBooks();

}