<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>View</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
	margin-bottom: 50px;
	border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
	.jumbotron {
	margin-bottom: 0;
    }

    /* Add a gray background color and some padding to the footer */
    footer {
	background-color: #f2f2f2;
	padding: 25px;
    }
	</style>
</head>
<body>

<div class="jumbotron">
	<div class="container text-center">
        <h1>DaT Classifieds</h1>      
    <p>Deals, Values & You</p>
	</div>
</div>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
    <div class="navbar-header">
	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
	</button>
	<a class="navbar-brand" href="#"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
	<ul class="nav navbar-nav">
        <li class="active"><a href="/datclassifieds/dashboard">Home</a></li>
        <li><a href="/datclassifieds/sell">Sell Online</a></li>
	</ul>
	<ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
		<li><a href="/datclassifieds/logout"> Log Out</a></li>
	</ul>
    </div>
	</div>
</nav>

<div class="container" style="display: flex; justify-content:center;">
    <div class="card mb-3">
        <img class="card-img-top" src="https://www.caspianpolicy.org/no-image.png" class="img-responsive" style="width:600px; height:400px;" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">Item: <c:out value="${product.title}"/></h5>
            <p class="card-text">Category: <c:out value="${product.category}"/></p>
            <p class="card-text">Price: <c:out value="${product.price}"/></p>
            <p class="card-text">Description: <c:out value="${product.description}"/></p>
            <div style="display: flex;">
                <a href="/datclassifieds/dashboard" class="btn btn-primary" style="font-size: 10.5px; margin-right:5px;">Back</a>
                <c:if test = "${product.user.id==user.id}">
                    <a href="/datclassifieds/edit/${product.id}" class="btn btn-success" style="font-size: 10.5px; margin-right:5px;">Edit</a> 
                    <form action="/datclassifieds/product/delete/${product.id}" method="post">
                        <input type="hidden" name="_method" value="delete">
                        <input type="submit" value="Delete" class="btn btn-danger" style="font-size: 10.5px; margin-right:5px;">
                    </form>
                </c:if>
            </div>
        </div>
    </div>
</div><br><br>


<footer class="container-fluid text-center">
	<p>Online Store Copyright</p>  
	<form class="form-inline">Get deals:
    <input type="email" class="form-control" size="50" placeholder="Email Address">
    <button type="button" class="btn btn-danger">Sign Up</button>
	</form>
</footer>

</body>
</html>


