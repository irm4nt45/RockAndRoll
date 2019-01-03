<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/view/template/header.jsp" %>

<script>
    $(document).ready(function () {

        $('.table').DataTable({
            "lengthMenu": [[1,3,5,10,-1],[1,3,5,10,"All products"]],
        });
    });
</script>
<div class="container-wrapper" style="margin-top: 250px;">

    <div class="container">
        <div class="page-header">
            <h1>Product inventory page</h1>
            <p class="lead">This is the product inventory page</p>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr class="bg-success">
                <th>

                </th>
                <th>
                    Product Name
                </th>
                <th>
                    Category
                </th>
                <th>
                    Condition
                </th>
                <th>
                    Price
                </th>
                <th>

                </th>
            </tr>
            </thead>
            <c:forEach items="${products}" var="product" >
                <tr>
                    <td>
                        <img src="#" alt="image"/>
                    </td>
                    <td>
                            ${product.productName}
                    </td>
                    <td>
                            ${product.productCategory}
                    </td>
                    <td>
                            ${product.productCondition}
                    </td>
                    <td>
                            ${product.productPrice}
                    </td>
                    <td>
                        <a href="<spring:url value="/product/viewProduct/${product.id}"/> ">
                            <i class="fas fa-question-circle"></i>
                        </a>
                        <a href="<spring:url value="/admin/product/deleteProduct/${product.id}"/> ">
                            <i class="fas fa-trash-alt"></i>
                        </a>
                        <a href="<spring:url value="/admin/product/editProduct/${product.id}"/> ">
                            <i class="fas fa-pencil-alt"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="<spring:url value="/admin/product/addProduct" />" class="btn btn-outline-primary">Add product</a>

<%@include file="/WEB-INF/view/template/footer.jsp" %>