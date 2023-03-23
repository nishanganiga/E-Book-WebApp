<%@ page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>order success</title>
<%@ include file="style/allCssJsp.jsp"%>
</head>
<body style="background-color: #eeeeee;">
	<%@ include file="style/navbar.jsp"%>

	<c:if test="${ empty userObj }">
		<c:redirect url="login.jsp" />
	</c:if>


	<div class="container text-center mt-5">
		<i class="fa-solid fa-circle-check fa-6x text-success"></i>
		<h1>Thank You For The Purchase</h1>
		<h2>Order placed successfully</h2>
		<h5>The order will be delivered within 14 Days to your address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Continue Shopping</a>
		<a href="orders.jsp" class="btn btn-dark text-white mt-3 ml-3">View Order</a>
	</div>

</body>
</html>