

<%@page import="in.nishan.entity.User"%>
<%@page import="in.nishan.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="in.nishan.dao.BookDaoImpl"%>
<%@page import="in.nishan.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Output</title>
<%@ include file="style/allCssJsp.jsp"%>

<style type="text/css">
.back-img {
	background: url("images/books.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

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
	<div class="container-fluid back-img">
		<br />
		<br />
		<marquee>
			<h2 style='color:#ffff00 ;text-shadow: 2px 2px #ff8f00 ;'>E-Book Management System</h2>
		</marquee>
	</div>


	

	<br />
	<hr>
	<!--     Recent book section start -->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
		
		<%
			Connection conn2= DBConnect.getConn();
			BookDaoImpl dao2=new BookDaoImpl(conn2);
			List<BookDtls> list2=dao2.getRecentBooks();
			
			for(BookDtls b:list2){
			%>
				<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto() %>"
							style="width: 200px; height: 250px;" class="img-thumblin">
						<p>
							<b><%=b.getBookName() %></b>
						</p>
						<p><%=b.getAuthor() %></p>
						<p>Categories:<%=b.getBookCategory() %></p>
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
						
								<a href="view_book.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm ml-2">View Details</a> <a href=""
								class="btn btn-light btn-sm ml-2"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
						</div>
					</div>
				</div>
			</div>
			<%	
			}
		%>

			
			
			<div class="text-center mt-2">
				<a href="all_recent_book.jsp" class="btn btn-dark btn-sm text-white">View All</a>
			</div>
		</div>
	</div>
	<!--     Recent book section has ended here -->


	<br />
	<hr>


	<!--     New book section start -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			
			
			<%
			Connection conn1=DBConnect.getConn();
			BookDaoImpl dao1=new BookDaoImpl(conn1);
			List<BookDtls> list1=dao1.getNewBook();
			
			for(BookDtls b:list1){
// 				System.out.println(b.getPhoto());
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 200px; height: 250px;" class="img-thumblin">
						<p>
							<b><%=b.getBookName() %></b>
						</p>
						<p><%=b.getAuthor() %></p>
						<p>Categories:<%=b.getBookCategory() %></p>
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
								
								<a href="view_book.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm ml-2">View Details</a> 
								
								<a href="" class="btn btn-light btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
				
			<div class="text-center mt-2">
				<a href="all_new_book.jsp" class="btn btn-dark btn-sm text-white">View All</a>
			</div>
		</div>
	</div>
	<!--     New book section has ended here -->

	<br />
	<hr>



	<!--     Old book section start -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">



			<%
			Connection conn3= DBConnect.getConn();
			BookDaoImpl dao3=new BookDaoImpl(conn3);
			List<BookDtls> list3=dao3.getOldBooks();
			
			for(BookDtls b:list3){
			%>
				<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto() %>"
							style="width: 200px; height: 250px;" class="img-thumblin">
						<p>
							<b><%=b.getBookName() %></b>
						</p>
						<p><%=b.getAuthor() %></p>
						<p>Categories:<%=b.getBookCategory() %></p>
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
						
						
							<a href="view_book.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-2">View Details</a> <a
								href="" class="btn btn-light btn-sm ml-2"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
						</div>
					</div>
				</div>
			</div>
			<%	
			}
		%>



			<div class="row">
			<div class="text-center mt-2">
				<a href="all_old_book.jsp" class="btn btn-dark btn-sm text-white">View All</a>
			</div>
			</div>
		</div>
	</div>
	<!--     old book section has ended here -->

	<!-- Footer -->
	<div>
		<%@ include file="style/footer.jsp"%>
	</div>
</body>
</html>
