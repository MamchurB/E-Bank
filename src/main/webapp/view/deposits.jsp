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
</head>

<body>
   <div class="wrapper">
      <%@include file="components/header-menu.jsp" %>
      <div class="popup__wrapper">
         <div class="popup popup__deposit popup-deposits">
            <div class="card-details__transactions transactions-card-details">
               <div class="popup-deposits__row">
                  <div class="popup-deposits__title">
                      Types of bank accounts
                  </div>
                  <button class="form-button popup__button popup-deposits__close-deposit">
                      Complete the deposit
                  </button>
               </div>
               <div class="transactions-card-details__table_wrapper">
                  <table class="transactions-card-details__table statistic__table">
                     <tr>
                        <th>ID</th>
                        <td>5</td> 
                     </tr> 
                     <tr>
                        <th>Liquidate</th>
                        <td>0.00</td> 
                     </tr>
                     <tr>
                        <th>Contribution amount</th>
                        <td>166.67</td> 
                     </tr>
                     <tr>
                        <th>Loan amount</th>
                        <td>1000</td> 
                     </tr>
                     <tr>
                        <th>Currency</th>
                        <td>Грн</td> 
                     </tr> 
                     <tr>
                        <th>Status</th>
                        <td>В очікуванні</td> 
                     </tr> 
                  </table>
               </div>
            </div>
            <button class="form-button popup__button popup__close popup-deposits__button">
               Ок
            </button>
         </div>
      </div>
      <main class="page page_index">
         <div class="dashboard">
            <div class="dashboard__title">
               <img src="../../../../../../../../Desktop/Bodya/project/images/dashboard.svg" alt="dashboard">
               <span>Dashboard</span>
            </div>

            <div class="dashboard__accordion">
               <div class="tabs">
                  <div class="tab">
                     <input type="checkbox" id="rd1">
                     <label class="tab-label dashboard__transfers transfers" for="rd1">
                        <img src="../../../../../../../../Desktop/Bodya/project/images/transfers.svg" alt="transfers">
                        <span>Transfers</span>
                     </label>
                     <div class="tab-content">
                        <fieldset>
                           <div class="transfers__radio">
                              <input type="radio" id="rb1" name="transfers__radio">
                              <div class="radio-button"></div>
                              <label class="transfers-label" for="rb1">
                                 Стандартний
                              </label>
                           </div>
                           <div class="transfers__radio">
                              <input type="radio" id="rb2" name="transfers__radio">
                              <div class="radio-button"></div>
                              <label class="transfers-label" for="rb2">
                                 Валютний
                              </label>
                           </div>
                           <div class="transfers__radio">
                              <input type="radio" id="rb3" name="transfers__radio">
                              <div class="radio-button"></div>
                              <label class="transfers-label" for="rb3">
                                 Визначені трансфери
                              </label>
                           </div>
                        </fieldset>
                     </div>
                  </div>
                  <div class="tab">
                     <input type="checkbox" id="rd2" name="rd">
                     <label class="tab-label  dashboard__exchange" for="rd2">
                        <img src="../../../../../../../../Desktop/Bodya/project/images/exchange.svg" alt="exchange">
                        <span>Exchange</span>
                     </label>
                     <div class="tab-content">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nihil, aut.
                     </div>
                  </div>
                  <div class="tab">
                     <input type="checkbox" id="rd3" name="rd">
                     <label class="tab-label  dashboard__credit" for="rd3">
                        <img src="../../../../../../../../Desktop/Bodya/project/images/credit.svg" alt="credit">
                        <span>Credit</span>
                     </label>
                     <div class="tab-content">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nihil, aut.
                     </div>
                  </div>
               </div>
            </div>
            <div class="dashboard__notification">
               <img src="../../../../../../../../Desktop/Bodya/project/images/notification.svg" alt="notification">
               <span>Notifications</span>
            </div>
            <div class="dashboard__profile">
               <img src="../../../../../../../../Desktop/Bodya/project/images/profile.svg" alt="profile">
               <span>Profile</span>
            </div>
         </div>
         <div class="data message">
            <div class="form-title message__title">
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
                        <td>
                           <button class="form-button message__history-btn">
                               In detail
                           </button>
                        </td>
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
                           <button class="form-button message__history-btn">
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
      <%@include file="components/footer.jsp" %>
   </div>


   <script src="${path}/js/burger.js"></script>
   <script src="${path}/js/popup-deposits.js"></script>
</body>

</html>