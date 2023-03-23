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

@WebServlet("/delete")
public class BooksDelete extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			
			Connection conn=DBConnect.getConn();
			BookDaoImpl dao=new BookDaoImpl(conn);
			
			boolean flag = dao.deleteBooks(id);
			HttpSession session = request.getSession();
			
			if(flag) {
				session.setAttribute("succMsg", "Book Deleted Successfully");
				response.sendRedirect("admin/all_books.jsp");
			}else {
				session.setAttribute("failMsg", "Book Deletetion Failed");
				response.sendRedirect("admin/all_books.jsp");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
