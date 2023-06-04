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
   <title>E-Bank - New Users</title>
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
                        <th>Identifier</th>
                        <td id = 'detailIdentifier'></td>
                     </tr>
                     <tr>
                        <th>Email</th>
                        <td id = 'detailEmail'></td>
                     </tr>
                     <tr>
                        <th>First and last name</th>
                        <td id = 'detailName'></td>
                     </tr>
                     <tr>
                        <th>Address</th>
                        <td id = 'detailCity'></td>
                     </tr>
                  </table>
               </div>
            </div>
            <button class="form-button popup__button popup__close popup-deposits__button">
               Ок
            </button>
         </div>
      </div>
      <div class="popup__wrapper_edit">
         <div class="popup popup__transfer">
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <form:form method="POST"  modelAttribute="editUser">
               <div class="popup__form">
                  <form:input id = "id" type="hidden" path="id"/>
                  <form:input id = "addressId" type="hidden" path="address.id"/>
                  <div class="popup__row">
                     <div class="popup__sum">
                        <div class="data__label">Identifier
                        </div>
                        <form:input id = "identifier" path="identifier" type="text" placeholder="Identifier"/>
                     </div>
                     <div class="popup__name">
                        <div class="data__label">Email
                        </div>
                        <form:input id = "email" path = "email" type="text" placeholder="Email"/>
                     </div>
                  </div>
                  <div class="popup__row">
                     <div class="popup__sum">
                        <div class="data__label">Name
                        </div>
                        <form:input id = "name" path="address.name" type="text" placeholder="Name"/>
                     </div>
                     <div class="popup__name">
                        <div class="data__label">Surname
                        </div>
                        <form:input id = "surname" path = "address.surname" type="text" placeholder="Surname"/>
                     </div>
                  </div>
                  <div class="popup__row">
                     <div class="popup__sum">
                        <div class="data__label">City
                        </div>
                        <form:input id = "city" path="address.city" type="text" placeholder="city"/>
                     </div>
                     <div class="popup__name">
                        <div class="data__label">Mobile Phone
                        </div>
                        <form:input id = "phone" path = "address.phoneNumber" type="text" placeholder="Phone Number"/>
                     </div>
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
         <%@include file="components/menuEmployee.jsp" %>
         <div class="data message">

            <div class="form-title message__title">
               New users
            </div>
            <div class="card-details__transactions transactions-card-details">
               <div class="transactions-card-details__table_wrapper">
                  <table class="transactions-card-details__table message__table">
                     <tr>
                        <th>Identifier</th>
                        <th>Email</th>
                     </tr>
                     <c:forEach items="${allUsers}" var="item">
                     <tr>
                        <td>${item.identifier}</td>
                        <td>${item.email}</td>
                        <td>
                           <button value="${item.ID}" class="form-button message__history-btn popup_click">
                              Revision
                           </button>
                        </td>
                        <td>
                           <button value="${item.ID}" class="form-button message__history-btn message__title_edit">
                              Edit
                           </button>
                        </td>
                        <td>
                           <button  onclick="location.href='${item.ID}/activate'" class="form-button message__history-btn">
                              Activate
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
   <script src="${path}/js/popup-edit-user.js"></script>
</body>

</html>