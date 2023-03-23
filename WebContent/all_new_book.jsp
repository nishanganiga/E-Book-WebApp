<%@page import="in.nishan.entity.User"%>
<%@page import="in.nishan.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="in.nishan.dao.BookDaoImpl"%>
<%@page import="in.nishan.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All new books</title>
<%@ include file="style/allCssJsp.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #e8f5e9;
}

#toast {
	min-width: 300px;
	position: fixed;
	top: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
	t
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	top: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	top: 0;
	opacity: 0;
}
}
</style>
</head>
<body style="background-color: #eeeeee;">

	<% 
		User u=(User)session.getAttribute("userObj");
	
	%>

	<c:if test="${not empty addCart}">


		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
		</script>

		<c:remove var="addCart" scope="session" />

	</c:if>
	<%@ include file="style/navbar.jsp"%>

	<div class="container-fluid">
		<h3 class="text-center">New Book</h3>
		<div class="row p-3">

			<%
				Connection conn1 = DBConnect.getConn();
			BookDaoImpl dao1 = new BookDaoImpl(conn1);
			List<BookDtls> list1 = dao1.getAllNewBooks();

			for (BookDtls b : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p>
							<b><%=b.getBookName()%></b>
						</p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row p-2">
						
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
								
								
								<a href="" class="btn btn-light btn-sm ml-1">
								<i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
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