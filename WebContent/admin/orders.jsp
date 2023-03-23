<%@page import="in.nishan.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="in.nishan.db.DBConnect"%>
<%@page import="in.nishan.dao.BookOrderDaoImpl"%>
<%@ page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin: Orders</title>
<%@ include file="allCssJsp.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	
	<c:if test="${empty userObj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<h3 class="text-center">Hello Admin</h3>


	<table class="table table-hover">
		<thead class="bg-secondary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone.no</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
		<%
			BookOrderDaoImpl dao=new BookOrderDaoImpl(DBConnect.getConn());
			List<Book_Order> list=dao.getAllOrders();
			
			for(Book_Order b:list){
		%>		
			<tr>
				<th scope="row"><%=b.getOrder_id() %></th>
				<td><%=b.getUser_name() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFulladd() %></td>
				<td><%=b.getPhno() %></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPaymentType() %></td>

			</tr>
		<% 		
			}
		%>
			
		</tbody>
	</table>


</body>
</html>