package com.RockAndRoll.dao.implementation;

import com.RockAndRoll.dao.CustomerOrderDao;
import com.RockAndRoll.model.CustomerOrder;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public class CustomerOrderDaoImp implements CustomerOrderDao {

    @Autowired
    SessionFactory sessionFactory;

    public void addCustomerOrder(CustomerOrder customerOrder){
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(customerOrder);
        session.flush();
    }
}
