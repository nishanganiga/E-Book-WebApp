package in.nishan.dao;

import java.util.List;

import in.nishan.entity.Cart;

public interface CartDao {

	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(int uid);
	
	public boolean deleteBook(int bid,int uid,int cid);
	
	
}
