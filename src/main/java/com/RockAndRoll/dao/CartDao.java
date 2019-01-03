package com.RockAndRoll.dao;


import com.RockAndRoll.model.Cart;

import java.io.IOException;

public interface CartDao {

    Cart getCartById(Integer cartId);

    Cart validate(Integer cartId) throws IOException;

    void update(Cart cart);

//    Cart create(Cart cart);
//
//    Cart read(String cartId);
//
//    void updateCart(String cartId, Cart cart);
//
//    void deleteCart(String cartId);
}
