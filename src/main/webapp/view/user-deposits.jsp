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
    <title>E-Bank - My Deposits</title>
    <link rel="stylesheet" href="${path}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js"
            th:src="@{/webjars/jquery/3.4.1/jquery.min.js}" type="text/javascript"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
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
    <div class="popup__wrapper">
        <div class="popup popup__deposit popup-deposits">
            <div class="card-details__transactions transactions-card-details">
                <div class="transactions-card-details__table_wrapper">
                    <table class="transactions-card-details__table statistic__table">
                        <tr>
                            <th>ID</th>
                            <td id = 'id'> </td>
                        </tr>
                        <tr>
                            <th>Початкова сума</th>
                            <td id = 'startBalance' ></td>
                        </tr>
                        <tr>
                            <th>Поточна сума</th>
                            <td id = 'currentBalance'></td>
                        </tr>
                        <tr>
                            <th>Статус</th>
                            <td id = 'investmentType'></td>
                        </tr>
                        <tr>
                            <th>Дата створення</th>
                            <td id = 'creationDate'></td>
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
                <img src="${path}/images/profile.svg" alt="profile">
                <span>Profile</span>
            </div>
        </div>
        <div class="data message">
            <div class="form-title">
                Мої депозити
            </div>
            <div class="card-details__transactions transactions-card-details">
                <div class="transactions-card-details__table_wrapper">
                    <table class="transactions-card-details__table message__table">
                        <tr>
                            <th>Дата створення</th>
                            <th>Сума</th>
                            <th>Статус</th>
                        </tr>

                        <c:forEach items="${allUserDeposits}" var="deposit">
                            <tr>
                                <td>${deposit.creationDate.toString()}</td>
                                <td>${deposit.currentBalance}</td>
                                <td>${deposit.investmentType.investmentStatus.name()}</td>
                                <td>
                                    <button value="${deposit.id}" class="form-button message__history-btn message__title">
                                        Детально
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
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


<script src="${path}/js/burger.js"></script>
<script src="${path}/js/popup-deposits.js"></script>
<script src="${path}/js/jquery.boot.js"></script>
</body>

</html>