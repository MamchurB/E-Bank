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
                        User Register
                     </div>
                     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                     <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
                     <form:form method="POST" modelAttribute="userForm">
                     <form method="POST" action="${path}/user/registration" class="login-block__form form-page">
                        <div class="loginn-blockk__inputss">
                           <div class="login1-block1__inputs1">
                              <div class="register1-block1__username1 form3-input3">
                                 <form:input path="address.name" type="text" placeholder="First name"></form:input>
                                 <span></span>
                              </div>
                              <div class="register2-block2__username2 form3-input3">
                                 <form:input path="address.surname" type="text" placeholder="Surname "></form:input>
                                 <span></span>
                              </div>
                           </div>
                           <div class="login1-block1__inputs1">
                              <div class="register-block__email form1-input1">
                                 <form:input path="email" type="email" placeholder="Email"></form:input>
                                 <span></span>
                              </div>
                           </div>
                           <div class="login1-block1__inputs1">
                              <div class="register-block__city form3-input3">
                                 <form:input path="address.city" type="text" placeholder="City"></form:input>
                                 <span></span>
                              </div>
                              <div class="register-block__username form3-input3">
                                 <form:input path="address.phoneNumber" type="tel" placeholder="Phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"></form:input>
                                 <span></span>
                              </div>
                           </div>
                           <div class="login1-block1__inputs1">
                              <div class="login1-block1__password1 form3-input3">
                                 <form:input path="password" type="password" placeholder="Enter PASSWORD"></form:input>
                                 <span></span>
                              </div>
                              <div class="login-block__password form3-input3">
                                 <form:input path="passwordConfirm" type="password" placeholder="Repeat PASSWORD"></form:input>
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