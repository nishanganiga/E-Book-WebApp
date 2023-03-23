<%@ page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Settings page</title>
<%@ include file="style/allCssJsp.jsp"%>
<style type="text/css">
a{
	text-decoration: none;
	color: black;
}
a:hover {
	text-decoration: none;
}
</style>

</head>
<body style="background-color: #eeeeee;">

	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp"/>
	</c:if>
	
	<%@ include file="style/navbar.jsp"%>
	
	
	<div class="container">
	
		<h3 class="text-center mt-3">Hello, ${userObj.name }</h3>
	
		<div class="row p-5">
			<div class="col-md-6">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-id-card fa-3x"></i>
							</div>
							<h3>Edit User Profile</h3>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-6">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div style="color:orange;">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h3>Order History</h3>
						</div>
					</div>
				</a>
			</div>
			
			
			</div>
			
			<div class="row p-5">
			
			<div class="col-md-6 offset-md-3">
				<a href="help_center.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-headset fa-3x"></i>
							</div>
							<h3>Help Center</h3>
						</div>
					</div>
				</a>
			</div>
			
		</div>
	</div>
	<div>
		<%@ include file="style/footer.jsp"%>
	</div>
</body>
</html>