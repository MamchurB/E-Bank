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
  <title>E-Bank - Home</title>
  <link rel="stylesheet" href="${path}/css/style.css">
</head>

<body>
<div class="wrapper">
  <%@include file="components/header-menu.jsp" %>
  <main class="page page_index">
    <%@include file="components/menu.jsp" %>
    <div class="data user">
      <div class="form-title user__title">
        Дані користувача
      </div>
      <div class="user__table">
        <table>
          <tr>
            <th>
              Ідентифікатор
            </th>
            <td>
              ${userAccount.identifier}
            </td>
          </tr>
          <tr>
            <th>
              Ім’я
            </th>
            <td>
              ${userAccount.address.name}
            </td>
          </tr>
          <tr>
            <th>
              Прізвище
            </th>
            <td>
              ${userAccount.address.surname}
            </td>
          </tr>
          <tr>
            <th>
              Місто
            </th>
            <td>
              ${userAccount.address.city}
            </td>
          </tr>
          <tr>
            <th>
              Пошта
            </th>
            <td>
              ${userAccount.email}
            </td>
          </tr>
          <tr>
            <th>
              Телефон
            </th>
            <td>
              ${userAccount.address.phoneNumber}
            </td>
          </tr>
        </table>
      </div>
      <div class="user__label">
        Редагувати пароль
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
        <button class="login-block__button form-button">Змінити</button>

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