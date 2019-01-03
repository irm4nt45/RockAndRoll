package com.RockAndRoll.dao;

import com.RockAndRoll.model.Customer;

import java.util.List;

public interface CustomerDao {
    void addCustomer(Customer customer);

    Customer getCustomerById(Integer customerId);

    List<Customer> getAllCustomers();

    Customer getCustomerByUsername(String username);
}
