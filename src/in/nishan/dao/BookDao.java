package in.nishan.dao;

import java.util.List;

import in.nishan.entity.BookDtls;

public interface BookDao {

	public boolean addBooks(BookDtls b);
	
	public List<BookDtls> getAllBooks();
	
	public BookDtls getBookById(int id);
	
	public boolean updateEditBooks(BookDtls b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDtls> getNewBook();
	
	public List<BookDtls> getRecentBooks();
	
	public List<BookDtls> getOldBooks();
	
	public List<BookDtls> getAllRecentBooks();

	public List<BookDtls> getAllNewBooks();
	
	public List<BookDtls> getAllOldBooks();
	
	public List<BookDtls> getBookBySearch(String ch);
	
}
