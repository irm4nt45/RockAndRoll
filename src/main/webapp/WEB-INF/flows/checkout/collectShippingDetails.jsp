<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/view/template/header.jsp" %>

<div class="container-wrapper" style="margin-top: 250px;">

    <div class="container">
        <div class="page-header">
            <h1>Customer</h1>
            <p class="lead">Customer details</p>
        </div>
        <form:form commandName="order" class="form-horizontal" >
        
        <h3>Shipping address</h3>

        <div class="form-group">
            <label for="streetName">Street name</label>
            <form:input path="cart.customer.shippingAddress.streetName" id="streetName" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="city">City</label>
            <form:input path="cart.customer.shippingAddress.city" id="city" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="country">Country</label>
            <form:input path="cart.customer.shippingAddress.country" id="country" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="zipCode">Zip code</label>
            <form:input path="cart.customer.shippingAddress.zipCode" id="zipCode" class="form-Control" />
        </div>

        <input type="hidden" name="_flowExecutionKey"/>

        <br>
        <br>
        <div>
            <button class="btn btn-default" name="_eventId_backToCollectCustomerInfo">Back</button>
            <input value="Next" type="submit" class="btn btn-default" name="_eventId_shippingDetailsCollected">
            <button class="btn btn-default" name="_eventId_cancel">Cancel</button>
        </div>
        </form:form>

<%@include file="/WEB-INF/view/template/footer.jsp" %>