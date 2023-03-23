package in.nishan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import in.nishan.entity.BookDtls;

public class BookDaoImpl implements BookDao {

	private Connection conn;
	
	
	public BookDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	@Override
	public boolean addBooks(BookDtls b) {
		
		boolean flag=false;
		try {
			String sql="INSERT INTO book_dtls(`bookname`, `author`, `price`, `bookCategory`, `status`, `photo`, `user_email`) VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getUser_email());
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				flag=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}


	@Override
	public List<BookDtls> getAllBooks() {

		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			String sql="SELECT * FROM book_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}


	@Override
	public BookDtls getBookById(int id) {
		BookDtls b=null;
		
		try {
			String sql="SELECT * FROM book_dtls WHERE bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}


	@Override
	public boolean updateEditBooks(BookDtls b) {
		boolean flag=false;
		
		try {
			String sql="UPDATE book_dtls SET bookname=?, author=?, price=?, status=? WHERE bookId=?";
				
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			
			int i = ps.executeUpdate();
			if(i==1) {
				flag=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}


	@Override
	public boolean deleteBooks(int id) {
		boolean flag=false;
		
		try {
			
			String sql="DELETE FROM book_dtls WHERE bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			
			if(i==1) {
				flag=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}


	@Override
	public List<BookDtls> getNewBook() {
		
		//	System.out.println("getNewBook method called");
		
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			String sql="SELECT * FROM book_dtls WHERE bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new BookDtls();
				
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<BookDtls> getRecentBooks() {
		//System.out.println("getRecentBooks method called");
		
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			String sql="SELECT * FROM book_dtls WHERE status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new BookDtls();
				
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<BookDtls> getOldBooks() {
//		System.out.println("getOldBooks method called");
		
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			String sql="SELECT * FROM book_dtls WHERE bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new BookDtls();
				
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<BookDtls> getAllRecentBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			String sql="SELECT * FROM book_dtls WHERE status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next() ) {
				b=new BookDtls();
				
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<BookDtls> getAllNewBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			String sql="SELECT * FROM book_dtls WHERE bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b=new BookDtls();
				
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<BookDtls> getAllOldBooks() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			String sql="SELECT * FROM book_dtls WHERE bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b=new BookDtls();
				
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<BookDtls> getBookBySearch(String ch) {

		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			String sql="SELECT * FROM book_dtls WHERE bookname like ? OR author like ? OR bookCategory like ? AND status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b=new BookDtls();
				
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
