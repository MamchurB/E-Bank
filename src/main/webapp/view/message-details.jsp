<%@ page language="java" contentType="text/html;"
         pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.time.Instant" %>
<%@ page import="com.bank.dto.out.MessageOut" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Bank - Message</title>
    <link rel="stylesheet" href="${path}/css/style.css">
</head>

<body>
<div class="wrapper">
    <%@include file="components/header-menu.jsp" %>
    <main class="page page_index">
        <%@include file="components/menu.jsp" %>
        <div class="data message">
            <div class="form-title message__title">
                My messages
            </div>
            <div class="message__details">
                <div>Topic:</div>
                <div>${conversation.topic}</div>
                <div>Author:</div>
                <div>${conversation.user.address.name}&nbsp;${conversation.user.address.surname.toString()}</div>
                <div>Date:</div>
                <div>${conversation.creationDate}</div>
            </div>
            <div class="message__message-container message-container">
                <c:forEach items="${listMessages}" var="message">
                <div class="message-container__item">
                    <div class="message-container__sender">
                        ${message.user.address.name}&nbsp;${message.user.address.surname}
                    </div>
                    <div class="message-container__text">
                        ${message.message}
                    </div>
                    <div class="message-container__time">
                        <%
                            MessageOut date = (MessageOut) pageContext.getAttribute("message");
                            long myDate = Date.from(date.getDate()).getTime();
                            long millisecond = new Date().getTime();
                            long second = (millisecond - myDate)/1000;
                            out.print( "<span>" +( second < 60? " now " : second < 3600 ? (second/60) + " minute ago" :  second < 86400 ? second/3600 + " hour ago" : second / 86400 + " day ago")+"</span>");
                        %>
                    </div>
                </div>
                </c:forEach>
            </div>

            <c:forEach var="i" begin="1" end="${totalPages}">
                <c:choose>
                    <c:when test="${currentPage != i}">
                        <a class = 'message_slider_active' href="/messages/conversation/${conversation.id}/${i}">${i}</a>
                    </c:when>
                    <c:otherwise>
                        <span class = 'message_slider_disable'>${i}</span>
                    </c:otherwise>
                </c:choose>
                &nbsp;
            </c:forEach>

            <c:if test="${currentPage < totalPages}">
                <a class = 'message_slider_active' href="/messages/conversation/${conversation.id}/${currentPage + 1}">Next</a>
            </c:if>
            <c:if test="${currentPage >= totalPages}">
                <span class = 'message_slider_disable'>Next</span>
            </c:if>

            <c:if test="${currentPage < totalPages}">
                <a class = 'message_slider_active' href="/messages/conversation/${conversation.id}/${totalPages}">Last</a>
            </c:if>
            <c:if test="${currentPage >= totalPages}">
                <span class = 'message_slider_disable'>Last</span>
            </c:if>

            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <form:form cssClass="message_form" method="POST" modelAttribute="messageForm">
            <div class="data__receiver">
                <div class="data__label">Answer
                </div>
                <form:input path = "message" type="text" placeholder="Answer"></form:input>
            </div>
            <button class="message-container__button form-button">
                Send
            </button>
            </form:form>
        </div>
    </main>
    <%@include file="components/footer.jsp" %>
</div>


<script src="${path}/js/burger.js"></script>

</body>

</html>