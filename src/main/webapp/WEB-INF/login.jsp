<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<section class="h-100 gradient-form" style="background-color: #eee;">
		<div class="container py-5 h-100">
			<div class="row d-flex justify-content-center align-items-center h-100">
			<div class="col-xl-10">
				<div class="card rounded-3 text-black">
				<div class="row g-0">
					<div class="col-lg-6">
					<div class="card-body p-md-5 mx-md-4">
		
						<div class="text-center">
						<img src="https://smallbizclub.com/wp-content/uploads/2018/11/Potential-Risks-of-Online-Shopping.jpg"
							style="width: 185px;" alt="logo">
						<h4 class="mt-1 mb-5 pb-1">DaT Classiffieds</h4>
						</div>
		
						<div>
							<div>
								<h2>Login</h2>
							</div>
							<div>
								<form:form action="/datclassifieds/login/submit" method="post" modelAttribute="newLogin">
									<div class="form-group">
										<form:label path="email">Email:</form:label>
										<form:errors path="email" class="text-danger" />
										<form:input path="email" class="form-control"/>
									</div>
									<div class="form-group">
										<form:label path="password">Password:</form:label>
										<form:errors path="password" class="text-danger" />
										<form:input path="password" type="password" class="form-control"/>
									</div>
									<div>
										<input type="submit" class="btn btn-primary mt-3 mb-3" value="Login"/>
									</div>
									
								</form:form>
							</div>
						</div>
			
						<div class="d-flex align-items-center justify-content-center pb-4">
							<p class="mb-0 me-2">Don't have an account?</p>
							<a href="/datclassifieds/register" type="button" class="btn btn-outline-danger">Create new</a>
						</div>
		
					</div>
					</div>
					<div class="col-lg-6 d-flex align-items-center gradient-custom-2">
					<div class="text-white px-3 py-4 p-md-5 mx-md-4">
						<h4 class="mb-4">We are more than just a company</h4>
						<p class="small mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
						exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
					</div>
				</div>
				</div>
			</div>
			</div>
		</div>
		</section>
</body>
</html>