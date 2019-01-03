package com.RockAndRoll.controller;

import com.RockAndRoll.model.BillingAddress;
import com.RockAndRoll.model.Customer;
import com.RockAndRoll.model.ShippingAddress;
import com.RockAndRoll.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.List;

@Controller
public class RegisterController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/register")
    public String registerCustomer(Model model){
        Customer customer = new Customer();
        BillingAddress billingAddress = new BillingAddress();
        ShippingAddress shippingAddress = new ShippingAddress();
        customer.setBillingAddress(billingAddress);
        customer.setShippingAddress(shippingAddress);

        model.addAttribute("customer", customer);

        return "registerCustomer";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerCostumerPost(@Valid @ModelAttribute("customer") Customer customer, BindingResult result, Model model){

        if(result.hasErrors()){
            return "registerCustomer";
        }

        List<Customer> customerList = customerService.getAllCustomers();

        for(Customer checkCustumer : customerList){
            if(customer.getCustomerEmail().equals(checkCustumer.getCustomerEmail())){
                model.addAttribute("emailMsg", "Email already taken, please choose another one");

                return "registerCustomer";
            }
        }

        for(Customer checkCustumer : customerList){
            if(customer.getUsername().equals(checkCustumer.getUsername())){
                model.addAttribute("usernameMsg", "Username already taken, please choose another one");

                return "registerCustomer";
            }
        }

        customer.setEnabled(true);
        customerService.addCustomer(customer);

        return "registerCustomerSuccess";
    }
}
