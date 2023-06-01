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
    <%@include file="components/header-menu.jsp" %>
    <main class="page page_index">
        <%@include file="components/menu.jsp" %>
        <div class="data">
            <div class="data__title">
                Currency transfer
            </div>
            <ul class="data__progress progress-data progressbar">
                <li class="progress-data__element active">
                    <div class="progress-data__text">
                        Form
                    </div>
                </li>
                <div class="progress-data__line active"></div>
                <li class="progress-data__element active">
                    <div class="progress-data__text">
                        Resume
                    </div>
                </li>
                <div class="progress-data__line active"></div>
                <li class="progress-data__element active">
                    <div class="progress-data__text">
                        Completion
                    </div>
                </li>
            </ul>
            <a href="" class="data__complete">
                <img src="${path}/images/complete.png" alt="complete">
            </a>
        </div>
    </main>
    <%@include file="components/footer.jsp" %>
</div>


<script src="${path}/js/burger.js"></script>

</body>

</html>