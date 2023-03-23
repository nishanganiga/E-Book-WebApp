<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Address page</title>
<%@ include file="style/allCssJsp.jsp"%>
</head>
<body style="background-color: #eeeeee;">
	<%@ include file="style/navbar.jsp"%>
		
	<div class="container">
		<div class="row p-4">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-4">
					<div class="card-body">
						<h3 class="text-center text-primary">Add Address</h3>
						<form action="">
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Landmark</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">State</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">Pin code</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="text-center mt-2">
								<button class="btn btn-warning"><b>Add address</b></button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


<!-- 	<div> -->
<%-- 		<%@ include file="style/footer.jsp"%> --%>
<!-- 	</div> -->
</body>
</html>