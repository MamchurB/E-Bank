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
   <title>E-Bank - Register</title>
   <link rel="stylesheet" href="${path}/css/style.css">
</head>

<body class="body_login">
   <div class="wrapper">
      <%@include file="components/header-menu.jsp" %>
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
                        User Register
                     </div>
                     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                     <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
                     <form:form method="POST" modelAttribute="userForm">
                     <form method="POST" action="${path}/user/registration" class="login-block__form form-page">
                        <div class="login-block__inputs register-block__inputs">

                           <div class="register-row">
                              <div class="register-block__name form-input form-input_register">
                                 <form:input path = "address.name" type="text" placeholder="Enter name"></form:input>
                                 <span></span>
                              </div>
                              <div class="register-block__surname form-input form-input_register">
                                 <form:input path = "address.surname" type="text" placeholder="Enter surname"></form:input>
                                 <span></span>
                              </div>
                           </div>
                           <div class="register-block__email form-input form-input_register">
                              <form:input path = "email" type="email" placeholder="Enter Email"></form:input>
                              <span></span>
                           </div>
                           <div class="register-row">
                              <div class="register-block__city form-input form-input_register">
                                 <form:input path = "address.city" type="text" placeholder="Enter city"></form:input>
                                 <span></span>
                              </div>
                              <div class="register-block__phone form-input form-input_register">
                                 <form:input path = "address.phoneNumber" type="tel" placeholder="Enter phone"></form:input>
                                 <span></span>
                              </div>
                           </div>
                           <div class="register-row">
                              <div class="login-block__password form-input form-input_register">
                                 <form:input path = "password" type="password" placeholder="Enter PASSWORD"></form:input>
                                 <span></span>
                              </div>
                              <div class="login-block__password form-input form-input_register">
                                 <form:input path = "passwordConfirm" type="password" placeholder="Repeat PASSWORD"></form:input>
                                 <span></span>
                              </div>
                           </div>

                           <a href="${path}/user/login" class="login-block__register form-link">Already registered? SING IN</a>
                        </div>
                        <button class="login-block__button form-button">REGISTER</button>
                     </form>
                     </form:form>
                     <div class="login-block__label form-label">
                        Banking you want to use
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </main>
      <%@include file="components/footer.jsp" %>
   </div>
</body>

</html>