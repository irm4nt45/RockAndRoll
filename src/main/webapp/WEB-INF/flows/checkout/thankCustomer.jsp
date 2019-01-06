<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@include file="/WEB-INF/view/template/header.jsp" %>

<div class="container">
        <div class="jumbotron">
            <div class="container">
                <h1>Thank you for your order!</h1>
            </div>
        </div>
        <p>
            <a href="<spring:url value="/"/>" class="btn btn-default"/>Okay</a>
        </p>
</div>


<%@include file="/WEB-INF/view/template/footer.jsp" %>
