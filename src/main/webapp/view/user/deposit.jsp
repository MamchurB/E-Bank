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
    <%@include file="../components/header-menu.jsp" %>
    <main class="page page_index">
        <%@include file="../components/menu.jsp" %>
        <div class="data">
            <div class="data__title">
                New Deposit
            </div>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <form:form method="POST" modelAttribute="depositForm">
                <div class="data__form">
                    <div class="data__bank-account">
                        <div class="data__label">
                            Select a bank account
                        </div>
                        <select>
                            <c:forEach items="${allAccount}" var="item">
                                <option value="${item.number}">${item.number}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="data__balance">
                        <div class="data__label">
                            Target account
                        </div>
                        <form:select path ="destinedSaldoId">
                            <c:forEach items="${allAccount}" var="item">
                                <form:option value="${item.id}">${item.number}</form:option>
                            </c:forEach>
                        </form:select>
                    </div>
                    <div class="data__sum data__credit-sum">
                        <div class="data__label">Sum
                        </div>
                        <form:input path = "startBalance" type="number" min="0" max="100000" placeholder="Сума"></form:input>
                    </div>
                    <button class="data__button form-button">
                        Apply
                    </button>
                </div>
            </form:form>
        </div>
    </main>
    <%@include file="../components/footer.jsp" %>
</div>


<script src="${path}/js/burger.js"></script>
<script src="${path}/js/input-range.js"></script>

</body>

</html>