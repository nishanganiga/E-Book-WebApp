<%@ page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
<%@ include file="allCssJsp.jsp" %>

<style type="text/css">
a{
	text-decoration: none;
	color: black;
}
a:hover {
	text-decoration: none;
	color: black;
}
.crd-ho:hover {
	background-color: #ce93d8;
	}
</style>

</head>
<body>
	<%@ include file="navbar.jsp" %>
	
	<c:if test="${empty userObj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<div class="container mt-3">
		<div class="row p-5">
		
			<div class="col-md-3">
				<a href="add_books.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-sharp fa-solid fa-square-plus fa-3x text-primary"></i><br>
						<h4>Add Book</h4>
						-------------
					</div>
				</div>
				</a>
			</div>
			
			<div class="col-md-3">
			<a href="all_books.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
						<h4>All Books</h4>
						-------------
					</div>
				</div>
			</a>
			</div>
			
			<div class="col-md-3">
			<a href="orders.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-sharp fa-solid fa-box-open fa-3x text-warning"></i><br>
						<h4>Orders</h4>
						-------------
					</div>
				</div>
			</a>
			</div>
			
			<div class="col-md-3">
				<a data-toggle="modal" data-target="#exampleModal">
					<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-arrow-right-from-bracket fa-3x text-secondary"></i><br>
						<h4>Logout</h4>
						-------------
					</div>
				</div>
				</a>
			</div>
			
		</div>
	</div>
	<!-- Log out Modal -->

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
				<h4>Do You Want To Logout</h4><br>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				<a href="../logout" type="button" class="btn btn-primary text-white">
					<i class="fa-solid fa-right-from-bracket"></i> Logout
				</a>
			</div>
			</div>
			<div class="modal-footer">
			
			</div>
		</div>
	</div>
</div>


<!-- Log out Modal End-->
</body>
</html>