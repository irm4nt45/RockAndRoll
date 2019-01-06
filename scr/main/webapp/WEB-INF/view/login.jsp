<%@ taglib prefix="value" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/view/template/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
    <div id="login-box" style="margin-top: 250px">
        <h2>Login with user name and password</h2>
        <c:if test="${not empty msg}">
            <div class="msg">${msg}</div>
        </c:if>
        <form name="loginForm" action="<c:url value="/perform_login"/>" method="post"/>
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        <div class="form-group">
            <label for="username">User:</label>
            <input type="text" id="username" name="username" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" class="form-control"/>
        </div>
        <input class="button" type="submit" value="Submit" />
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </div>
</div>

<%@include file="/WEB-INF/view/template/footer.jsp" %>
