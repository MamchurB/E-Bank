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
    <%@include file="components/header-menu.jsp" %>
    <main class="page page_index">
        <%@include file="components/menu.jsp" %>
        <div class="data">
            <div class="data__title">
                Новий кредит
            </div>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <form:form method="POST" modelAttribute="creditsForm">
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
                    <div class="data__label">Цільовий Баланс
                    </div>
                    <form:select path ="destinedSaldoId">
                        <c:forEach items="${allCurrencyType}" var="item">
                            <form:option value="${item.id}">${item.name}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
                <div class="data__sum data__credit-sum">
                    <div class="data__label">Сума
                    </div>
                    <form:input path = "totalBalance" type="number" min="0" max="100000" placeholder="Сума"></form:input>
                </div>
                <div class="data__pay-range sum-range">
                    <div class="data__label">Кількість платежів
                    </div>
                    <div class="sum-range__info">
                        <div class="pay-range__current">
                            5
                        </div>
                        <div class="pay-range__max">
                            10000
                        </div>
                    </div>
                    <form:input path = "totalInstallmentCount" type="range" class="pay-range__input" min="5" max="96" value="12"></form:input>
                </div>
                <button class="data__button form-button">
                    Оформити
                </button>
            </div>
            </form:form>
        </div>
    </main>
    <%@include file="components/footer.jsp" %>
</div>


<script src="${path}/js/burger.js"></script>
<script src="${path}/js/input-range.js"></script>

</body>

</html>