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
  <%@include file="header-menu.jsp" %>
  <main class="page page_index">

    <%@include file="menu.jsp" %>
    <div class="popup__wrapper">
      <div class="popup popup__deposit popup-deposits">
        <div class="card-details__transactions transactions-card-details">
          <div class="transactions-card-details__table_wrapper">
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <form:form method="POST" modelAttribute="bankAccForm">
              <div class="popup__form">
                <div class="popup__bank-account">
                  <div class="data__label">Виберіть тип банківського рахуноку
                  </div>
                  <form:select id = "editSourceAccountNumber" path = "bankAccountType">
                    <c:forEach items="${allTypeAccount}" var="item">
                      <option value="${item.bankAccountType}">${item.bankAccountType.name()}</option>
                    </c:forEach>
                  </form:select>
                </div>
                <div class="popup__buttons">
                  <button class="form-button popup__button ">
                    Далі
                  </button>
                </div>
              </div>
            </form:form>

            <div class="popup__buttons">
              <button class="form-button popup__button popup__close">
                Скасувати
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="data home">
      <div class="form-title home__title">
        Welcome back E-bank
      </div>
      <div class="home__cards">
        <c:forEach items="${allBankAccount}" var="item">
          <a href="${path}/card-details/${item.id}" class="home__card card-home">
            <div class="card-home__owner">
              ${name}
            </div>
            <div class="card-home__number">
              ${item.number.substring(0, 4)} **** **** **** **** ** ${item.number.substring(22, 26)}
            </div>
            <div class="card-home__money">
              <c:forEach items="${item.saldos}" var="saldo">
                ${saldo.currencyType.name} ${saldo.balance}
              </c:forEach>
            </div>
          </a>
          </c:forEach>
      </div>
      <button class="home__add-btn message__title" >
        Додати нову карту
      </button>
    </div>
  </main>
  <%@include file="footer.jsp" %>
</div>

<script src="${path}/js/burger.js"></script>
<script src="${path}/js/popup-transfer.js"></script>

</body>

</html>