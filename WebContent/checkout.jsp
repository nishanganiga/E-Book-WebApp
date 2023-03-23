<%@page import="java.util.List"%>
<%@page import="in.nishan.entity.Cart"%>
<%@page import="in.nishan.entity.User"%>
<%@page import="in.nishan.db.DBConnect"%>
<%@page import="in.nishan.dao.CartDaoImpl"%>
<%@ page isELIgnored="false" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>cart page</title>
<%@ include file="style/allCssJsp.jsp"%>
</head>
<body style="background-color: #eeeeee;">
	<%@ include file="style/navbar.jsp"%>

	<c:if test="${ empty userObj }">
		<c:redirect url="login.jsp" />
	</c:if>


	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center" role="alert">${succMsg}
			<c:remove var="succMsg" scope="session" />
		</div>
	</c:if>

	<c:if test="${not empty failMsg}">
		<div class="alert alert-danger text-center" role="alert">${failMsg }
			<c:remove var="failMsg" scope="session" />
		</div>

	</c:if>


	<div class="container">
		<div class="row p-2">

			<div class="col-md-6">
				<div class="card bg-light">
					<div class="card-body">
						<h4 class="text-center mt-3 px-2" style="color: #1a237e;">Items
							in cart</h4>
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>

							<tbody>

								<%
									User u = (User) session.getAttribute("userObj");

								CartDaoImpl dao = new CartDaoImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double total = null;

								for (Cart c : cart) {
									total = c.getTotal();
								%>

								<tr>
									<th scope="row"><%=c.getBook_name()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&uid=<%=c.getUid()%>&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a> 
										
<!-- 										<a href="" 	class="btn btn-sm btn-danger"></a></td> -->
									
								</tr>


								<%
									}
								%>
								<tr>
									<th>Total Price</th>
									<td></td>
									<td></td>
									<th>Rs.<%=total%></th>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">

					<div class="card-body">


						<h4 class="text-center mt-3" style="color: #1a237e;">Order
							Details</h4>
						<form action="order" method="post">
						<input type="hidden" value=${userObj.id } name="id">
						
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text" name="userName"
										class="form-control" id="inputEmail4" value="${userObj.name }" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email" name="email"
										class="form-control" id="inputPassword4"
										value="${userObj.email }" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone.no</label> <input type="number" name="phno"
										class="form-control" id="inputEmail4" value="${userObj.phno }" required="required">

								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text" name="address"
										class="form-control" id="inputPassword4" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text" name="landmark"
										class="form-control" id="inputEmail4" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text" name="city"
										class="form-control" id="inputPassword4" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text" name="state"
										class="form-control" id="inputEmail4" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin code</label> <input type="text" name="pincode"
										class="form-control" id="inputPassword4" required="required">
								</div>
							</div>

							<div class="form-group">
								<label>Payment mode</label> <select class="form-control" name="paymentType">
									<option value="noselect">----Select----</option>
									<option value="COD" >Cash on delivery</option>

								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-primary btn-lg ">Order Now</button>
								<a href="index.jsp" class="btn btn-success btn-lg">Continue Shopping</a>
								

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