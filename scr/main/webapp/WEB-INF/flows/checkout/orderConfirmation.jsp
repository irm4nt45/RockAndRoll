<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/view/template/header.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>

<div class="container-wrapper" style="margin-top: 250px;">

    <div class="container">
        <div class="page-header">
            <h1>Order</h1>
            <p class="lead">Order confirmation</p>
        </div>

        <div class="container">
            <div class="row">

        <form:form commandName="order" class="form-horizontal" >

            <div class="well col-xs-10 col-sm-10 col-md-0 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">

                <div class="text-center">
                    <h1>Receipt</h1>
                </div>
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <strong>Shipping Address</strong><br>
                        ${order.cart.customer.shippingAddress.streetName}
                        <br>
                            ${order.cart.customer.shippingAddress.city}
                        <br>
                            ${order.cart.customer.shippingAddress.country}
                        <br>
                            ${order.cart.customer.shippingAddress.zipCode}
                        <br>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                        <p>Shipping date: <fmt:formatDate type="date" value="${now}" /></p>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <strong>Billing Address</strong><br>
                            ${order.cart.customer.billingAddress.streetName}
                        <br>
                            ${order.cart.customer.billingAddress.city}
                        <br>
                            ${order.cart.customer.billingAddress.country}
                        <br>
                            ${order.cart.customer.billingAddress.zipCode}
                        <br>
                    </div>
                    <div class="row">
                        <table class="table table-hower">
                            <thead>
                            <tr>
                                <th>Product</th>
                                <th>#</th>
                                <th>Price</th>
                                <th>Total price</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="cartItem" items="${order.cart.cartItems}">
                                <tr>
                                    <td class="col-md-9"><em>${cartItem.product.productName}</em></td>
                                    <td class="col-md-1" style="text-align: center"><em>${cartItem.quantity}</em></td>
                                    <td class="col-md-1" style="text-align: center"><em>${cartItem.product.productPrice}</em></td>
                                    <td class="col-md-1" style="text-align: center"><em>${cartItem.totalPrice}</em></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td class="text-right">
                                        <h4><strong>Grand Total Is:</strong></h4>
                                    </td>
                                    <td class="text-center">
                                        <h4><strong>${order.cart.grandTotal}</strong></h4>
                                            </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
        <input type="hidden" name="_flowExecutionKey"/>

        <br>
        <br>
        <div>
            <button class="btn btn-default" name="_eventId_backToCollectShippingDetails">Back</button>
            <input value="Submit Order" type="submit" class="btn btn-default" name="_eventId_orderConfirmed">
            <button class="btn btn-default" name="_eventId_cancel">Cancel</button>
        </div>
            </div>
        </form:form>
            </div>

        </div>

<%@include file="/WEB-INF/view/template/footer.jsp" %>