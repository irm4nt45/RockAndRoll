package com.RockAndRoll.controller;

import com.RockAndRoll.model.Cart;
import com.RockAndRoll.model.Customer;
import com.RockAndRoll.model.CustomerOrder;
import com.RockAndRoll.service.CartService;
import com.RockAndRoll.service.CustomerOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

    @Autowired
    private CartService cartService;

    @Autowired
    CustomerOrderService customerOrderService;

    @RequestMapping("order/{cartId}")
    public String createOrder(@PathVariable("cartId") Integer cartId){
        CustomerOrder customerOrder = new CustomerOrder();
        Cart cart = cartService.getCartById(cartId);
        customerOrder.setCart(cart);

        Customer customer = cart.getCustomer();
        customerOrder.setCustomer(customer);
        customerOrder.setBillingAddress(customer.getBillingAddress());
        customerOrder.setShippingAddress(customer.getShippingAddress());

        customerOrderService.addCustomerOrder(customerOrder);
        System.out.println("-------------------" +cart.getCartId().toString());

        return "redirect:/checkout?cartId=" + cartId;
    }
}