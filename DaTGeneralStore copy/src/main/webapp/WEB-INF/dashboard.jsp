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
        <li class="active"><a href="/datclassifieds/sell">Sell Online</a></li>
	</ul>
	<ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
		<li><a href="/datclassifieds/logout"> Log Out</a></li>
	</ul>
    </div>
	</div>
</nav>

<div class="container">    
	<div class="row">
    <div class="col-sm-4">
	<div class="panel panel-primary">
        <div class="panel-heading">VROOOM VROOOM</div>
        <div class="panel-body"><a href="/datclassifieds/vroom"><img src="https://findmyscout.com/cms2014/assets/uploads/Road-Automobile-Car-Motor-Motorbike-Motorcycle-1284641.jpg" class="img-responsive" style="width:400px; height:200px;" alt="Image"></a></div>
        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
	</div>
    </div>
    <div class="col-sm-4"> 
	<div class="panel panel-danger">
        <div class="panel-heading">GOO GOO GAA GAA</div>
        <div class="panel-body"><a href="/datclassifieds/baby"><img src="https://c4.wallpaperflare.com/wallpaper/738/1004/957/the-boss-baby-4k-wallpaper-preview.jpg" class="img-responsive" style="width:400px; height:200px;" alt="Image"></a></div>
        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
	</div>
    </div>
    <div class="col-sm-4"> 
	<div class="panel panel-success">
        <div class="panel-heading">LOOK GOOD</div>
        <div class="panel-body"><a href="/datclassifieds/clothes"><img src="https://media.istockphoto.com/photos/mens-clothing-isolated-on-white-background-picture-id882851808?k=20&m=882851808&s=612x612&w=0&h=cWGr-HZLFkh3akozp03mkT036fkeuBPhV3uWihSsg_g=" class="img-responsive" style="width:400px; height:200px;" alt="Image"></a></div>
        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
	</div>
    </div>
	</div>
</div><br>

<div class="container">    
<div class="row">
    <div class="col-sm-4">
	<div class="panel panel-danger">
        <div class="panel-heading">BLING BLING</div>
        <div class="panel-body"><a href="/datclassifieds/bling"><img src="https://gemlightbox.sirv.com/WP_picupmedia.com/2018/01/How-to-photograph-earrings-in-5-simple-steps.jpg" class="img-responsive" style="width:400px; height:200px;" alt="Image"></a></div>
        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
	</div>
    </div>
    <div class="col-sm-4"> 
	<div class="panel panel-success">
        <div class="panel-heading">FIX STUFF</div>
        <div class="panel-body"><a href="/datclassifieds/tools"><img src="https://media.istockphoto.com/photos/antique-work-tools-in-a-toolbox-picture-id1210446226?k=20&m=1210446226&s=612x612&w=0&h=a2wxlizQjnr_x-KICpgMG_SVl9q-KWiYL5hKX8hvM7Y=" class="img-responsive" style="width:400px; height:200px;" alt="Image"></a></div>
        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
	</div>
    </div>
    <div class="col-sm-4"> 
	<div class="panel panel-primary">
        <div class="panel-heading">MISCELLANEOUS</div>
        <div class="panel-body"><a href="/datclassifieds/misc"><img src="https://www.junglescout.com/wp-content/uploads/2020/03/Screen-Shot-2020-03-25-at-12.13.01-PM.png" class="img-responsive" style="width:400px; height:200px;" alt="Image"></a></div>
        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
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


