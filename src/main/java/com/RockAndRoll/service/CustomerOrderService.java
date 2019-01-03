package com.RockAndRoll.service;

import com.RockAndRoll.model.CustomerOrder;
import org.springframework.stereotype.Service;

public interface CustomerOrderService {

    void addCustomerOrder(CustomerOrder customerOrder);

    double getCustomerOrderGrandTotal(Integer cartId);
}
