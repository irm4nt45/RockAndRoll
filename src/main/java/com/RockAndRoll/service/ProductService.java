package com.RockAndRoll.service;

import com.RockAndRoll.model.Product;

import java.util.List;

public interface ProductService {

    List<Product> getProductList();

    Product getProductById(Integer id);

    void addProduct(Product product);

    void editProduct(Product product);

    void deleteProduct(Product product);
}
