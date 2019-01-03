package com.RockAndRoll.service.implementation;

import com.RockAndRoll.dao.CustomerOrderDao;
import com.RockAndRoll.model.Cart;
import com.RockAndRoll.model.CartItem;
import com.RockAndRoll.model.CustomerOrder;
import com.RockAndRoll.service.CartService;
import com.RockAndRoll.service.CustomerOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerOrderServiceImp implements CustomerOrderService {

    @Autowired
    CustomerOrderDao customerOrderDao;

    @Autowired
    CartService cartService;

    public void addCustomerOrder(CustomerOrder customerOrder){
        customerOrderDao.addCustomerOrder(customerOrder);
    }

    public double getCustomerOrderGrandTotal(Integer cartId){
        double grandTotal = 0;
        Cart cart = cartService.getCartById(cartId);
        List<CartItem> cartItems = cart.getCartItems();

        for(CartItem cartItem : cartItems){
        grandTotal += cartItem.getTotalPrice();
    }

    return grandTotal;
    }
}
