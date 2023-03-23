<%@page import="in.nishan.entity.BookDtls"%>
<%@page import="in.nishan.db.DBConnect"%>
<%@page import="in.nishan.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Book</title>
<%@ include file="style/allCssJsp.jsp"%>
</head>
<body style="background-color: #eeeeee;">
	<%@ include file="style/navbar.jsp"%>
	
	<%
		int bid=Integer.parseInt(request.getParameter("bid"));
		BookDaoImpl dao=new BookDaoImpl(DBConnect.getConn());
		BookDtls b=dao.getBookById(bid);
	%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhoto() %>" style='height: 200px; width: 150px;'><br>
				<h4 class="mt-3" style="color:#3d5afe;">Book Name : <span style="color:#ff5252;"><%=b.getBookName() %></span></h4>
				<h4 style="color:#3d5afe;">Author Name : <span style="color:#4527a0;"><%=b.getAuthor() %></span></h4>
				<h4 style="color:#3d5afe;">Category : <span style="color:#4527a0;"><%=b.getBookCategory() %></span></h4>
			</div>
			
			
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName() %></h2>
				
			<%
				if("Old".equals(b.getBookCategory())){
				%>
				<h4 style="color:#f50057;">Secondhand book, this book is already used by a previous owner. </h4>	
				<% 
				}else{
				%>	
				<h4 style="color:#00b8d4;">New book, from certified sellers.</h4>
				<% 
				}
			%>
				
				<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i>  Add to cart</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i>  <%=b.getPrice() %></a>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>