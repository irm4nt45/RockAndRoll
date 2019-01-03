package com.RockAndRoll.service.implementation;

import com.RockAndRoll.dao.CustomerDao;
import com.RockAndRoll.model.Customer;
import com.RockAndRoll.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    CustomerDao customerDao;

    public void addCustomer(Customer customer){
        customerDao.addCustomer(customer);
    }

    public Customer getCustomerById(Integer customerId){
        return customerDao.getCustomerById(customerId);
    }

    public List<Customer> getAllCustomers(){
        return customerDao.getAllCustomers();
    }

    public Customer getCustomerByUsername(String username){return customerDao.getCustomerByUsername(username);}
}
