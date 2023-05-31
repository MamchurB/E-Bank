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
   <title>E-Bank - Exchange</title>
   <link rel="stylesheet" href="${path}/css/style.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
   <script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
           th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

</head>

<body>
   <div class="wrapper">
      <%@include file="components/header-menu.jsp" %>
      <div class="popup__wrapper">
         <div class="popup popup__deposit popup-deposits">
            <div class="card-details__transactions transactions-card-details">
               <div class="transactions-card-details__table_wrapper">
                  <table class="transactions-card-details__table statistic__table">
                     <tr>
                        <c:forEach items="${allCurrencyType}" var="currencyType">
                           <th>${currencyType.name}</th>
                        </c:forEach>
                     </tr>
                     <tr>
                        <c:forEach items="${allCurrencyType}" var="currencyType">
                           <td>${currencyType.exchangeRate}</td>
                        </c:forEach>
                     </tr>
                  </table>
               </div>
            </div>
            <button class="form-button popup__button popup__close popup-deposits__button">
               Ок
            </button>
         </div>
      </div>
      <div class="popup__wrapper_calculate">
         <div class="popup popup__deposit popup-deposits">
            <div class="card-details__transactions transactions-card-details">
               <div class="transactions-card-details__table_wrapper">
                  <div style = "font-size:24px; text-align: center" id = "valueCalculate"></div>
               </div>
            </div>
            <button class="form-button popup__button popup__close_calculate popup-deposits__button">
               Ок
            </button>
         </div>
      </div>
      <main class="page page_index">
         <%@include file="components/menu.jsp" %>
         <div class="data">
            <div class="data__title">
               Currency exchange
            </div>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <form:form method="POST" modelAttribute="exchangeForm">

            <div class="data__form">
               <div class="data__bank-account">
                  <div class="data__label">Select a bank account
                  </div>
                  <form:select path = "sourceBankAccNumber">
                     <c:forEach items="${allAccount}" var="item">
                        <option value="${item.number}">${item.number}</option>
                     </c:forEach>
                  </form:select>
               </div> 
               <div class="data__row">
                  <div class="data__out-currency">
                     <div class="data__label">Output currency
                     </div>
                     <form:select id = "sourceCurrency" path="sourceCurrency">
                        <c:forEach items="${allCurrencyType}" var="item">
                           <form:option value="${item.name}">${item.name}</form:option>
                        </c:forEach>
                     </form:select>
                  </div>
                  <div class="data__currency">
                     <div class="data__label">Target Currency
                     </div>
                     <form:select id = 'destCurrency' path="destCurrency">
                        <c:forEach items="${allCurrencyType}" var="item">
                           <form:option value="${item.name}">${item.name}</form:option>
                        </c:forEach>
                     </form:select>
                  </div>
               </div>
               <div class="data__sum exchange__sum">
                  <div class="data__label">Sum
                  </div>
                  <form:input min = "0" id = "count" path = "balance" type="number" placeholder="Сума"/>
               </div>
               <div class="exchange__buttons">
                  <button type="submit" class="data__button form-button exchange__button">
                     Convert
                  </button>
                  <div class="data__button form-button exchange__button message__title_calculate">
                     Calculate
                  </div>
                  <div class="data__button form-button exchange__button message__title">
                     Table of currencies
                  </div>
               </div>
            </div>
               </form:form>
         </div>
      </main>
      <%@include file="components/footer.jsp" %>
   </div>


   <script src="${path}/js/burger.js"></script>
   <script src="${path}/js/popup-exchange.js"></script>

</body>

</html>