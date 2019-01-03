package com.RockAndRoll.controller;

import com.RockAndRoll.dao.CartDao;
import com.RockAndRoll.dao.ProductDao;
import com.RockAndRoll.model.Cart;
import com.RockAndRoll.model.CartItem;
import com.RockAndRoll.model.Customer;
import com.RockAndRoll.model.Product;
import com.RockAndRoll.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/customer/cart")
public class CartController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping
    public String getCart(@AuthenticationPrincipal User activeUser){
        Customer customer = customerService.getCustomerByUsername(activeUser.getUsername());

        Integer cartId = customer.getCart().getCartId();

        return "redirect:/customer/cart/"+cartId;
    }

    @RequestMapping("/{cartId}")
    public String getCartRedirect(@PathVariable(value = "cartId") Integer cartId, Model model){
        model.addAttribute("cartId", cartId);

        return "cart";
    }
}
