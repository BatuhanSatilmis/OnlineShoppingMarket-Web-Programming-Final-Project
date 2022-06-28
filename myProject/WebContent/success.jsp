<%@ page language="java" contentType="text/html;"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Succesfull Shopping</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>


	<header>
		<h1>
			Web Final Project
		</h1>
		<nav>
			<ul>
				<li><a href="Controller?page=product">Shopping</a></li>
				
				<c:choose>
	    			<c:when test="${session != null}">
						<li><a href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
					</c:when>
				</c:choose>
				
				
				<li><a href="Controller?page=showcart">cart(<c:out value="${total}"/>)</a></li>
			</ul>
		</nav>
	</header>
	
	<c:choose>
		<c:when test="${session == null}">
				<%
			    System.out.println("Please Login first");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				%>
		</c:when>
		
		<c:when test="${session != null}">
				
				
				<div class="container" style="margin-top: 60px;margin-bottom: 60px;">
					<h4>Thank you <font color="#6bb1f8"><c:out value="${username}"></c:out></font> for Shopping with us. We received your order and it will be delivered to <font color="#6bb1f8"><c:out value="${address }"></c:out></font> with in 4-5 working days.</h4>
					<br><br>
					<a href="Controller?page=product"><input type="button" value="Continue Shopping" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>
					
				</div>
			
		</c:when>
	
	</c:choose>
  
	<footer style="position: fixed;bottom: 0;left: 0;width: 100%;">
	<div class="footer"> &copy; 2021 Istanbul Aydin University Web Programming Final Project:
	      <a href="Controller?page=product"> 	made by Batuhan Satilmis And Enes Agir</a>
	    </div>
	</footer>
</body>
</html>