package in.nishan.dao;

import java.util.List;

import in.nishan.entity.Book_Order;

public interface BookOrderDao {

	public boolean saveOrder(List<Book_Order> b);
	
	public List<Book_Order> getBook(String email);
	
	public List<Book_Order> getAllOrders();
}
