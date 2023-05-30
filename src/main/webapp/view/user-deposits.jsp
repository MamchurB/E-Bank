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
    <%@include file="components/header-menu.jsp" %>
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
        <%@include file="components/menu.jsp" %>
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
    <%@include file="components/footer.jsp" %>
</div>


<script src="${path}/js/burger.js"></script>
<script src="${path}/js/popup-deposits.js"></script>
<script src="${path}/js/jquery.boot.js"></script>
</body>

</html>