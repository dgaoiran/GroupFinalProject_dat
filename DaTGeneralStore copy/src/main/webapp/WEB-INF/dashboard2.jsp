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
	<title>Dashboard</title>
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
        <li><a href="/datclassifieds/sell">Sell Online</a></li>
	</ul>
	<ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
		<li><a href="/datclassifieds/logout"> Log Out</a></li>
	</ul>
    </div>
	</div>
</nav>

<div>
    <div class="container">    
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-sm-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading"></div>
                        <div class="panel-body"><img src="https://us.123rf.com/450wm/infadel/infadel1712/infadel171200119/91684826-a-black-linear-photo-camera-logo-like-no-image-available-.jpg?ver=6" class="img-responsive" style="width:400px; height:200px;" alt="Image"></div>
                        <div class="panel-footer" style="font-weight: bold;">Item: <c:out value="${product.title}"/></div>
                        <div class="panel-footer">Category: <c:out value="${product.category}"/></div>
                        <div class="panel-footer">Price: $<c:out value="${product.price}"/></div>
                        <div class="panel-footer">Description: <c:out value="${product.description}"/></div>
                        <div class="panel-footer">Posted by: <c:out value="${product.user.name}"/></div>
                        <div class="panel-footer" style="display: flex;">
                            <a href="/datclassifieds/view/${product.id}" class="btn btn-primary" style="font-size: 10.5px; margin-right:5px;">View</a>
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
            </c:forEach>
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


