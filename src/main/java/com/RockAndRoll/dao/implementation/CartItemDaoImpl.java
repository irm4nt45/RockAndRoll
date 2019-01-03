package com.RockAndRoll.dao.implementation;

import com.RockAndRoll.dao.CartItemDao;
import com.RockAndRoll.model.Cart;
import com.RockAndRoll.model.CartItem;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class CartItemDaoImpl implements CartItemDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addCartItem(CartItem cartItem){
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(cartItem);
        session.flush();
    }

    public void removeCartItem(CartItem cartItem){
        Session session = sessionFactory.getCurrentSession();
        session.delete(cartItem);
        session.flush();
    }

    public void removeAllCartItems(Cart cart){
        List<CartItem> cartItems = cart.getCartItems();

        for(CartItem cartItem : cartItems){
            removeCartItem(cartItem);
        }
    }

    public CartItem getCartItemByProductId(Integer productId){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from CartItem where productId = ?");
        query.setInteger(0,productId);
        session.flush();

        return (CartItem) query.uniqueResult();
    }
}
