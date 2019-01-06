<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@include file="/WEB-INF/view/template/header.jsp" %>

<div class="container">
    <section>
        <div class="jumbotron">
            <div class="container">
                <h1>Cart</h1>

                <p>All the selected products in your shopping cart</p>
            </div>
        </div>
    </section>
    <section ng-app = "cartApp">

        <script scr="<c:url value="//resources/js/controller.js"/>"></script>
    <div ng-controller="cartCtrl" ng-init="initCartId('${cartId}')">
        <div>
        <a class="btn btn-danger pull-left" data-ng-click="clearCart()">Clear cart</a>
            <a class="btn button-success pull-right" href="<spring:url value="/order/${cartId}"/> "><span>Cart checkout</span></a>
    <%--<a href="<spring:url value="/rest/cart/deleteCart/${cartId}"/>"  class="btn-dark"/>Clear Cart</a>--%>
    </div>

        <table class="table table-hover">
            <tr>
                <th>Product</th>
                <th>Unit price</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <tr ng-repeat="item in cart.cartItems">
                <td>{{item.product.productName}}</td>
                <td>{{item.product.productPrice}}</td>
                <td>{{item.quantity}}</td>
                <td>{{item.totalPrice}}</td>
                <td><a href="#" data-ng-click="removeFromCart(item.product.id)">Remove<i class="fas fa-trash-alt"></i></a></td>

            </tr>
        <%--<c:forEach items="${cartItemList}" var="cartItem">--%>
            <%--<tr>--%>
                <%--<td>${cartItem.product.productName}</td>--%>
                <%--<td>${cartItem.product.productPrice}</td>--%>
                <%--<td>${cartItem.quantity}</td>--%>
                <%--<td>${cartItem.totalPrice}</td>--%>
                <%--<td></th>--%>
                <%--<td><a href="<spring:url value="/rest/cart/remove/${cartItem.product.productId}"/> " class="label label-danger">Remove<i class="fas fa-trash-alt"></i></a></td>--%>
            <%--</tr>--%>
        <%--</c:forEach>--%>
            <tr>
                <td></td>
                <td></td>
                <td>Grand Total</td>
                <td>${grandTotal}</td>
                <td>{{calGrandTotal()}}</td>
            </tr>
        </table>
            <a href="<spring:url value="/product/productList"/>" class="btn btn-default"/>Continue shopping</a>
        </div>

        <%--<script scr="<c:url value="//resources/js/angular.js"/>"></script>--%>
        <%--<script scr="<c:url value="//resources/js/controller.js"/>"></script>--%>

</section>
</div>
<script>

    var app = angular.module('cartApp', []);

    app.controller('cartCtrl', function($scope, $http){

        $scope.refreshCart = function(){
            $http.get('/RockAndRoll/rest/cart/' + $scope.cartId).success(function(data){
                $scope.cart=data;
            });
        };

        $scope.clearCart = function(){
            $http.delete('/RockAndRoll/rest/cart/' + $scope.cartId).success($scope.refreshCart().success(function(){
                alert("Product added successfully");
            })
                );
        };

        $scope.initCartId = function(cartId){
            $scope.cartId = cartId;
            $scope.refreshCart(cartId);
        };

        $scope.addToCart = function(id){
            $http.put('/RockAndRoll/rest/cart/add/' + id).success(function(){
                alert("Product added successfully");
            });
        };

        $scope.removeFromCart = function(id){
            $http.put('/RockAndRoll/rest/cart/remove/' + id).success(function(data){
                $scope.refreshCart();
            });
        };

        $scope.calGrandTotal = function (){
            var grandTotal = 0;

            for(var i=0; i<$scope.cart.cartItems.length; i++){
                grandTotal += $scope.cart.cartItems[i].totalPrice;
            }

            return grandTotal;
        };
    });
</script>

<%@include file="/WEB-INF/view/template/footer.jsp" %>
