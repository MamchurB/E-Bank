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
    <title>E-Bank - Exchange</title>
    <link rel="stylesheet" href="${path}/css/style.css">
</head>

<body>
<div class="wrapper">
    <%@include file="../components/header-menu.jsp" %>
    <main class="page page_index">
        <%@include file="../components/menu.jsp" %>
        <div class="data">
            <div class="data__title">
                Currency exchange
            </div>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <form:form method="POST" modelAttribute="exchangeForm">
                <div class="data__form">
                    <div class="data__bank-account">
                        <div class="data__label">
                            Select a bank account
                        </div>
                        <form:select path = "sourceBankAccNumber">
                            <c:forEach items="${allAccount}" var="item">
                                <option value="${item.number}">${item.number}</option>
                            </c:forEach>
                        </form:select>
                    </div>
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
                    <form:select path="destCurrency">
                        <c:forEach items="${allCurrencyType}" var="item">
                            <form:option value="${item.name}">${item.name}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
                    <div class="data__sum">
                        <div class="data__label">Сума
                        </div>
                        <form:input path = "balance" type="number" placeholder="Сума"></form:input>
                    </div>

                    <button class="data__button form-button">
                        Далі
                    </button>
                </div>
            </form:form>
        </div>
    </main>
    <%@include file="../components/footer.jsp" %>
</div>


<script src="${path}/js/burger.js"></script>

</body>

</html>