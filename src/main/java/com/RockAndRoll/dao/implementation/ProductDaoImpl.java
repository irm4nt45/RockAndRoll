package com.RockAndRoll.dao.implementation;

import com.RockAndRoll.dao.ProductDao;
import com.RockAndRoll.model.Product;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class ProductDaoImpl implements ProductDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addProduct(Product product){
        Session session =  sessionFactory.getCurrentSession();
        session.saveOrUpdate(product);
        session.flush();
    }

    public void editProduct(Product product){
        Session session =  sessionFactory.getCurrentSession();
        session.saveOrUpdate(product);
        session.flush();
    }

    public void deleteProduct(Product product){
        Session session =  sessionFactory.getCurrentSession();
        session.delete(product);
        session.flush();
    }


    public Product getProductById(Integer id){
        Session session = sessionFactory.getCurrentSession();
        Product product = (Product) session.get(Product.class, id);
        session.flush();
        System.out.println("return product from session factory");
        return product;
    }

    public List<Product> getProductList(){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Product");
        List<Product> products = query.list();
        session.flush();

        return products;
    }
//    public List<Product> getAllProducts(){
//        Session session = sessionFactory.getCurrentSession();
//        Query query = session.createQuery("from Product");
//        List<Product> products = query.list();
//        session.flush();
//
//        return products;
//    }

//    public void deleteProduct(String productId) {
//        Session session = sessionFactory.getCurrentSession();
//        session.delete(getProductById(productId));
//        session.flush();
//    }
}
