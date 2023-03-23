package in.nishan.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.nishan.dao.BookOrderDaoImpl;
import in.nishan.dao.CartDaoImpl;
import in.nishan.db.DBConnect;
import in.nishan.entity.Book_Order;
import in.nishan.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			
			int id=Integer.parseInt(request.getParameter("id"));
			
			String name=request.getParameter("userName");
			String email=request.getParameter("email");
			String phno=request.getParameter("phno");
			String address=request.getParameter("address");
			String landmark=request.getParameter("landmark");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			String pincode=request.getParameter("pincode");
			String paymentType=request.getParameter("paymentType");
			
			String fullAddress=address+", "+landmark+", "+city+", "+state+", "+pincode;
			
			//System.out.println(name+" "+email+" "+phno+" "+fullAddress+" "+paymentType);
			
			
			CartDaoImpl dao=new CartDaoImpl(DBConnect.getConn());
			
			List<Cart> list = dao.getBookByUser(id);
			
			if(list.isEmpty()) {
				session.setAttribute("failMsg", "Add Item to cart");
				response.sendRedirect("checkout.jsp");
				
			}else {

				BookOrderDaoImpl dao2=new BookOrderDaoImpl(DBConnect.getConn());
				
				Book_Order o=null;
				
				ArrayList<Book_Order> orderList=new ArrayList<Book_Order>();
				
				Random r=new Random();
				for(Cart c:list) {
					
					o=new Book_Order();
					
					o.setOrder_id("order-2023-id-0"+r.nextInt(1000000));
					o.setUser_name(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAddress);
					o.setBookName(c.getBook_name());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+".00");
					o.setPaymentType(paymentType);
					
					orderList.add(o);
				}
				
				
				if("noselect".equals(paymentType)) {
					session.setAttribute("failMsg", "Please select payment method");
					response.sendRedirect("checkout.jsp");
				}else {
					
					boolean flag = dao2.saveOrder(orderList);		
					
					if(flag) {
						response.sendRedirect("order_success.jsp");
					}else {
						session.setAttribute("failMsg", "Failed to place order !!");
						response.sendRedirect("checkout.jsp");
					}
					
				}
				
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
}
