<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@include file="/WEB-INF/view/template/header.jsp" %>

<script>
    $(document).ready(function () {
        var searchCondition = '${searchCondition}';

        $('.table').DataTable({
            "lengthMenu": [[1,3,5,10,-1],[1,3,5,10,"All products"]],
            "oSearch" : {"sSearch": searchCondition}
        });
    });
</script>

    <div class="container-wrapper" style="margin-top: 250px;">
       <div class="container">
           <div class="page-header">
               <h1>All products</h1>
               <p class="lead">Check all the osom products available</p>
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
                       <img src="<c:url value="/resources/images/${product.id}.png"/>" alt="image" style="width: 100%"/>
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
                   </td>
               </tr>
               </c:forEach>
           </table>

<%@include file="/WEB-INF/view/template/footer.jsp" %>