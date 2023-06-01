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
   <title>E-Bank - Transfer Template</title>
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
      <div class="popup popup__transfer">
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
         <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
         <form:form method="POST"  modelAttribute="templateForm">
            <div class="popup__form">
               <div class="popup__bank-account">
                  <div class="data__label">Select a bank account
                  </div>
                  <form:select path = "sourceAccountNumber">
                     <c:forEach items="${allAccount}" var="item">
                        <option value="${item.number}">${item.number}</option>
                     </c:forEach>
                  </form:select>
               </div>
               <div class="popup__bank-account">
                  <div class="data__label">
                     Select the type of transaction
                  </div>
                  <form:select path="transactionDirectionId">
                     <c:forEach items="${allTypeTransaction}" var="item">
                        <form:option value="${item.transactionType.value}">${item.transactionType.name()}</form:option>
                     </c:forEach>
                  </form:select>
               </div>
               <div class="popup__row">
                  <div class="popup__out-currency">
                     <div class="data__label">Output currency
                     </div>
                     <form:select path="sourceCurrency">
                        <c:forEach items="${allCurrencyType}" var="item">
                           <form:option value="${item.name}">${item.name}</form:option>
                        </c:forEach>
                     </form:select>
                  </div>
                  <div class="popup__currency">
                     <div class="data__label">Target Currency
                     </div>
                     <form:select path="destinedCurrency">
                        <c:forEach items="${allCurrencyType}" var="item">
                           <form:option value="${item.name}">${item.name}</form:option>
                        </c:forEach>
                     </form:select>
                  </div>
               </div>
               <div class="popup__receiver">
                  <div class="data__label">Recipient
                  </div>
                  <form:input path="destinedAccountNumber" type="text" placeholder="Одержувач"/>

               </div>
               <div class="popup__row">
                  <div class="popup__sum">
                     <div class="data__label">Sum
                     </div>
                     <form:input path = "balance" type="number" placeholder="Сума"/>
                  </div>
                  <div class="popup__name">
                     <div class="data__label">Title
                     </div>
                     <form:input path = "title" type="text" placeholder="Назва"/>
                  </div>
               </div>
               <div class="popup__buttons">
                  <div class="form-button popup__button popup__close">
                     Cancel
                  </div>
                  <button class="form-button popup__button">
                     Next
                  </button>
               </div>
            </div>
         </form:form>

      </div>
   </div>
      <div class="popup__wrapper_edit">
         <div class="popup popup__transfer">
          <form:form method="POST" action="${path}/transaction/template/update"  modelAttribute="editTemplateForm">
               <div class="popup__form">
                  <div class="popup__bank-account">
                     <form:input id = "id" type="hidden" path="id" />
                     <div class="data__label">Select a bank account
                     </div>
                     <form:select id = "editSourceAccountNumber" path = "editSourceAccountNumber">
                        <c:forEach items="${allAccount}" var="item">
                           <option value="${item.number}">${item.number}</option>
                        </c:forEach>
                     </form:select>
                  </div>
                  <div class="popup__bank-account">
                     <div class="data__label">
                        Select the type of transaction
                     </div>
                     <form:select id = "editTransactionDirectionId" path="editTransactionDirectionId">
                        <c:forEach items="${allTypeTransaction}" var="item">
                           <form:option value="${item.transactionType.value}">${item.transactionType.name()}</form:option>
                        </c:forEach>
                     </form:select>
                  </div>
                  <div class="popup__row">
                     <div class="popup__out-currency">
                        <div class="data__label">Output currency
                        </div>
                        <form:select id = "editSourceCurrency" path="editSourceCurrency">
                           <c:forEach items="${allCurrencyType}" var="item">
                              <form:option value="${item.name}">${item.name}</form:option>
                           </c:forEach>
                        </form:select>
                     </div>
                     <div class="popup__currency">
                        <div class="data__label">Target Currency
                        </div>
                        <form:select id = "editDestinedCurrency" path="editDestinedCurrency">
                           <c:forEach items="${allCurrencyType}" var="item">
                              <form:option value="${item.name}">${item.name}</form:option>
                           </c:forEach>
                        </form:select>
                     </div>
                  </div>
                  <div class="popup__receiver">
                     <div class="data__label">Recipient
                     </div>
                     <form:input id = "editDestinedAccountNumber" path="editDestinedAccountNumber" type="text" placeholder="Одержувач"/>
                  </div>
                  <div class="popup__row">
                     <div class="popup__sum">
                        <div class="data__label">Sum
                        </div>
                        <form:input id = "editBalance" path = "editBalance" type="number" placeholder="Сума"/>
                     </div>
                     <div class="popup__name">
                        <div class="data__label">Title
                        </div>
                        <form:input id = "editTitle" path = "editTitle" type="text" placeholder="Назва"/>
                     </div>
                  </div>
                  <div class="popup__buttons">
                     <div class="form-button popup__button popup__close_edit">
                        Cancel
                     </div>
                     <button class="form-button popup__button">
                        Next
                     </button>
                  </div>
               </div>
            </form:form>
         </div>
      </div>
      <main class="page page_index">

         <%@include file="components/menu.jsp" %>
         <div class="data message">
            <div class="form-title message__title">
               Transfer templates
            </div>
            <div class="card-details__transactions transactions-card-details">
               <div class="transactions-card-details__table_wrapper transfer-tempalte__table">
                  <table class="transactions-card-details__table message__table">
                     <tr>
                        <th>Name</th>
                        <th>Original account number</th>
                        <th>Target account number</th>
                        <th>Currency</th>
                        <th>Sum</th>
                     </tr>
                     <c:forEach items="${allTemplates}" var="template">
                     <tr>
                        <td>${template.title}</td>
                        <td>${template.sourceAccountNumber}</td>
                        <td>${template.destinedAccountNumber}</td>
                        <td>${template.destinedCurrency}</td>
                        <td>${template.balance}</td>
                        <td>
                           <a href="${path}/transaction/template/${template.id}">
                           <button class="form-button message__history-btn">
                              Perform
                           </button>
                           </a>
                        </td>
                        <td>
                           <button value="${template.id}" class="form-button message__history-btn message__title_edit">
                              Edit
                           </button>
                        </td>
                     </tr>
                     </c:forEach>
                  </table>
               </div>
            </div>
            <button class="home__add-btn popup_click" >
               Add transfer template
            </button>
         </div>

      </main>
      <%@include file="components/footer.jsp" %>
   </div>


   <script src="${path}/js/burger.js"></script>
   <script src="${path}/js/popup-edit.js"></script>
</body>

</html>