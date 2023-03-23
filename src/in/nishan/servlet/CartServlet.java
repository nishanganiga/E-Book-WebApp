package in.nishan.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.nishan.dao.BookDaoImpl;
import in.nishan.dao.CartDaoImpl;
import in.nishan.db.DBConnect;
import in.nishan.entity.BookDtls;
import in.nishan.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			int bid=Integer.parseInt(request.getParameter("bid"));
			int uid=Integer.parseInt( request.getParameter("uid"));
			
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
			BookDtls b = dao.getBookById(bid);
			
			Cart c=new Cart();
			
			c.setBid(bid);
			c.setUid(uid);
			c.setBook_name(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotal(Double.parseDouble(b.getPrice()));
			
			CartDaoImpl dao2=new CartDaoImpl(DBConnect.getConn());
			boolean flag = dao2.addCart(c);
			
			HttpSession session=request.getSession();
			
			if(flag) {
				
				session.setAttribute("addCart", "Added to cart");
				
				response.sendRedirect("all_new_book.jsp");
				
				
			}else {
				session.setAttribute("failed", "Failed Adding to cart");
				
				response.sendRedirect("all_new_book.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
