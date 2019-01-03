<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/template/header.jsp" %>

<div class="container-wrapper" style="margin-top: 250px;">

    <div class="container">
        <div class="page-header">
            <h1>Add product</h1>
            <p class="lead">You can now edit the product</p>
        </div>
        <form:form action="${pageContext.request.contextPath}/admin/product/editProduct" method="post"
                   modelAttribute="product" >
        <form:hidden path="id" value="${product.id}"/>
        <div class="form-group">
            <label for="name">Name</label>
            <form:input path="productName" id="name" class="form-Control" value="${product.productName}"/>
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
            <form:textarea path="productDescription" id="description" class="form-Control" value="${product.productDescription}"/>
        </div>
        <div class="form-group">
            <label for="name">Price</label>
            <form:input path="productPrice" id="price" class="form-Control" value="${product.productPrice}"/>
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
            <form:input path="unitInStock" id="untitInStock" class="form-Control" value="${product.unitInStock}"/>
        </div>
        <div class="form-group">
            <label for="name">Manufacturer</label>
            <form:input path="productManufacturer" id="manufacturer" class="form-Control" value="${product.productManufacturer}"/>
        </div>
        <br>
        <br>
        <div>
            <input value="submit" type="submit" class="btn btn-default">
            <a class="btn btn-default" href="<c:url value="/admin/productInventory"/>">Cancel</a>
        </div>
        </form:form>

<%@include file="/WEB-INF/view/template/footer.jsp" %>