<%@page import="in.nishan.entity.User"%>
<%@page import="in.nishan.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="in.nishan.dao.BookDaoImpl"%>
<%@page import="in.nishan.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All old book</title>
<%@ include file="style/allCssJsp.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #e8f5e9;
}
</style>
</head>
<body style="background-color: #eeeeee;">

	<% 
		User u=(User)session.getAttribute("userObj");
	
	%>
	<%@ include file="style/navbar.jsp"%>

	<div class="container-fluid">
		<h3 class="text-center">Old Book</h3>
		<div class="row p-3">
			<%
				Connection conn3 = DBConnect.getConn();
			BookDaoImpl dao3 = new BookDaoImpl(conn3);
			List<BookDtls> list3 = dao3.getAllOldBooks();

			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3 ">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p>
							<b><%=b.getBookName()%></b>
						</p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
						
							<%
								if(u==null){
								%>	
									<a href="login.jsp" class="btn btn-danger btn-sm ml-4"><i
									class="fa-solid fa-cart-shopping"></i></a>
								<% 	
								}else{
								%>	
									<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-4"><i
									class="fa-solid fa-cart-shopping"></i></a>
								
								<% 	
								}
							%>
								
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-2">View Details</a>
								
								 <a href=""
								class="btn btn-light btn-sm ml-2"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>