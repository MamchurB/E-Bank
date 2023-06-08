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
   <title>E-Bank - Statistic</title>
   <link rel="stylesheet" href="${path}/css/style.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
   <script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
           th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

</head>

<body>
   <div class="wrapper">
      <%@include file="../components/header-menu.jsp" %>
      <div class="popup__wrapper">
         <div class="popup popup__transfer">
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
         <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
         <form:form method="POST" action="/update/current"  modelAttribute="currencyTypeEdit">
            <div class="popup__form">
               <form:input  id = "idCurrency" type="hidden" path="idCurrency"/>
               <div class="popup__receiver">
                  <div class="data__label">Name
                  </div>
                  <form:input id = "name" path="name" type = "text" placeholder="Name"/>
               </div>
               <div class="popup__receiver">
                  <div class="data__label">Exchange Currency Commission
                  </div>
                  <form:input id = "exchangeRate" path="exchangeRate" type="number" step = "0.01" placeholder="Exchange Rate"/>
               </div>
               <div class="popup__buttons">
                  <div class="form-button popup__button popup__close">
                     Cancel
                  </div>
                  <button class="form-button popup__button popup-deposits__button">
                     Ок
                  </button>
               </div>
            </div>
         </form:form>
         </div>
      </div>
      <div class="popup__wrapper_edit">
         <div class="popup popup__transfer">
            <form:form method="POST" action="/update/account"  modelAttribute="bankAccTypeEdit">
               <div class="popup__form">
                  <form:input id = "id" type="hidden" path="id"/>
                  <div class="popup__receiver">
                     <div class="data__label">Transaction Commission
                     </div>
                     <form:input id = "transactionComission" path="transactionComission"  type="number" placeholder="Transaction Commission"/>
                  </div>
                  <div class="popup__receiver">
                     <div class="data__label">Exchange Currency Commission
                     </div>
                     <form:input id = "exchangeCurrencyCommission" path="exchangeCurrencyCommission" type="number" placeholder="Exchange Currency Commission"/>
                  </div>
                  <div class="popup__buttons">
                     <div class="form-button popup__button popup__close_edit">
                        Cancel
                     </div>
                     <button class="form-button popup__button">
                        Ok
                     </button>
                  </div>
               </div>
            </form:form>
         </div>
      </div>

      <main class="page page_index">
          <%@include file="../components/menuAdmin.jsp" %>
         <div class="data card-details">
            <div class="form-title card-details__title">Statistic</div>
            <div class="card-details__transactions transactions-card-details">
               <div class="transactions-card-details__title">              
			Exchange rate
               </div>
               <div class="transactions-card-details__table_wrapper">
                  <table class="transactions-card-details__table statistic__table">
                     <tr>
                        <th>Name</th>
                        <th>Rate</th> 
                     </tr>
                     <c:forEach items="${allCurrencyType}" var="item">
                     <tr>
                        <td>${item.name}</td>
                        <td>${item.exchangeRate}</td>
                        <td>
                           <button value = "${item.id}" class="form-button message__history-btn popup_click">
                              Edit
                           </button>
                        </td>
                     </tr>
                     </c:forEach>
                  </table>
               </div>
            </div> 
            <div class="card-details__transactions transactions-card-details">
               <div class="transactions-card-details__title">
                  Types of bank accounts
               </div>
               <div class="transactions-card-details__table_wrapper">
                  <table class="transactions-card-details__table statistic__table">
                     <tr>
                        <th>Type</th>
                        <th>Transfer commission</th>
                        <th>Currency exchange commission</th>
                     </tr>
                     <c:forEach items="${allBankTypeAccount}" var="item">
                     <tr>
                        <td>${item.bankAccountType.name()}</td>
                        <td>${item.transactionComission}</td>
                        <td>${item.exchangeCurrencyCommission}</td>
                        <td>
                           <button value ="${item.id}" class="form-button message__history-btn message__title_edit">
                              Edit
                           </button>
                        </td>
                     </tr>
                     </c:forEach>
                  </table>
               </div>
            </div> 
            <div class="card-details__number">
               Credits
            </div>
            <div>
                  <input type="hidden" id="bcLabels" value="${chartData.get("label")}"/>
                  <input type="hidden" id="bcPercents" value="${chartData.get("value")}"/>
                  <canvas style="margin: 10px auto 10px auto; max-width: 500px; padding-bottom: 10px;" id="myPieChart" width="60%" height="60%"></canvas>
               </div>
         </div>
      </main>
      <%@include file="../components/footer.jsp" %>
   </div>

   <script src="${path}/js/burger.js"></script>
   <script src="${path}/js/popup-statistic-edit.js"></script>
   <script src="${path}/js/chart.js/Chart.min.js"></script>
   <script src="${path}/js/sb-admin-charts.js"></script>

</body>

</html>