<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@ include file="partials/bootstrap.jsp"%>
<link rel="stylesheet" href="styles/global.css"/>
<link rel="stylesheet" href="styles/index.css">
</head>

<body>
	<%@ include file="partials/nav.jsp"%>
	<!-- Main image -->
	<div class="container-fluid main-img-container"></div>
	<!-- about section -->
	<div class="container text-center my-5 px-4" id="about-section">
		<h3>About us</h3>
		<hr>
		<p>Welcome to our University! We are a leading institution of
			higher education committed to providing students with an exceptional
			learning experience. Our campus is home to a diverse community of
			scholars and learners who are passionate about making a positive
			impact in the world. Our distinguished faculty members are experts in
			their fields and are dedicated to helping students achieve their
			academic and professional goals. Our programs and courses are
			designed to prepare students for successful careers and leadership
			roles in their chosen fields. We provide a rich array of resources
			and support services to help students thrive both inside and outside
			the classroom. At our University, we believe that education should be
			transformational and empowering, and we are committed to helping our
			students reach their full potential.</p>
	</div>

	<!-- cards -->
	<div class="container my-5 text-center" id="course-container">
		<h3>Our Courses</h3>
		<hr>
		<div class="row mb-2">
			<div class="col-md-6">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col-auto">
						<img
							src="https://images.unsplash.com/photo-1555066931-4365d14bab8c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
							class="card-img">
					</div>
					<div class="col p-4 d-flex flex-column position-static">
						<h3 class="mb-0">Computer Science and Engineering</h3>
						<div class="mb-1 text-body-secondary">B.TECH</div>
						<p class="card-text mb-auto">This is a wider card with
							supporting text below as a natural lead-in to additional content.</p>

					</div>

				</div>
			</div>
			<div class="col-md-6">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col-auto">
						<img
							src="https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZWxlY3Ryb25pY3N8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60"
							class="card-img">
					</div>
					<div class="col p-4 d-flex flex-column position-static">
						<h3 class="mb-0">Electrical and Electronics Engineering</h3>
						<div class="mb-1 text-body-secondary">B.TECH</div>
						<p class="mb-auto">This is a wider card with supporting text
							below as a natural lead-in to additional content.</p>
					</div>

				</div>
			</div>
		</div>
		<div class="row mb-2">
			<div class="col-md-6">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col-auto">
						<img
							src="https://images.unsplash.com/photo-1537462715879-360eeb61a0ad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bWVjaGFuaWNhbCUyMGVuZ2luZWVyaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
							class="card-img">
					</div>
					<div class="col p-4 d-flex flex-column position-static">
						<h3 class="mb-0">Mechanical Engineering</h3>
						<div class="mb-1 text-body-secondary">B.TECH</div>
						<p class="card-text mb-auto">This is a wider card with
							supporting text below as a natural lead-in to additional content.</p>

					</div>

				</div>
			</div>
			<div class="col-md-6">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col-auto">
						<img
							src="https://images.unsplash.com/photo-1487491424367-7571f9afbb30?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80"
							class="card-img">
					</div>
					<div class="col p-4 d-flex flex-column position-static">
						<h3 class="mb-0">Civil Engineering</h3>
						<div class="mb-1 text-body-secondary">B.TECH</div>
						<p class="mb-auto">This is a wider card with supporting text
							below as a natural lead-in to additional content.</p>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%@ include file="partials/footer.jsp"%>

</body>

</html>