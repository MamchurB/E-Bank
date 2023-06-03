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
                        <td id = 'identifier'></td>
                     </tr>
                     <tr>
                        <th>Email</th>
                        <td id = 'email'></td>
                     </tr>
                     <tr>
                        <th>First and last name</th>
                        <td id = 'name'></td>
                     </tr>
                     <tr>
                        <th>Address</th>
                        <td id = 'city'></td>
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
                  <form:input id = "id" type="hidden" path="id" />
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
                        <div class="data__label">Email
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
                              Перегляд
                           </button>
                        </td>
                        <td>
                           <button value="${item.ID}" class="form-button message__history-btn message__title_edit">
                              Редагувати
                           </button>
                        </td>
                        <td>
                           <button  onclick="location.href='${item.ID}/activate'" class="form-button message__history-btn">
                              Активувати
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