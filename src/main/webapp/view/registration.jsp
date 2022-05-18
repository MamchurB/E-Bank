<%@ page language="java" contentType="text/html;"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <title>BusyMan - Sign Up</title>
    <link rel="stylesheet" href="${path}/css/style.css">
</head>
<body>
<div class="wrapper">
    <header class="header">
        <div class="container">
            <div class="header__body">
                <a href="${path}" class="header__logo">Busy Man</a>
                <div class="header__burger">
                    <span></span>
                </div>
            </div>
        </div>
    </header>
    <main class="page">
        <div class="container">
            <div class="cover__row">
                <div class="cover__column cover__column_image cover__column_image-register">
                    <div class="cover__image">
                        <img src="${path}/images/main.png" alt="ToDoGuy">
                    </div>
                </div>
                <div class="cover__column cover__column_input cover__column_input-register">
                    <div class="cover__login-form login-form register-form">
                        <div class="login-form__header">
                            Register a new account
                        </div>
                        <div class="login-form__bottom register-form__bottom">
                        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                        <form:form method="POST" modelAttribute="userForm">
                            <form  method="POST" action="${path}/user/registration">
                                <div>
                                    <strong style = "width:90%;margin: 0 auto;color: #623e5a;font-weight: 500;font-size: 14px;margin-bottom: 5px;display:block;">
                                    <form:errors path="fullName"></form:errors>
                                        ${userFullNameError}
                                    </strong>
                                </div>
                                <div class="login-form__input input">

                            <form:input type="text" path="fullName" placeholder="Enter fullname"
                                        autofocus="true"></form:input>
                                </div>
                                <strong style = "width:90%;margin: 0 auto;color: #623e5a;font-weight: 500;font-size: 14px;margin-bottom: 5px;display:block;">
                                    <form:errors path="userName"></form:errors>
                                        ${userError}
                                </strong>
                                <div class="login-form__input input">
                            <form:input type="text" path="userName" placeholder="User Name"
                                        autofocus="true"></form:input>
                                </div>
                                <strong style = "width:90%;margin: 0 auto;color: #623e5a;font-weight: 500;font-size: 14px;margin-bottom: 5px;display:block;">
                                    <form:errors path="email"></form:errors>
                                        ${userEmailError}
                                </strong>
                                <div class="login-form__input input">
                            <form:input type="email" path="email" placeholder="Email"
                                        autofocus="true"></form:input>
                                </div>
                                <strong style = "width:90%;margin: 0 auto;color: #623e5a;font-weight: 500;font-size: 14px;margin-bottom: 5px;display:block;">
                                    <form:errors path="mobile"></form:errors>
                                        ${userMobileError}
                                </strong>
                                <div class="login-form__input input">
                            <form:input type="number" path="mobile" placeholder="Mobile"
                                        autofocus="true"></form:input>
                                </div>

                                <div class="login-form__input input">
                            <form:input type="password" path="password" placeholder="Password"
                                        autofocus="true"></form:input>

                                </div>
                                <strong style = "width:90%;margin: 0 auto;color: #623e5a;font-weight: 500;font-size: 14px;margin-bottom: 5px;display:block;">
                                    <form:errors path="password"></form:errors>
                                        ${passwordError}
                                </strong>

                                <div class="login-form__input input">
                            <form:input type="password" path="passwordConfirm" placeholder="repeat PASSWORD"
                                        autofocus="true"></form:input>

                                </div>
                                <div class="login-form__line">
                                    <button class="login-form__button button" type="submit">Register</button>
                                </div>
                            </form>
                        </form:form>
                            <div class="login-form__text"><a href="${path}/user/login">Do you have an account? SIGN IN</a></div>
                        </div>
                        <span class="login-form__label register-form__label">YOUR PERSONAL TO DO LIST!<br>BE
                        PRODUCTIVE!</span>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <footer class="footer">
        <div class="container container_footer">
            <div class="footer__social-wrapper">
                <div class="footer__social">
                    <div class="footer__facebook"><a href="#"><img src="${path}/images/facebook.svg" alt="facebook"></a></div>
                    <div class="footer__inst"><a href="#"><img src="${path}/images/inst.svg" alt="inst"></a> </div>
                    <div class="footer__youtube"><a href="#"><img src="${path}/images/youtube.svg" alt="youtube"></a></div>
                    <div class="footer__viber"><a href="#"><img src="${path}/images/viber.svg" alt="viber"></a></div>
                    <div class="footer__telegram"><a href="#"><img src="${path}/images/telega.svg" alt="telega"></a></div>
                </div>
            </div>
            <div class="footer__corp">
                "Busy Man", 2022. All rights reserved. CrEATEd by Mamchur, Zyzen and TYMCHENKO
            </div>
        </div>
    </footer>
</div>
<script src="${path}/js/auto_margin.js"></script>
</body>
</html>
