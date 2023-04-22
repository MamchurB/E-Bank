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
      <header class="header">
         <div class="container">
            <div class="header__body">
               <a href="" class="header__logo">E-bank</a>
               <div class="header__burger">
                  <span></span>
               </div>
               <nav class="header__menu">
                  <ul class="header__list">
                     <li><a href="" class="header__link">HOME</a></li>
                     <li><a href="" class="header__link">ABOUT US</a></li>
                     <li><a href="" class="header__link">CONTACTS</a></li>
                  </ul>
               </nav>
            </div>
         </div>
      </header>
      <main class="page page_index">
         <div class="dashboard">
            <div class="dashboard__title">
               <img src="${path}/images/dashboard.svg" alt="dashboard">
               <span>Dashboard</span>
            </div>

            <div class="dashboard__accordion">
               <div class="tabs">
                  <div class="tab">
                     <input type="checkbox" id="rd1">
                     <label class="tab-label dashboard__transfers transfers" for="rd1">
                        <img src="${path}/images/transfers.svg" alt="transfers">
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
                        <img src="${path}/images/exchange.svg" alt="exchange">
                        <span>Exchange</span>
                     </label>
                     <div class="tab-content">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nihil, aut.
                     </div>
                  </div>
                  <div class="tab">
                     <input type="checkbox" id="rd3" name="rd">
                     <label class="tab-label  dashboard__credit" for="rd3">
                        <img src="${path}/images/credit.svg" alt="credit">
                        <span>Credit</span>
                     </label>
                     <div class="tab-content">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nihil, aut.
                     </div>
                  </div>
               </div>
            </div>
            <div class="dashboard__notification">
               <img src="${path}/images/notification.svg" alt="notification">
               <span>Notifications</span>
            </div>
            <div class="dashboard__profile">
               <img src="./images/profile.svg" alt="profile">
               <span>Profile</span>
            </div>
         </div>
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
               <li class="progress-data__element">
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
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <form:form method="POST" modelAttribute="transferForm">
            <div class="data__form">
               <div class="data__bank-account">
                  <div class="data__label">Виберіть банківський рахунок
                  </div>
                  <form:select path="sourceAccountNumber">
                     <form:option value="56785678567856785678567867">Account 1</form:option>
                     <form:option value="56785678567856785678567867">Account 2</form:option>
                     <form:option value="56785678567856785678567867">Account 3</form:option>
                  </form:select>
               </div>
               <div class="data__row">
                  <div class="data__out-currency">
                     <div class="data__label">Вихідна валюта
                     </div>
                     <form:select path="sourceCurrency">
                        <c:forEach items="${allCurrencyType}" var="item">
                           <form:option value="${item.name}">${item.name}</form:option>
                        </c:forEach>
                     </form:select>
                  </div>
                  <div class="data__currency">
                     <div class="data__label">Цільова Валюта
                     </div>
                     <form:select path="destinedCurrency">
                        <c:forEach items="${allCurrencyType}" var="item">
                           <form:option value="${item.name}">${item.name}</form:option>
                        </c:forEach>
                     </form:select>
                  </div>
               </div>
               <div class="data__receiver">
                  <div class="data__label">Одержувач
                  </div>
                  <form:input path="destinedAccountNumber" type="text" placeholder="Одержувач"></form:input>
               </div>
               <div class="data__row">
                  <div class="data__sum">
                     <div class="data__label">Сума
                     </div>
                     <form:input path = "balance" type="number" placeholder="Сума"></form:input>
                  </div>
                  <div class="data__name">
                     <div class="data__label">Назва
                     </div>
                     <form:input path = "title" type="text" placeholder="Назва"></form:input>
                  </div>
               </div>
               <button class="data__button form-button">
                  Далі
               </button>
            </div>
            </form:form>
         </div>
      </main>
      <footer class="footer">
         <div class="container container_footer">
            <div class="footer__inner">
               <ul class="footer__social">
                  <li>
                     <a href="#"><img src="${path}/images/facebook.svg" alt="facebook"></a>
                  </li>
                  <li><a href="#"><img src="${path}/images/inst.svg" alt="inst"></a></li>
                  <li><a href="#"><img src="${path}/images/youtube.svg" alt="youtube"></a></li>
                  <li><a href="#"><img src="${path}/images/viber.svg" alt="viber"></a></li>
                  <li><a href="#"><img src="${path}/images/telega.svg" alt="telega"></a></li>
               </ul>
               <div class="footer__rights">
                  "E-Bank", 2023. All rights reserved. CrEATEd by Bohdan Mamchur
               </div>
            </div>
         </div>
      </footer>
   </div>


   <script src="./js/burger.js"></script>

   <!-- СЛАЙДЕР
   <script src="./js/script.js"></script>
   <script src="./js/slick.min.js"></script>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   -->
</body>

</html>