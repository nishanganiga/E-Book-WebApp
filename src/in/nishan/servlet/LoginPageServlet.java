package in.nishan.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.nishan.dao.UserDaoImpl;
import in.nishan.db.DBConnect;
import in.nishan.entity.User;

@WebServlet("/login1")
public class LoginPageServlet extends HttpServlet{

	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection conn = DBConnect.getConn();
		UserDaoImpl dao = new UserDaoImpl(conn);
		
		HttpSession session=request.getSession();
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			//System.out.println(email+" "+password);
			
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userObj", us);
				response.sendRedirect("admin/home.jsp");
			}else {
				User us = dao.login(email, password);
				if(us!=null) {
					session.setAttribute("userObj", us);
					response.sendRedirect("index.jsp");
				}else {
					session.setAttribute("failMsg", "email or password invalid");
					response.sendRedirect("login.jsp");
				}
				
			}
				
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

	
}
