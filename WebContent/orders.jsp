<%@page import="in.nishan.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="in.nishan.db.DBConnect"%>
<%@page import="in.nishan.dao.BookOrderDaoImpl"%>
<%@page import="in.nishan.entity.User"%>
<%@ page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Orders page</title>
<%@ include file="style/allCssJsp.jsp"%>
</head>
<body style="background-color: #eeeeee;">
	<%@ include file="style/navbar.jsp"%>
	
	<c:if test="${ empty userObj }">
		<c:redirect url="login.jsp" />
	</c:if>
	
	<div class="container p-3">
		<h3 class="text-center mt-3">Order History</h3>
		<table class="table mt-3">
			  <thead class="thead-dark">
			    <tr>
			      <th scope="col">Order Id</th>
			      <th scope="col">Name</th>
			      <th scope="col">Book Name</th>
			      <th scope="col">Author</th>
			      <th scope="col">Price</th>
			      <th scope="col">Payment mode</th>
			    </tr>
			  </thead>
			  <tbody class="table-light">
			  
			  <%
			  	User u= (User)session.getAttribute("userObj");
			  	BookOrderDaoImpl dao=new BookOrderDaoImpl(DBConnect.getConn());
			  
			  	List<Book_Order> list=dao.getBook(u.getEmail());
			  	
			  	for(Book_Order b:list)
			  	{%>
			  		 <tr>
				      <th scope="row"><%=b.getOrder_id() %></th>
				      <td><%=b.getUser_name() %></td>
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
	</div>	
		
</body>
</html>