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
	<title>Sell</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
    .navbar {
	margin-bottom: 50px;
	border-radius: 0;
    }
    
	.jumbotron {
	margin-bottom: 0;
    }

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
	</ul>
	<ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
		<li><a href="/datclassifieds/logout"> Log Out</a></li>
	</ul>
    </div>
	</div>
</nav>

<div style="padding:20px ;">
    <form:form action="/datclassifieds/sell/submit" method="post" modelAttribute="newProduct">
        <div class="form-group">
            <form:label path="category">Categories</form:label>
            <form:select path="category" class="form-control">
                <option>Auto and Motorcycle</option>
                <option>Baby Stuff</option>
                <option>Clothes</option>
                <option>Jewelry and Accessories</option>
                <option>Tools</option>
                <option>Miscellaneous</option>
            </form:select>
        </div>
        <div class="form-group">
            <form:label path="title">Product Name:</form:label>
            <form:errors path="title" class="text-danger" />
            <form:input path="title" class="form-control"/>
        </div>
        <div class="form-group">
            <form:label path="description">Description:</form:label>
            <form:errors path="description" class="text-danger" />
            <form:input path="description" class="form-control"/>
        </div>
        <div class="form-group">
            <form:label path="price">Price:</form:label>
            <form:errors path="price" class="text-danger" />
            <form:input path="price" class="form-control"/>
        </div>
        <div class="form-row">
            <form:errors path="user" class="text-danger"/>
            <form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
        </div>
        <div>
            <a href="/datclassifieds/dashboard" class="btn btn-danger" style="font-size: 10.5px; margin-right:5px;">Cancel</a>
            <input type="submit" class="btn btn-primary" style="font-size: 10.5px; margin-right:5px;" value="Create" />
        </div>
    </form:form>
</div>



<footer class="container-fluid text-center">
	<p>Online Store Copyright</p>  
	<form class="form-inline">Get deals:
    <input type="email" class="form-control" size="50" placeholder="Email Address">
    <button type="button" class="btn btn-danger">Sign Up</button>
	</form>
</footer>

</body>
</html>


