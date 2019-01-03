package com.RockAndRoll.service;

import com.RockAndRoll.model.Cart;
import org.springframework.stereotype.Service;

public interface CartService {

    Cart getCartById(Integer cartId);

    void update(Cart cart);
}
