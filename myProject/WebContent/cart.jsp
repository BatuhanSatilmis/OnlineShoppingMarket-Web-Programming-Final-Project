<%@ page language="java" contentType="text/html;"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Cart</title>
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
						<li><a href="#">My Account(<c:out value="${username}"></c:out>)</a></li>
					</c:when>
				</c:choose>
				<li><a href="Controller?page=showcart">cart(<c:out value="${total} items"/>)</a></li>
			</ul>
		</nav>
	</header>
	
	<div class="container">
	
	<c:choose> 
		<c:when test="${total == 1}">
						<h4 style="margin-top: 40px;">My shopping bag(<c:out value="${total}"/> item)</h4>
		</c:when>
		<c:when test="${total > 1}">
						<h4 style="margin-top: 40px;">My shopping bag(<c:out value="${total}"/> items)</h4>
		</c:when>
		<c:otherwise >
				<h4 style="margin-top: 40px;">Your Shopping Bag is Empty</h4>
		</c:otherwise>
	
	</c:choose>
	<table >
		<tr>
			<th style="color:gray;">Item Name</th>
			<th style="color:gray;">Price</th>
			<th style="color:gray;">Category</th>
			<th style="color:gray;">Remove Item</th>
		</tr>
	</table>
	
		<c:set var="total" value="0"></c:set>
		<c:forEach items="${cartlist }" var="i">
			<c:forEach items="${list }" var="Product">
				<c:if test="${i == Product.getId() }">
			
				<c:set var="total" value="${total + Product.getPrice() }"></c:set>
				
			<table style="table-layout: fixed;width: 100%; ">
				<tr>
					<td style="width: 100px;"><img src="${Product.getImage()}" height="100" width="150" >  (<c:out value="${Product.getName()}"/>)</td>
					<td style="width: 50px;"><c:out value="${Product.getPrice()}"/></td>
					<td style="width: 100px;"><c:out value="${Product.getCategory()}"/></td>
					<td style="width: 100px;"><a href="Controller?page=remove&id=<c:out value="${Product.getId()}"/>"><span class="btn btn-danger">X</span></a></td>
				</tr>
			</table>
				</c:if>
			</c:forEach>
		</c:forEach>
	
	<h4 style="margin-top: 40px;margin-bottom: 40px;">Order Total:  (<c:out value="${ total}"></c:out>) &#x20BA; </h4>
	<a href="Controller?page=success"><input type="submit" value="Proceed to Checkout" class="btn btn-success" style="width:100%;padding:8px;font-size:16px;"></a><br>
	<a href="Controller?page=product"><input type="button" value="Continue Shopping" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>
	
	
	</div>

	<footer style="margin-top: 40px;">
		<div class="footer"> &copy; 2021 Istanbul Aydin University Web Programming Final Project:
	      <a href="Controller?page=product">made by Batuhan Satilmis And Enes Agir</a>
	    </div>
	</footer>

</body>
</html>