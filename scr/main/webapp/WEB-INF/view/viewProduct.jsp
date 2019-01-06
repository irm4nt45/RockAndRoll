<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/WEB-INF/view/template/header.jsp" %>


<div class="container-wrapper" style="margin-top: 250px;">

    <div class="container">
        <div class="page-header">
            <h1>Products details</h1>
            <p class="lead">Ther is all details about the product</p>
        </div>


        <div class="container"  ng-app = "cartApp" >
            <script scr="<c:url value="//resources/js/controller.js"/>"></script>

            <div class="row">
                <div class="col-md-5">
                    <img src="<c:url value="/resources/images/${product.id}.png"/>" alt="image" style="width: 100%"/>
                </div>
                <div class="col-md-5" >
                    <h3>${product.productName}</h3>
                    <p>${product.productManufacturer}</p>
                    <p>${product.productCategory}</p>
                    <p>${product.productCondition}</p>
                    <p>${product.productPrice}</p>
                    <br>
                    <c:set var="role" scope = "page" value="${param.role}" />
                    <c:set var="url" scope = "page" value="/product/productList" />
                    <c:if test="${role = 'admin'}" >
                        <c:set var="url" scope="page" value="/admin/productInventory"/>
                    </c:if>
                    <p ng-controller="cartCtrl">
                        <a href="<c:url value="${url}"/>" class="btn btn-default">Back</a>

                        <a href="#" calss="btn btn-warning" ng-click="addToCart('${product.id}')">
                            <i class="fab fa-jedi-order"></i>Add to Cart  </a>



                        <%--<a href="<spring:url value="/rest/cart/add/${product.id}"/>"--%>
                           <%--class="btn btn-warning btn-large">Add to Cart--%>
                            <%--<i class="fab fa-jedi-order"></i>--%>
                        <%--</a>--%>
                        <a href="<spring:url value="/customer/cart" />" class="btn btn-default">View cart<i class="fas fa-shopping-cart"></i> </a>
                    </p>
                </div>
            </div>

            <%--<script scr="<c:url value="//resources/js/angular.js"/>"></script>--%>

        </div>
    </div>
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
            $http.delete('/RockAndRoll/rest/cart/' + $scope.cartId).success($scope.refreshCart());
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
