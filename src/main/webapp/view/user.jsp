<%@ page language="java" contentType="text/html;"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>E-Bank - Home</title>
  <link rel="stylesheet" href="${path}/css/style.css">
</head>

<body>
<div class="wrapper">
  <%@include file="components/header-menu.jsp" %>
  <main class="page page_index">
    <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
      <%@include file="components/menuEmployee.jsp" %>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_USER')">
      <%@include file="components/menu.jsp" %>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
      <%@include file="components/menuAdmin.jsp" %>
    </sec:authorize>
    <div class="data user">
      <div class="form-title user__title">
        User data
      </div>
      <div class="user__table">
        <table>
          <tr>
            <th>
              Identifier
            </th>
            <td>
              ${userAccount.identifier}
            </td>
          </tr>
          <tr>
            <th>
              Name
            </th>
            <td>
              ${userAccount.address.name}
            </td>
          </tr>
          <tr>
            <th>
              Surname
            </th>
            <td>
              ${userAccount.address.surname}
            </td>
          </tr>
          <tr>
            <th>
              City
            </th>
            <td>
              ${userAccount.address.city}
            </td>
          </tr>
          <tr>
            <th>
              E-Mail
            </th>
            <td>
              ${userAccount.email}
            </td>
          </tr>
          <tr>
            <th>
              Phone
            </th>
            <td>
              ${userAccount.address.phoneNumber}
            </td>
          </tr>
        </table>
      </div>
      <div class="user__label">
        Edit password
      </div>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
      <form:form method="POST" modelAttribute="passwordForm">
      <form class="user__form">
        <div class="register-row">
          <div class="login-block__password form-input form-input_register">
            <form:input path = "password" type="password" placeholder="Enter PASSWORD"></form:input>
            <span></span>
          </div>
          <div class="login-block__password form-input form-input_register">
            <form:input path = "confirmPassword" type="password" placeholder="Repeat PASSWORD"></form:input>
            <span></span>
          </div>
        </div>
        <button class="login-block__button form-button">Change</button>

      </form>
      </form:form>
    </div>
  </main>
  <%@include file="components/footer.jsp" %>
</div>


<script src="${path}/js/burger.js"></script>

<!-- СЛАЙДЕР
<script src="./js/script.js"></script>
<script src="./js/slick.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
-->
</body>

</html>