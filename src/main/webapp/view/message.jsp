<%@ page language="java" contentType="text/html;"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
         <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
            <%@include file="components/menuEmployee.jsp" %>
         </sec:authorize>
         <sec:authorize access="hasRole('ROLE_USER')">
            <%@include file="components/menu.jsp" %>
         </sec:authorize>
         <div class="data message">
            <div class="form-title message__title">
               My messages
            </div>
            <div class="message__label">
               Create a message
            </div>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <form:form method="POST" modelAttribute="convertationForm">
            <form class="data__form">
               <div class="data__receiver message__topic">
                  <div class="data__label">Topic
                  </div>
                  <form:input path = "topic" type="text" placeholder="Theme"></form:input>
               </div>
               <div class="data__receiver message__description">
                  <div class="data__label">Title
                  </div>
                  <form:input path = "description" type="text" placeholder="Title"></form:input>
               </div>
               <button class="form-button message__button">
                  Send
               </button>
            </form>
            </form:form>

            <div class="card-details__transactions transactions-card-details">
               <div class="transactions-card-details__title">
                  Sent messages
               </div>
               <div class="transactions-card-details__table_wrapper">
                  <table class="transactions-card-details__table message__table">
                     <tr>
                        <th>Topic</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Revision</th>
                     </tr>
                     <c:forEach items="${allConversation}" var="message">
                        <tr>
                           <td>${message.topic}</td>
                           <td>${message.creationDate}</td>
                           <td>${message.conversationStatus}</td>
                           <td>
                              <a href="${path}/messages/conversation/${message.id}/1">
                              <button class="form-button message__history-btn">
                                 Revision
                              </button>
                              </a>
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
</body>

</html>