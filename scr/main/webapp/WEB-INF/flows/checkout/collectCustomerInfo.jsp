<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/template/header.jsp" %>

<div class="container-wrapper" style="margin-top: 250px;">

    <div class="container">
        <div class="page-header">
            <h1>Customer</h1>
            <p class="lead">Customer details</p>
        </div>
        <form:form commandName="order" class="form-horizontal" >


        <h3>Basic info</h3>

        <div class="form-group">
            <label for="name">Name</label>
            <form:input path="cart.customer.customerName" id="name" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <form:input path="cart.customer.customerEmail" id="email" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="phone">Phone number</label>
            <form:input path="cart.customer.customerPhone" id="phone" class="form-Control" />
        </div>

        <h3>Billing address</h3>

        <div class="form-group">
            <label for="streetName">Street name</label>
            <form:input path="cart.customer.billingAddress.streetName" id="streetName" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="city">City</label>
            <form:input path="cart.customer.billingAddress.city" id="city" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="country">Country</label>
            <form:input path="cart.customer.billingAddress.country" id="country" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="zipCode">Zip code</label>
            <form:input path="cart.customer.billingAddress.zipCode" id="zipCode" class="form-Control" />
        </div>

        <input type="hidden" name="_flowExecutionKey"/>

        <br>
        <br>
        <div>
            <input value="Next" type="submit" class="btn btn-default" name="_eventId_customerInfoCollected">
            <button class="btn btn-default" name="_eventId_cancel">Cancel</button>
        </div>
        </form:form>

<%@include file="/WEB-INF/view/template/footer.jsp" %>