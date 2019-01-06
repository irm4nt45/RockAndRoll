<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/template/header.jsp" %>

<div class="container-wrapper" style="margin-top: 250px;">

    <div class="container">
        <div class="page-header">
            <h1>Register customer</h1>
            <p class="lead">You can create your account here</p>
        </div>
        <form:form action="${pageContext.request.contextPath}/register"
                   method="post" commandName="customer"  >


        <h3>Basic info</h3>

        <div class="form-group">
            <label for="name">Name</label><form:errors path="customerName" cssStyle="color: #e4606d;"/>
            <form:input path="customerName" id="name" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="email">Email</label><span style="color:red">${emailMsg}</span>
            <form:errors path="customerEmail" cssStyle="color: #e4606d;"/>
            <form:input path="customerEmail" id="email" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="phone">Phone number</label>
            <form:input path="customerPhone" id="phone" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="username">Username</label><span style="color:red">${usernameMsg}</span>
            <form:errors path="username" cssStyle="color: #e4606d;"/>
            <form:input path="username" id="username" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <form:password path="password" id="password" class="form-Control" />
            <form:errors path="password" cssStyle="color: #e4606d;"/>
        </div>

        <h3>Billing address</h3>

        <div class="form-group">
            <label for="streetName">Street name</label>
            <form:input path="billingAddress.streetName" id="streetName" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="city">City</label>
            <form:input path="billingAddress.city" id="city" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="country">Country</label>
            <form:input path="billingAddress.country" id="country" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="zipCode">Zip code</label>
            <form:input path="billingAddress.zipCode" id="zipCode" class="form-Control" />
        </div>

        <h3>Shipping address</h3>
        <div class="form-group">
            <label for="streetName">Street name</label>
            <form:input path="shippingAddress.streetName" id="streetName" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="city">City</label>
            <form:input path="shippingAddress.city" id="city" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="country">Country</label>
            <form:input path="shippingAddress.country" id="country" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="zipCode">Zip code</label>
            <form:input path="shippingAddress.zipCode" id="zipCode" class="form-Control" />
        </div>
        <br>
        <br>
        <div>
            <input value="submit" type="submit" class="btn btn-default">
            <a class="btn btn-default" href="<c:url value="/"/>">Cancel</a>
        </div>
        </form:form>

<%@include file="/WEB-INF/view/template/footer.jsp" %>