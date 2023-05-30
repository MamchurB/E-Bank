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
    <title>E-Bank - Card Details</title>
    <link rel="stylesheet" href="${path}/css/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>

<body>
<div class="wrapper">
    <%@include file="components/header-menu.jsp" %>
    <main class="page page_index">
        <%@include file="components/menu.jsp" %>
        <div class="data card-details">
            <div class="form-title card-details__title">Детально про карту</div>
            <div class="card-details__number">
                Номер рахунку : ${bankAccount.number}
            </div>
                <div>
                    <input type="hidden" id="bcLabels" value="${chartData.get("label")}"/>
                    <input type="hidden" id="bcPercents" value="${chartData.get("value")}"/>
                    <canvas style="max-width: 100%; padding-bottom: 10px;" id="myPieChart" width="60%" height="60%"></canvas>
                </div>
            <div class="card-details__transactions transactions-card-details">
                <div class="transactions-card-details__title">
                    Історія Транзакцій
                </div>
                <div class="transactions-card-details__table_wrapper">
                    <table class="transactions-card-details__table">
                        <tr>
                            <th>Тип</th>
                            <th>Дата</th>
                            <th>Облікові записи призначення</th>
                            <th>Сума</th>
                        </tr>
                        <c:forEach items="${transactionsById}" var="transaction">
                            <tr>
                                <td>${transaction.transactionDirection.transactionType.name()}</td>
                                <td>${transaction.date}</td>
                                <td>${transaction.title}</td>
                                <td>-${transaction.balance}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="card-details__label">
                Керувати картою
            </div>
            <button onclick="window.location.href='/close-account/${bankAccountId}'" class="form-button  card-details__button">
                Закрити рахунок
            </button>
        </div>
    </main>
    <%@include file="components/footer.jsp" %>
</div>


<script src="${path}/js/burger.js"></script>
<script src="${path}/js/chart.js/Chart.min.js"></script>
<script src="${path}/js/sb-admin-charts.js"></script>

<!-- СЛАЙДЕР
<script src="./js/script.js"></script>
<script src="./js/slick.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
-->
</body>

</html>