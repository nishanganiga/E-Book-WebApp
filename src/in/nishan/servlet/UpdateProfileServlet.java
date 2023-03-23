package in.nishan.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.nishan.dao.UserDaoImpl;
import in.nishan.db.DBConnect;
import in.nishan.entity.User;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("fname");
			String email = request.getParameter("email");
			String phno = request.getParameter("phno");
			String password = request.getParameter("password");
			
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			
			HttpSession session = request.getSession();
			
			UserDaoImpl dao=new UserDaoImpl(DBConnect.getConn());
			
			boolean flag=dao.checkPassword(id, password);
			
			if(flag) {
				boolean flag2 = dao.updateProfile(us);
				if(flag2) {
					session.setAttribute("succMsg", "Updated successfully");
					response.sendRedirect("edit_profile.jsp");
				}else {
					session.setAttribute("succMsg", "Invalid Credintial");
					response.sendRedirect("edit_profile.jsp");
				}
			}else {
				session.setAttribute("failMsg", "Incorrect password");
				response.sendRedirect("edit_profile.jsp");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
