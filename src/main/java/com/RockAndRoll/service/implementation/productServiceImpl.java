package com.RockAndRoll.service.implementation;

import com.RockAndRoll.dao.ProductDao;
import com.RockAndRoll.model.Product;
import com.RockAndRoll.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class productServiceImpl implements ProductService {

    @Autowired
    ProductDao productDao;

    public Product getProductById(Integer id){
        return productDao.getProductById(id);
    }

    public List<Product> getProductList(){
        return productDao.getProductList();
    }

    public void addProduct(Product product){
        productDao.addProduct(product);
    }

    public void editProduct(Product product){
        productDao.editProduct(product);
    }

    public void deleteProduct(Product product){
        productDao.deleteProduct(product);
    }
}
