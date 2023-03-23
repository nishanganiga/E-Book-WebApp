
<%@ page language="java" isELIgnored="false" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-fluid"
	style="height: 15px; background-color: #00838f"></div>
<div class="container-fluid p-3" style="background-color: #e0f2f1;">
	<div class="row">
		<div class="col-md-3 text-danger" style="text-shadow: 2px 1px #ff8f00 ;">
			<h3>
				<i class="fa-brands fa-mandalorian fa-2x"></i> E-Book
			</h3>
		</div>
		
		<nav class="navbar navbar-light" style="background-color: #e0f2f1;">
		  <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
		    <input class="form-control mr-sm-2" type="search" name="ch" placeholder="Type to Search" aria-label="Search" >
		    <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
		  </form>
		</nav>
		
		<c:if test="${not empty userObj}">
			<div class="col-md-3 my-2 my-lg-0 p-2 offset-md-3">
				
				
				<button type="button" disabled="disabled" class="btn btn-outline-dark" style="color: #dd2c00  ; background-color: #f4ff81  ;"><i class="fa-solid fa-user "></i><b> ${userObj.name }</b></button>
				
				<a href="logout" class="btn btn-danger ml-4"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
			</div>
		</c:if>
		
		<c:if test="${empty userObj }">
			<div class="col-md-3 my-2 my-lg-0 p-2 offset-md-3">
								
				<a href="login.jsp" class="btn btn-success">login</a> 
				
				<a href="register.jsp" class="btn btn-primary ml-4">Register</a>
			</div>
		</c:if>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"> Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="all_recent_book.jsp"><i
					class="fa-solid fa-book-open"></i>Recent</a></li>
			<li class="nav-item active"><a class="nav-link disabled"
				href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i> New Book</a>
			<li class="nav-item active"><a class="nav-link disabled"
				href="all_old_book.jsp"><i class="fa-solid fa-book-open"></i> Old Book</a></li>
				
<!-- 			<li class="nav-item active" style="background:#009688; border-radius: 15px;"><a class="nav-link disabled" -->
<!-- 				href="checkout.jsp"><i class="fa-solid fa-cart-shopping "></i> To Cart</a></li>	 -->
				
				
			<form class="form-inline my-2 my-lg-0 ml-4">
				<a href="checkout.jsp" class="btn btn-outline-light my-2 my-sm-0 " style="background:#009688; border-radius: 10px;" type="submit">
					<i class="fa-solid fa-cart-shopping "></i> To Cart</a>
			</form>	
				
				
		</ul>
		<form class="form-inline my-2 my-lg-0 p-2 ">
			<a href="setting.jsp" class="btn btn-outline-light my-2 my-sm-0 " style="background:#009688; border-radius: 10px;" type="submit">
				<i class="fa-solid fa-gear"></i> Settings
			</a>
			<a href="#" class="btn btn-outline-light my-2 my-sm-0 ml-2" style="background:#009688; border-radius: 10px;" type="submit">
				<i class="fa-solid fa-headset"></i> Help
			</a>
		</form>


		<!-- 			<li class="nav-item dropdown"><a -->
		<!-- 				class="nav-link dropdown-toggle" href="#" id="navbarDropdown" -->
		<!-- 				role="button" data-toggle="dropdown" aria-haspopup="true" -->
		<!-- 				aria-expanded="false"> Dropdown </a> -->
		<!-- 				<div class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
		<!-- 					<a class="dropdown-item" href="#">Action</a> <a -->
		<!-- 						class="dropdown-item" href="#">Another action</a> -->
		<!-- 					<div class="dropdown-divider"></div> -->
		<!-- 					<a class="dropdown-item" href="#">Something else here</a> -->
		<!-- 				</div></li> -->
		<!-- 		<form class="form-inline my-2 my-lg-0"> -->
		<!-- 			<input class="form-control mr-sm-2" type="search" -->
		<!-- 				placeholder="Search" aria-label="Search"> -->
		<!-- 			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
		<!-- 		</form> -->


	</div>
</nav>