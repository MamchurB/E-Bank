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
      <%@include file="../components/header-menu.jsp" %>
      <main class="page page_index">
         <%@include file="../components/menuEmployee.jsp"%>
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
      <%@include file="../components/footer.jsp" %>
   </div>


   <script src="${path}/js/burger.js"></script>

</body>

</html>