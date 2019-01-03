package com.RockAndRoll.service;

import com.RockAndRoll.model.Cart;
import com.RockAndRoll.model.CartItem;

public interface CartItemService {

    void addCartItem(CartItem cartitem);

    void removeCartItem(CartItem cartItem);

    void removeAllCartItems(Cart cart);

    CartItem getCartItemByProductId(Integer productId);
}
