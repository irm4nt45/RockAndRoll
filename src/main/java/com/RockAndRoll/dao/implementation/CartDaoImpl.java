package com.RockAndRoll.dao.implementation;

import com.RockAndRoll.dao.CartDao;
import com.RockAndRoll.model.Cart;
import com.RockAndRoll.service.CustomerOrderService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static java.lang.String.format;

@Repository
@Transactional
public class CartDaoImpl implements CartDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private CustomerOrderService customerOrderService;

    public Cart getCartById(Integer cartId){
        Session session = sessionFactory.getCurrentSession();

        return (Cart) session.get(Cart.class, cartId);
    }

    public void update(Cart cart){
        Integer cartId = cart.getCartId();
        double grandTotal = customerOrderService.getCustomerOrderGrandTotal(cartId);
        cart.setGrandTotal(grandTotal);

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(cart);
    }

    public Cart validate(Integer cartId) throws IOException {
        Cart cart = getCartById(cartId);
        if(cart.getCartItems().size() == 0|| cart == null){
            throw new IOException(cartId + "");
        }

        update(cart);
        return cart;
    }

//    private Map<String, Cart> listOfCarts;
//
//    public CartDaoImplementation(){
//        listOfCarts = new HashMap<String, Cart>();
//    }
//
//    public Cart create(Cart cart){
//        if(listOfCarts.containsKey(cart.getCartId())){
//            throw new IllegalArgumentException(String.format("Can not create a cart. A cart with this id(%) already exist", cart.getCartId()));
//        }
//        listOfCarts.put(cart.getCartId(), cart);
//
//        return cart;
//    }
//
//    public Cart read(String cartId){
//        return listOfCarts.get(cartId);
//    }
//
//    public void updateCart(String cartId, Cart cart){
//        if(!listOfCarts.containsKey(cartId)){
//            throw new IllegalArgumentException(String.format("invalid cart id(%)", cartId));
//        }
//        listOfCarts.put(cartId, cart);
//    }
//
//    public void deleteCart(String cartId){
//        if(!listOfCarts.containsKey(cartId)){
//            throw new IllegalArgumentException(String.format("Can't delete cart(%)", cartId));
//        }
//        listOfCarts.remove(cartId);
//    }
}


