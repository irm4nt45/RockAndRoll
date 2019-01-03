package com.RockAndRoll.controller;

import com.RockAndRoll.model.Cart;
import com.RockAndRoll.model.CartItem;
import com.RockAndRoll.model.Customer;
import com.RockAndRoll.model.Product;
import com.RockAndRoll.service.CartItemService;
import com.RockAndRoll.service.CartService;
import com.RockAndRoll.service.CustomerService;
import com.RockAndRoll.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/rest/cart")
public class CartResources {

    @Autowired
    private CartService cartService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CartItemService cartItemService;

    @RequestMapping("/{cartId}")
    public @ResponseBody Cart getCart(@PathVariable(value = "cartId") Integer cartId, Model model){
        return cartService.getCartById(cartId);
    }

    @RequestMapping(value = "/add/{id}", method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void addItem(@PathVariable(value = "id") Integer id, Model model, @AuthenticationPrincipal User activeUser){
        Customer customer = customerService.getCustomerByUsername(activeUser.getUsername());

        Cart cart = customer.getCart();
        Product product = productService.getProductById(id);
        List<CartItem> cartItems = cart.getCartItems();

        for(CartItem item : cartItems){
            if(product.getId() == item.getProduct().getId()){
                item.setQuantity(item.getQuantity() + 1);
                item.setTotalPrice(item.getQuantity()*product.getProductPrice());
                cartItemService.addCartItem(item);

                return;
            }
        }
        CartItem item = new CartItem();
        item.setProduct(product);
        item.setQuantity(1);
        item.setTotalPrice(item.getQuantity()*product.getProductPrice());
        item.setCart(cart);
        cartItemService.addCartItem(item);
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void removeItem(@PathVariable("id") Integer id){
        CartItem cartItem = cartItemService.getCartItemByProductId(id);
        cartItemService.removeCartItem(cartItem);
    }

    @RequestMapping(value = "/{cartId}", method = RequestMethod.DELETE)
    public void clearCart(@PathVariable(value = "cartId") Integer cartId){
        Cart cart = cartService.getCartById(cartId);
        cartItemService.removeAllCartItems(cart);
    }

    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "illigal request, please verify your pay load")
    public void handleClientErrors (Exception o){}

    @ExceptionHandler(Exception.class)
    @ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "internal server error")
    public void handleServerErrors (Exception o){}
}
