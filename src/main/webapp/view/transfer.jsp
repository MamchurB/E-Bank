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
   <title>E-Bank - Transfer</title>
   <link rel="stylesheet" href="${path}/css/style.css">
</head>

<body>
   <div class="wrapper">
      <%@include file="components/header-menu.jsp" %>
      <main class="page page_index">
         <%@include file="components/menu.jsp" %>
         <div class="data">
            <div class="data__title">
               Валютний переказ
            </div>
            <ul class="data__progress progress-data progressbar">
               <li class="progress-data__element active">
                  <div class="progress-data__text">
                     Форма
                  </div>
               </li>
               <div class="progress-data__line active"></div>
               <li class="progress-data__element">
                  <div class="progress-data__text">
                     Резюме
                  </div>
               </li>
               <div class="progress-data__line"></div>
               <li class="progress-data__element">
                  <div class="progress-data__text">
                     Завершення
                  </div>
               </li>
            </ul>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <form:form method="POST" modelAttribute="transferForm">
            <div class="data__form">
               <div class="data__bank-account">
                  <div class="data__label">Виберіть банківський рахунок
                  </div>
                  <form:select path = "sourceAccountNumber">
                     <c:forEach items="${allAccount}" var="item">
                        <option value="${item.number}">${item.number}</option>
                     </c:forEach>
                  </form:select>
               </div>
               <div class="data__receiver">
                  <div class="data__label">Одержувач
                  </div>
                  <form:input path="destinedAccountNumber" type="text" placeholder="Одержувач"></form:input>
               </div>
               <form:input path="destinedCurrency" value = "PLN" type="hidden" />
               <form:input path="sourceCurrency" value = "PLN" type="hidden"/>
               <div class="data__bank-account">
                  <div class="data__label">Виберіть тип транзакції
                  </div>
                  <form:select path="transactionDirectionId">
                     <c:forEach items="${allTypeTransaction}" var="item">
                        <form:option value="${item.transactionType.value}">${item.transactionType.name()}</form:option>
                     </c:forEach>
                  </form:select>
               </div>
               <div class="data__row">
                  <div class="data__sum">
                     <div class="data__label">Сума
                     </div>
                     <form:input path = "balance" type="number" placeholder="Сума"></form:input>
                  </div>
                  <div class="data__name">
                     <div class="data__label">Назва
                     </div>
                     <form:input path = "title" type="text" placeholder="Назва"></form:input>
                  </div>
               </div>
               <button class="data__button form-button">
                  Далі
               </button>
            </div>
            </form:form>
         </div>
      </main>
      <%@include file="components/footer.jsp" %>
   </div>


   <script src="${path}/js/burger.js"></script>

</body>

</html>