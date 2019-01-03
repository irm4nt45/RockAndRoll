package com.RockAndRoll.dao;

import com.RockAndRoll.model.Product;

import java.util.List;

public interface ProductDao {

    List<Product> getProductList();

    Product getProductById(Integer id);

    void addProduct(Product product);

    void editProduct(Product product);

    void deleteProduct(Product product);

//    void addProduct(Product product);
//
//    void editProduct(Product product);
//
//    Product getProductById(String productId);
//
//    List<Product> getAllProducts();
//
//    void deleteProduct(String productId);
}
