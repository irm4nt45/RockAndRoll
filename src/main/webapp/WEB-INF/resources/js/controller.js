//
// 'use strict';

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