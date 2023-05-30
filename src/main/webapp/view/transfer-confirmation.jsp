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
               <li class="progress-data__element active">
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
            <div class="data user">
               <div class="form-title user__title">
                  Дані користувача
               </div>
               <div class="user__table">
                  <table>
                     <tr>
                        <th>
                           Банківський рахунок
                        </th>
                        <td>
                           ${transferConfirmation.sourceAccountNumber}
                        </td>
                     </tr>
                     <tr>
                        <th>
                           Цільовий рахунок
                        </th>
                        <td>
                           ${transferConfirmation.destinedAccountNumber}
                        </td>
                     </tr>
                     <tr>
                        <th>
                           Сума
                        </th>
                        <td>
                           ${transferConfirmation.balance}
                        </td>
                     </tr>
                     <tr>
                        <th>
                           Тип
                        </th>
                        <td>
                           ${transferConfirmation.title}
                        </td>
                     </tr>
                  </table>
               </div>
               <div class="data__nav">
                  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                  <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
                  <form:form method="POST" action="/transaction/confirmation"  modelAttribute="transferConfirmation">
                  <form>
                     <form:input type="hidden" path="destinedAccountNumber" value="${transferConfirmation.destinedAccountNumber}" />
                     <form:input type="hidden" path="transactionDirectionId" value="${transferConfirmation.transactionDirectionId}" />
                     <form:input type="hidden" path="sourceAccountNumber" value="${transferConfirmation.sourceAccountNumber}" />
                     <form:input type="hidden" path="balance" value="${transferConfirmation.balance}" />
                     <form:input type="hidden" path="destinedCurrency" value="${transferConfirmation.destinedCurrency}" />
                     <form:input type="hidden" path="sourceCurrency" value="${transferConfirmation.sourceCurrency}" />
                     <form:input type="hidden" path="title" value="${transferConfirmation.title}" />
                     <button class="form-button">
                        Далі
                     </button>
                  </form>
                  </form:form>

                  <button onclick="window.location.href='/transaction/delete/'" class="form-button data__reject">
                     Скасувати
                  </button>
               </div>
            </div>
         </div>
      </main>
      <%@include file="components/footer.jsp" %>
   </div>

   <script src="${path}/js/burger.js"></script>

</body>

</html>