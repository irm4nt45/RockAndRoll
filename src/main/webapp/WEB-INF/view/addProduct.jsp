<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/1/2018
  Time: 2:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/template/header.jsp" %>

<div class="container-wrapper" style="margin-top: 250px;">

    <div class="container">
        <div class="page-header">
            <h1>Add product</h1>
            <p class="lead">Add new products that just arrived!</p>
        </div>
        <form:form action="${pageContext.request.contextPath}/admin/product/addProduct"
                   method="post" commandName="product"  >


            <form:hidden path="id" />

        <div class="form-group">
            <label for="name">Name</label>
            <form:errors path="productName" cssStyle="color: red"/>
            <form:input path="productName" id="name" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="category">Category</label>
            <label class="check-inline" >
                <form:radiobutton path="productCategory" id="category" value="Instrument"/>
                Instrument
            </label>
            <label class="check-inline" >
                <form:radiobutton path="productCategory" id="category" value="Record"/>
                Record
            </label>
            <label class="check-inline" >
                <form:radiobutton path="productCategory" id="category" value="Accessory"/>
                Accessory
            </label>
        </div>
        <div class="form-group">
            <label for="name">Description</label>
            <form:textarea path="productDescription" id="description" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="name">Price</label>
            <form:errors path="productPrice" cssStyle="color: red"/>
            <form:input path="productPrice" id="price" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="category">Condition</label>
            <label class="check-inline" >
                <form:radiobutton path="productCondition" id="condition" value="New"/>
                New
            </label>
            <label class="check-inline" >
                <form:radiobutton path="productCondition" id="condition" value="Used"/>
                Used
            </label>
        </div>
        <div class="form-group">
            <label for="category">Product status</label>
            <label class="check-inline" >
                <form:radiobutton path="productStatus" id="status" value="Active"/>
                Active
            </label>
            <label class="check-inline" >
                <form:radiobutton path="productStatus" id="status" value="Inactive"/>
                Inactive
            </label>
        </div>
        <div class="form-group">
            <label for="name">Unit in stock</label>
            <form:errors path="unitInStock" cssStyle="color: red"/>
            <form:input path="unitInStock" id="untitInStock" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="name">Manufacturer</label>
            <form:input path="productManufacturer" id="manufacturer" class="form-Control" />
        </div>
        <br>
        <br>
        <div>
            <input value="submit" type="submit" class="btn btn-default">
            <a class="btn btn-default" href="<c:url value="/admin/productInventory"/>">Cancel</a>
        </div>
    </form:form>

<%@include file="/WEB-INF/view/template/footer.jsp" %>