package com.RockAndRoll.service.implementation;

import com.RockAndRoll.dao.CartDao;
import com.RockAndRoll.model.Cart;
import com.RockAndRoll.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDao cartDao;

    public Cart getCartById(Integer cartId){
        return cartDao.getCartById(cartId);
    }

    public void update(Cart cart){
       cartDao.update(cart);
    }

}
