package com.RockAndRoll.controller.admin;

import com.RockAndRoll.model.Product;
import com.RockAndRoll.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminProduct {

    @Autowired
    private ProductService productService;

    @RequestMapping("/product/addProduct")
    public String addProduct(Model model){
        Product product = new Product();
        product.setProductCategory("Instrument");
        product.setProductCondition("New");
        product.setProductStatus("Active");

        System.out.println("loading product data");

        model.addAttribute("product", product);

        return "addProduct";
    }

    @RequestMapping(value = "/product/addProduct", method = RequestMethod.POST)
    public String addProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result){
        if(result.hasErrors()){
            return "addProduct";
        }
        productService.addProduct(product);

        return "redirect:/admin/productInventory";
    }

    @RequestMapping("/product/editProduct/{id}")
    public String editProduct(@PathVariable("id") Integer id, Model model){
        Product product = productService.getProductById(id);

        model.addAttribute("product", product);

        return "editProduct";
    }

    @RequestMapping(value = "/product/editProduct{id}", method = RequestMethod.POST)
    public String editProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result) {
        if (result.hasErrors()) {
            return "editProduct";
        }

        productService.editProduct(product);

        return "redirect:/admin/productInventory";
    }

    @RequestMapping("product/deleteProduct/{id}")
    public String deleteProduct(@PathVariable("id") Integer id, Model model){
        Product product = productService.getProductById(id);
        productService.deleteProduct(product);

        return "redirect:/admin/productInventory";
    }
}
