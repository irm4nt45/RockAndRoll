package com.RockAndRoll.service;

import com.RockAndRoll.model.Customer;
import org.springframework.stereotype.Service;

import java.util.List;


public interface CustomerService {

    void addCustomer(Customer customer);

    Customer getCustomerById(Integer customerId);

    List<Customer> getAllCustomers();

    Customer getCustomerByUsername(String username);

}
