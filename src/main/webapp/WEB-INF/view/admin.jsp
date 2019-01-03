
<%@include file="/WEB-INF/view/template/header.jsp" %>

<div class="container-wrapper" style="margin-top: 250px;">
    <div class="container">
        <div class="page-header">
            <h1>Administrator page</h1>
            <p class="lead">This is administrator page</p>
        </div>
        <c:if test="${pageContext.request.userPrincipal.name != null}" >
        <h3> Welcome ${pageContext.request.userPrincipal.name} !  | <a href="<c:url value="/logout"/> ">Logout</a> </h3>
        </c:if>
        <h3>
            <a href="<c:url value="/admin/productInventory"/> ">Product inventory</a>
        </h3>
        <p>There you can view, add, edit and delete products</p>

        <h3>
            <a href="<c:url value="/admin/customer"/> ">Customer management</a>
        </h3>

        <p>There you can view customers information</p>

        <%@include file="/WEB-INF/view/template/footer.jsp" %>
