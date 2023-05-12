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
    <title>E-Bank - Home</title>
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
                <img src="./images/notification.svg" alt="notification">
                <span>Notifications</span>
            </div>
            <div class="dashboard__profile">
                <img src="./images/profile.svg" alt="profile">
                <span>Profile</span>
            </div>
        </div>
        <div class="data">
            <div class="data__title">
                Новий депозит
            </div>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <form:form method="POST" modelAttribute="depositForm">
                <div class="data__form">
                    <div class="data__bank-account">
                        <div class="data__label">Виберіть банківський рахунок
                        </div>
                        <select>
                            <c:forEach items="${allAccount}" var="item">
                                <option value="${item.number}">${item.number}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="data__balance">
                        <div class="data__label">Цільовий рахунок
                        </div>
                        <form:select path ="destinedSaldoId">
                            <c:forEach items="${allAccount}" var="item">
                                <form:option value="${item.id}">${item.number}</form:option>
                            </c:forEach>
                        </form:select>
                    </div>
                    <div class="data__sum data__credit-sum">
                        <div class="data__label">Сума
                        </div>
                        <form:input path = "startBalance" type="number" min="0" max="100000" placeholder="Сума"></form:input>
                    </div>
                    <button class="data__button form-button">
                        Оформити
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
<script src="./js/input-range.js"></script>

</body>

</html>