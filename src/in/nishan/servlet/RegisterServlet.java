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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
   
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name=request.getParameter("fname");
			String email=request.getParameter("email");
			String phno=request.getParameter("phno");
			String password=request.getParameter("password");
			String check=request.getParameter("check");
			
		//	System.out.println("name:"+name+"\temail:"+email+"\tphno:"+phno+"\tpassword"+password+"\tcheck:"+check);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			System.out.println("Data set to us");
			
			HttpSession session = request.getSession();
			
			if(check!=null) {
				Connection con = DBConnect.getConn();
			//	System.out.println("connection created");
				
				UserDaoImpl dao = new UserDaoImpl(con);
				
				boolean flag2 = dao.checkUser(email);
				if(flag2) {
					
					boolean flag = dao.userRegister(us);
					
					//System.out.println(flag);
					
					if(flag) {
						//System.out.println("User Register Successful");
						session.setAttribute("succMsg", "Registration success");
						response.sendRedirect("register.jsp");
					}else {
						//System.out.println("Registration failed");
						session.setAttribute("failMsg", "Registration failed");
						response.sendRedirect("register.jsp");
					}
				}else {
					session.setAttribute("failMsg", "User alredy exits, Login or try with different email id");
					response.sendRedirect("register.jsp");
			
				}
				
				
			}else {
				session.setAttribute("failMsg", "accept the terms to proceed");
				response.sendRedirect("register.jsp");
			}
			

			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
