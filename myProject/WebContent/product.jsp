<%@ page language="java" contentType="text/html;"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

	<c:set var="total" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="total" value="${total+1 }"></c:set>
	</c:forEach>

	<header>
		<h1>
			Web Final Project
		</h1>
		<nav>
			<ul>
				<li><a href="Controller?page=product">Shopping</a></li>
				<c:choose>
					<c:when test="${session == null}">
						<li><a href="Controller?page=login">Login</a></li>
						
					</c:when>
					<c:when test="${session != null}">
						<li><a href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
					</c:when>
				</c:choose>
				<li><a href="Controller?page=showcart">cart(<c:out value="${total} items"/> )</a></li>
			</ul>
		</nav>
	</header>
	
	
 	<div class="container">
 		<div class="row">
            <div class="col-md-8">
 					<h2 style="text-align: center; border-style: solid;">Online Shopping Market</h2><br>
 					<div class="list-group">
			
 					<c:forEach items="${list }" var="product">
		 					<div class="col-md-4">
		 						<img src="${product.getImage() }" class="img-responsive" ><br>
		 						<div class="text-center"><a style="color: black;"><c:out value="${product.getName() }"></c:out></a></div>	
		 						<p style="text-align: center;"> <c:out value="${ product.getPrice() }"></c:out> &#x20BA; </p>
		 						<div class="text-center">  <a class="btn btn-primary" href="Controller?page=addtocart&action=product&id=<c:out value="${product.getId()}"/>">Add to Cart</a> </div><br>
		 					</div>
 
 					</c:forEach>
 					
 				</div>
 			</div>
 		</div>
 	</div>
	
	
	<footer>
	<div class="footer"> &copy; 2021 Istanbul Aydin University Web Programming Final Project:
	      <a href="Controller?page=product"> 	made by Batuhan Satilmis And Enes Agir</a>
	    </div>
	</footer>
	
</body>
</html>