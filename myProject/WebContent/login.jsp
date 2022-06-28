<%@ page language="java" contentType="text/html;"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Login page</title>
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
              <c:when test="${session == null}">
               <li><a href="Controller?page=login">Login</a></li>
                     </c:when>
         <c:when test="${session != null}"><li><a href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a href="#">My Account</a></li>
					</c:when>
				</c:choose>
				<li><a href="Controller?page=showcart">cart(<c:out value="${total}"/>)</a></li>
			</ul>
		</nav>
	</header>

	<div class="login-header">
	 	<h2>Login to Online Shopping Market</h2>
	</div>

	 <form method="post" action="Controller">
	 
	 <input type="hidden" name="page" value="login-form">
	 
	 	<!-- if username or pass false get invalid -->
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 
	 	<div class="login-group">
	 		<label>Username</label>
	 		<input type="text" name="username" placeholder="Your Username" value="<c:out value="${username }"></c:out>">
	 		<label>Password</label>
	 		<input type="password" name="password" placeholder="Enter password">
	 		<button type="submit" name="login" class="login-btn">Log in</button>
	 	</div>

	 </form>
	 
	<br><br><br>
	<footer style="position: fixed;bottom: 0;left: 0;width: 100%;">
	<div class="footer"> &copy; 2021 Istanbul Aydin University Web Programming Final Project:
	      <a href="Controller?page=product"> 	made by Batuhan Satilmis And Enes Agir</a>
	    </div>
	</footer>


</body>
</html>