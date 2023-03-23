<%@page import="in.nishan.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="in.nishan.db.DBConnect"%>
<%@page import="in.nishan.dao.BookDaoImpl"%>
<%@ page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin: All Books</title>
<%@ include file="allCssJsp.jsp" %>
</head>
<body>
	<%@ include file="navbar.jsp" %>
	
	<c:if test="${empty userObj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<h3 class="text-center">Hello Admin</h3>
	<br>
	<c:if test="${not empty succMsg }">
							<h5 class="text-center text-success">${succMsg }</h5>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty failMsg }">
							<h5 class="text-center text-danger">${failMsg }</h5>
							<c:remove var="failMsg" scope="session"/>
						</c:if>
	
	
	<table class="table table-hover">
  <thead class="bg-secondary text-white">
    <tr>
   	  <th scope="col">Id</th>
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author Name</th>
      <th scope="col">Price</th>
      <th scope="col">Category</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  	Connection conn=DBConnect.getConn();
  	BookDaoImpl dao=new BookDaoImpl(conn);
  	
  	List<BookDtls> list=dao.getAllBooks();
  	for(BookDtls b:list){
  		%>
  		<tr>
      <td><%=b.getBookId() %></td>
      <td><img src="../book/<%=b.getPhoto() %>" style="width: 50px; height: 50px;"></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory() %></td>
      <td><%=b.getStatus() %></td>
      <td>
      	<a href="edit_books.jsp?id=<%=b.getBookId() %>" class="btn  btn-primary"><i class="fa-solid fa-pen-to-square"></i> </a>
      	<a href="../delete?id=<%=b.getBookId() %>" class="btn  btn-danger"><i class="fa-solid fa-trash"></i> </a>
      </td>
    </tr>
  <% 	
  	}
  %>
    
   
  </tbody>
</table>
	
	
</body>
</html>