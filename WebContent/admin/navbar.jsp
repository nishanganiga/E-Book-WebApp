<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid"
	style="height: 15px; background-color: #00838f"></div>
<div class="container-fluid p-3" style="background-color: #e0f2f1;">
	<div class="row">
		<div class="col-md-3 text-danger"
			style="text-shadow: 2px 1px #ff8f00;">
			<h3>
				<i class="fa-brands fa-mandalorian fa-2x"></i> E-Book
			</h3>
		</div>
		

		<div class="col-md-3">
			<c:if test="${not empty userObj}">
				<a  class="btn btn-success text-white">${userObj.name }</a>
				<a data-toggle="modal" data-target="#exampleModal"
					class="btn btn-primary text-white">Logout</a>
			</c:if>
			<c:if test="${empty userObj }">
				<a href="../login.jsp" class="btn btn-success">login</a>
				<a href="../register.jsp" class="btn btn-primary">Register</a>
			</c:if>
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

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="home.jsp"><i
		class="fa-solid fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
	</div>
</nav>