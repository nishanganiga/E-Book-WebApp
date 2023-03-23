<%@ page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>edit profile</title>
<%@ include file="style/allCssJsp.jsp"%>
</head>
<body style="background-color: #eeeeee;">
	<%@ include file="style/navbar.jsp"%>
	
	<c:if test="${ empty userObj }">
		<c:redirect url="login.jsp" />
	</c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
					<h3 class="text-center text-primary">Edit Profile</h3>
					
					
					
					<c:if test="${not empty succMsg }">
							<h5 class="text-center text-success">${succMsg }</h5>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failMsg }">
							<h5 class="text-center text-danger">${failMsg }</h5>
							<c:remove var="failMsg" scope="session"/>
						</c:if>
					
					
						<form action="update_profile" method="post">
						
						<input type="hidden" value="${userObj.id}" name="id" >
							<div class="form-group">
								<label for="exampleInputEmail1">Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname" value="${userObj.name }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email" value="${userObj.email }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone.no</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno" value="${userObj.phno }">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password" ">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div>
		<%@ include file="style/footer.jsp"%>
	</div>
</body>
</html>