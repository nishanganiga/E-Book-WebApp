package in.nishan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import in.nishan.entity.Cart;

public class CartDaoImpl implements CartDao {

	private Connection conn;

	public CartDaoImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {
		boolean flag = false;

		try {
			String sql = "INSERT INTO cart(`bid`, `uid`, `book_name`, `author`, `price`, `total`) VALUES (?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getBook_name());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotal());
			
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
	public List<Cart> getBookByUser(int uid) {
		
		List<Cart> list=new ArrayList<Cart>();
		Cart c=null;
		double total=0;
		
		try {
			String sql="SELECT * FROM cart WHERE uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				c=new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setBook_name(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				total=total+rs.getDouble(7);
				
				c.setTotal(total);
				
				list.add(c);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean deleteBook(int bid,int uid,int cid) {
		boolean flag=false;
		
		try {
			String sql="DELETE FROM cart WHERE bid=? and uid=? and cid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				flag=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

}
