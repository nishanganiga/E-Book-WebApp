package in.nishan.admin;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.nishan.dao.BookDaoImpl;
import in.nishan.db.DBConnect;
import in.nishan.entity.BookDtls;

@WebServlet("/editbooks")
public class EditBooks extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	Connection conn=null;

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			String bookName=request.getParameter("bname");
			String author=request.getParameter("author");
			String price=request.getParameter("price");
			String status=request.getParameter("status");
			
			
			BookDtls b = new BookDtls();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			
			conn=DBConnect.getConn();
			BookDaoImpl dao=new BookDaoImpl(conn);
			boolean flag = dao.updateEditBooks(b);
			
			HttpSession session = request.getSession();
			
			if(flag) {
				session.setAttribute("succMsg", "Book Updated Successfully");
				response.sendRedirect("admin/all_books.jsp");
			}else {
				session.setAttribute("failMsg", "Book Update Failed");
				response.sendRedirect("admin/all_books.jsp");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	
}
