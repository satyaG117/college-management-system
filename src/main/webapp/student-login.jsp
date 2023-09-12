<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student login</title>
<%@ include file="partials/bootstrap.jsp" %>
<link rel="stylesheet" href="styles/global.css"/>
<link rel="stylesheet" href="styles/login-forms.css">
</head>
<body>
	<%@ include file="partials/nav.jsp" %>
	<div class="container py-5 h-100">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col-12 col-md-8 col-lg-6 col-xl-5">
				<div class="card shadow-2-strong" style="border-radius: 1rem;">
					<div class="card-body p-5 text-center">

						<h3 class="mb-5">Student Login</h3>
						<form method="post" action="student-login">
							<div class="form-outline mb-4">
								<input type="email" placeholder="Email" id="typeEmailX-2"
									class="form-control form-control-lg" name="email"/>
							</div>

							<div class="form-outline mb-4">
								<input type="password" placeholder="Password"
									id="typePasswordX-2" class="form-control form-control-lg" name="password"/>
							</div>

							<button type="submit" class="btn btn-success btn-lg">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>