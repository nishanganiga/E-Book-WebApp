package in.nishan.admin;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import in.nishan.dao.BookDaoImpl;
import in.nishan.db.DBConnect;
import in.nishan.entity.BookDtls;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet{

	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String bookName=request.getParameter("bname");
			String author=request.getParameter("author");
			String price=request.getParameter("price");
			String categories=request.getParameter("categories");
			String status=request.getParameter("status");
			Part part=request.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			
			BookDtls b=new BookDtls(bookName,author,price,categories,status,fileName,"admin");
			//System.out.println(b);
			
			Connection conn = DBConnect.getConn();
			BookDaoImpl dao=new BookDaoImpl(conn);
			
			
			boolean flag = dao.addBooks(b);
			
			HttpSession session = request.getSession();
			
			if(flag) {
				
				String path = getServletContext().getRealPath("")+"book";
				
				File file=new File(path);
				part.write(path+File.separator+fileName);
				
				session.setAttribute("succMsg", "Book Added Successfully");
				response.sendRedirect("admin/add_books.jsp");
			}else{
				session.setAttribute("failMsg", "Some thing went wrong");
				response.sendRedirect("admin/add_books.jsp");				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

	
}
