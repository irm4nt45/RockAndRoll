package com.RockAndRoll.service.implementation;

import com.RockAndRoll.dao.CartItemDao;
import com.RockAndRoll.model.Cart;
import com.RockAndRoll.model.CartItem;
import com.RockAndRoll.service.CartItemService;
import com.RockAndRoll.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartItemServiceImpl implements CartItemService {

    @Autowired
    private CartItemDao cartItemDao;

    public void addCartItem(CartItem cartitem){
        cartItemDao.addCartItem(cartitem);
    }

    public void removeCartItem(CartItem cartItem){
        cartItemDao.removeCartItem(cartItem);
    }

    public void removeAllCartItems(Cart cart){
        cartItemDao.removeAllCartItems(cart);
    }

    public CartItem getCartItemByProductId(Integer productId){
        return cartItemDao.getCartItemByProductId(productId);
    }
}
