package com.RockAndRoll.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Entity
public class Cart implements Serializable {

    private static final long serialVersionUID = 7689605555681852469L;

    @Id
    @GeneratedValue
    private Integer cartId;

    @OneToMany(mappedBy = "cart", cascade = CascadeType.ALL, fetch = FetchType.EAGER )
    private List<CartItem> cartItems;

    @OneToOne
    @JoinColumn(name = "customerId")
    @JsonIgnore
    private Customer customer;

    private double grandTotal;

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public double getGrandTotal() {
        return grandTotal;
    }

    public void setGrandTotal(double grandTotal) {
        this.grandTotal = grandTotal;
    }
//    private String cartId;
//    private Map<String, CartItem> cartItems;

//
//    private Cart(){
//        cartItems = new HashMap<String, CartItem>();
//        grandTotal = 0.0;
//    }
//
//    public Cart(String cartId){
//        this();
//        this.cartId = cartId;
//    }
//
//    public void addCartItem(CartItem item){
//        String productId = item.getProduct().getProductId();
//
//        if(cartItems.containsKey(productId)){
//            CartItem existingCartItems = cartItems.get(productId);
//            existingCartItems.setQuantity(existingCartItems.getQuantity() + item.getQuantity());
//            cartItems.put(productId, existingCartItems);
//        } else{
//            cartItems.put(productId, item);
//        }
//        System.out.println("--------------------updatE grandTotal!!!");
//        updateGrandTotal();
//    }
//
//    public void removeCartItem(CartItem item){
//        String productId = item.getProduct().getProductId();
//        cartItems.remove(productId);
//        updateGrandTotal();
//    }
//
//    public void updateGrandTotal(){
//        grandTotal = 0.0;
//        for (CartItem item : cartItems.values()){
//            grandTotal = grandTotal + item.getTotalPrice();
//            System.out.println("-----------------------------------updating grandTotal" + grandTotal);
//        }
//    }
//
//    public String getCartId() {
//        return cartId;
//    }
//
//    public void setCartId(String cartId) {
//        this.cartId = cartId;
//    }
//
//    public Map<String, CartItem> getCartItems() {
//        return cartItems;
//    }
//
//    public void setCartItems(Map<String, CartItem> cartItems) {
//        this.cartItems = cartItems;
//    }
//
//    public Double getGrandTotal() {
//        return grandTotal;
//    }
//
//    public void setGrandTotal(Double grandTotal) {
//        this.grandTotal = grandTotal;
//    }
//
//    public Integer getShopingCartId() {
//        return shopingCartId;
//    }
//
//    public void setShopingCartId(Integer shopingCartId) {
//        this.shopingCartId = shopingCartId;
//    }
//
//    public List<CartItem> getShopingCartItems() {
//        return shopingCartItems;
//    }
//
//    public void setShopingCartItems(List<CartItem> shopingCartItems) {
//        this.shopingCartItems = shopingCartItems;
//    }
//
//    public Customer getCustommer() {
//        return custommer;
//    }
//
//    public void setCustommer(Customer custommer) {
//        this.custommer = custommer;
//    }
}
