<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@include file="/WEB-INF/view/template/header.jsp" %>

<div class="container-wrapper" style="margin-top: 250px;">
    <div class="container">
        <div class="page-header">
            <h1>Customer Management page</h1>
            <p class="lead">This is system management page</p>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr class="bg-success">
                <th>

                </th>
                <th>
                    Name
                </th>
                <th>
                    Email
                </th>
                <th>
                    Phone number
                </th>
                <th>
                    Username
                </th>
                <th>
                    enabled
                </th>
            </tr>
            </thead>
            <c:forEach items="${customerList}" var="customer" >
                <tr>
                    <td>

                    </td>
                    <td>
                            ${customer.customerName}
                    </td>
                    <td>
                            ${customer.customerEmail}
                    </td>
                    <td>
                            ${customer.customerPhone}
                    </td>
                    <td>
                            ${customer.username}
                    </td>
                    <td>
                            ${customer.enabled}
                    </td>
                </tr>
            </c:forEach>
        </table>

<%@include file="/WEB-INF/view/template/footer.jsp" %>