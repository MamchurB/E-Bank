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
   <title>E-Bank - Credit Requests</title>
   <link rel="stylesheet" href="${path}/css/style.css">
</head>

<body>
   <div class="wrapper">
      <%@include file="components/header-menu.jsp" %>
      <main class="page page_index">
         <div class="dashboard">
            <div class="dashboard__title">
               <img src="./images/dashboard.svg" alt="dashboard">
               <span>Dashboard</span>
            </div>

            <div class="dashboard__accordion">
               <div class="tabs">
                  <div class="tab">
                     <input type="checkbox" id="rd1">
                     <label class="tab-label dashboard__transfers transfers" for="rd1">
                        <img src="./images/transfers.svg" alt="transfers">
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
                        <img src="./images/exchange.svg" alt="exchange">
                        <span>Exchange</span>
                     </label>
                     <div class="tab-content">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nihil, aut.
                     </div>
                  </div>
                  <div class="tab">
                     <input type="checkbox" id="rd3" name="rd">
                     <label class="tab-label  dashboard__credit" for="rd3">
                        <img src="./images/credit.svg" alt="credit">
                        <span>Credit</span>
                     </label>
                     <div class="tab-content">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nihil, aut.
                     </div>
                  </div>
               </div>
            </div>
            <div class="dashboard__notification">
               <img src="./images/notification.svg" alt="notification">
               <span>Notifications</span>
            </div>
            <div class="dashboard__profile">
               <img src="./images/profile.svg" alt="profile">
               <span>Profile</span>
            </div>
         </div>
         <div class="data message">
            <div class="form-title message__title">
               Credit applications
            </div> 
            <div class="card-details__transactions transactions-card-details">
               <div class="transactions-card-details__table_wrapper">
                  <table class="transactions-card-details__table message__table">
                     <tr>
                        <th>ID</th>
                        <th>Sum</th>
                        <th>Target account number</th>
                        <th>Currency</th>
                        <th>Number of payments</th>
                     </tr>
                     <c:forEach items="${allCredits}" var="item">
                     <tr>
                        <td>${item.id}</td>
                        <td>${item.totalBalance}</td>
                        <td>${item.destinedSaldoId}</td>
                        <td>${item.currency}</td>
                        <td>${item.totalInstallmentCount}</td>
                        <td>
                           <button onclick="location.href='${path}/credits/employee/credits/${item.id}/active'" class="form-button message__history-btn">
                              Accept
                           </button>
                        </td>
                        <td>
                           <button onclick="location.href='${path}/credits/employee/credits/${item.id}/cancel'" class="form-button message__history-btn">
                              Reject
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

</body>

</html>