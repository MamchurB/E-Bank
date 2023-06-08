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
   <title>E-Bank - Deposits</title>
   <link rel="stylesheet" href="${path}/css/style.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
   <script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
           th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

</head>

<body>
   <div class="wrapper">
      <%@include file="../components/header-menu.jsp" %>
      <div class="popup__wrapper_account">
         <div class="popup popup__deposit popup-deposits">
            <div class="card-details__transactions transactions-card-details">
               <div class="popup-deposits__row">
               </div>
               <div class="transactions-card-details__table_wrapper">
                  <table class="transactions-card-details__table statistic__table">
                     <tr>
                        <th>ID</th>
                        <td id = "id">5</td>
                     </tr> 
                     <tr>
                        <th>Number</th>
                        <td id = "number"></td>
                     </tr>
                     <tr>
                        <th>Account currencies</th>
                        <td id = "saldo">166.67</td>
                     </tr>
                     <tr>
                        <th>Bank Account Type</th>
                        <td id ="bankAccountType">1000</td>
                     </tr>
                     <tr>
                        <th>Transaction Comission</th>
                        <td id = "transactionComission"></td>
                     </tr> 
                     <tr>
                        <th>Exchange Currency Commission</th>
                        <td id ="exchangeCurrencyCommission"></td>
                     </tr> 
                  </table>
               </div>
            </div>
            <button class="form-button popup__button popup__close_account popup-deposits__button">
               Ок
            </button>
         </div>
      </div>
      <main class="page page_index">
         <%@include file="../components/menuEmployee.jsp" %>
         <div class="data message">
            <div class="form-title">
               Deposit
            </div>
            <div class="transactions-card-details__title">
               Add a new deposit
            </div>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <form:form method="POST" modelAttribute="depositForm">
            <div class="data__form">
               <div class="data__bank-account">
                  <div class="data__label">Select a bank account
                  </div>
                  <form:select path = "destinedBankAccountNumber">
                     <c:forEach items="${allAccount}" var="item">
                        <option value="${item.number}">${item.number}</option>
                     </c:forEach>
                  </form:select>
               </div>
               <div class="data__out-currency deposit__out-currency">
                  <div class="data__label">Currency
                  </div>
                  <form:select path="sourceCurrencyType">
                     <c:forEach items="${allCurrencyType}" var="item">
                        <form:option value="${item.name}">${item.name}</form:option>
                     </c:forEach>
                  </form:select>
               </div>
               <div class="data__sum exchange__sum">
                  <div class="data__label">Sum
                  </div>
                  <form:input path="balance" min = "0" type="number" placeholder="Сума"/>
               </div>
               <button class="data__button form-button deposit__button">
                  Apply
               </button>
            </div>
            </form:form>
            <div class="transactions-card-details__title">
                Deposits
            </div>
            <div class="card-details__transactions transactions-card-details">
               <div class="transactions-card-details__table_wrapper transfer-tempalte__table">
                  <table class="transactions-card-details__table message__table">
                     <tr>
                        <th>Sum</th>
                        <th>Date</th>
                        <th>Account number</th>
                     </tr>
                     <c:forEach items="${allDeposits}" var="item">
                     <tr>
                        <td>${item.balance}</td>
                        <td>${item.date}</td>
                        <td>${item.destinedBankAccount.number}</td>
                     </tr>
                     </c:forEach>
                  </table>
               </div>
            </div>
            <div class="transactions-card-details__title">
                Bank accounts
            </div>
            <div class="card-details__transactions transactions-card-details">
               <div class="transactions-card-details__table_wrapper transfer-tempalte__table">
                  <table class="transactions-card-details__table message__table">
                     <tr>
                        <th>Account number</th>
                        <th>Type</th>
                        <th>Accounts</th>
                     </tr>
                     <c:forEach items="${allAccount}" var="item">
                     <tr>
                        <td>${item.number}</td>
                        <td>${item.bankAccType.bankAccountType.name()}</td>
                        <td>
                           <c:forEach items="${item.saldos}" var="saldo">
                           ${saldo.currencyType.name} ${saldo.balance}
                        </c:forEach>
                        </td>
                        <td>
                           <button value="${item.id}" class="form-button message__history-btn   message__title_account">
                               In detail
                           </button>
                        </td>
                     </tr>
                     </c:forEach>
                  </table>
               </div>
            </div>
         </div>
      </main>
      <%@include file="../components/footer.jsp" %>
   </div>


   <script src="${path}/js/burger.js"></script>
   <script src="${path}/js/popup-deposits.js"></script>
</body>

</html>