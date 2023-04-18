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
	<title>E-Bank - Login</title>
	<link rel="stylesheet" href="${path}/css/style.css">
</head>

<body class="body_login">
<div class="wrapper">
	<header class="header">
		<div class="container">
			<div class="header__body">
				<a href="" class="header__logo">E-bank</a>
				</nav>
			</div>
		</div>
	</header>
	<main class="page">
		<div class="pattern-1">
			<img src="${path}/images/pattern1.png" alt="pattern1">
		</div>
		<div class="pattern-2">
			<img src="${path}/images/pattern2.png" alt="pattern2">
		</div>
		<div class="pattern-3">
			<img src="${path}/images/pattern3.png" alt="pattern3">
		</div>
		<div class="container container_login">
			<div class="login">
				<div class="login__image">
					<img src="${path}/images/login.png" alt="login">
				</div>
				<div class="login-block">
					<div class="login-block__inner">
						<div class="login-block__title form-title">
							User Login
						</div>
						<form method="POST" action="${path}/user/login" class="login-block__form form-page">
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
							<div class="login-block__inputs">
								<div class="login-block__username form-input">
									<input name="username" type="text" placeholder="Enter username">
									<span></span>
								</div>
								<div class="login-block__password form-input">
									<input name="password" type="password" placeholder="Enter PASSWORD">
									<span></span>
								</div>
								<a href="${path}/user/registration" class="login-block__register form-link">No registered yet? SING UP</a>
							</div>
							<button class="login-block__button form-button">LOGIN</button>
						</form>
						<div class="login-block__label form-label">
							Banking you want to use
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer class="footer">
		<div class="container container_footer">
			<div class="footer__inner">
				<ul class="footer__social">
					<li>
						<a href="#"><img src="${path}/images/facebook.svg" alt="facebook"></a>
					</li>
					<li><a href="#"><img src="${path}/images/inst.svg" alt="inst"></a></li>
					<li><a href="#"><img src="${path}/images/youtube.svg" alt="youtube"></a></li>
					<li><a href="#"><img src="${path}/images/viber.svg" alt="viber"></a></li>
					<li><a href="#"><img src="${path}/images/telega.svg" alt="telega"></a></li>
				</ul>
				<div class="footer__rights">
					"E-Bank", 2023. All rights reserved. CrEATEd by Bohdan Mamchur
				</div>
			</div>
		</div>
	</footer>
</div>
</body>

</html>