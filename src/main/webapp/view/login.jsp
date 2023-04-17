<%@ page language="java" contentType="text/html;"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>E-BANK - Sign In</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="stylesheet" href="${path}/css/main.css">
</head>

<body>
<div class="title">
	E-BANK
</div>
<header id="conteuner-1">

	<div class="img_main">
		<img src="${path}/images/Main Photo.png" alt="" class="img_main">
		<img src="${path}/images/Group-1.png" alt="" class="img_group">
		<img src="${path}/images/Group.png" alt="" class="img_group1">
		<img src="${path}/images/Vector.png" alt="" class="img_vector">
	</div>

	<div class="text_login">
		USER LOGIN
	</div>
	<div class="wrapper">
		<div class="formBlock">
			<form method="POST" action="${path}/user/login" >
				<c:if test="${error != null}">
					<div>
						<strong style="width:90%; margin: 0 auto;color: #623e5a;font-weight: 500;font-size: 18px; margin-bottom: 10px;  display:block"
						>${error}</strong>
					</div>
				</c:if>
				<c:if test="${message != null}">
					<div >
						<strong style="width:90%; margin: 0 auto;color: #623e5a;font-weight: 500;font-size: 18px; margin-bottom: 10px; display:block"
						>${message}</strong>
					</div>
				</c:if>
				<h1 class="h1">USER LOGIN</h1>
				<div class="inputt">
					<input class="input" name="username" type="text"
						   placeholder="Enter username">
				</div>

				<div class="inputt">
					<input class="input" type="password" name="password" required placeholder="Enter PASSWORD"
						   required>
				</div>
				<div class="inputt">
					<div class="input_text">

						No registered yet? SING UP
					</div>

				</div>
				<div class="inputr">
					<input class="div" type="submit" value="LOGIN">
				</div>
				<div class="inputt">
					<div class="input_text1">
						BANKING YOU WANT TO USE
					</div>

				</div>

			</form>

		</div>

		<div class="clearfix">

		</div>
	</div>
	</div>
	</div>
	</div>

</header>
<footer>
	<div class="img_footen">
		<a href="#">
			<img src="./img/facebook.svg" alt="" class="img_facebook">
		</a>
		<a href="#">
			<img src="./img/inst.svg" alt="" class="img_inst">
		</a>
		<a href="#">
			<img src="./img/youtube.svg" alt="" class="img_youtube">
		</a>
		<a href="#">
			<img src="./img/viber.svg" alt="" class="img_viber">
		</a>
		<a href="#">
			<img src="./img/telega.svg" alt="" class="img_telega">
		</a>

	</div>
	<div class="text_footer">
		"E-Bank", 2023. All rights reserved. CrEATEd by Bohdan Mamchur
	</div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>

</html>