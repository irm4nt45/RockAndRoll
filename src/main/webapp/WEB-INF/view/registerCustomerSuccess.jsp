<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@include file="/WEB-INF/view/template/header.jsp" %>

<div class="container">
    <section>
        <div class="jumbotron">
            <div class="container">
                <h1>Customer registred successfully</h1>
            </div>
        </div>
    <p>
    <a href="<spring:url value="/product/productList"/>" class="btn btn-default"/>Products</a>
    </p>
</div>
</div>
</div>

<%@include file="/WEB-INF/view/template/footer.jsp" %>
