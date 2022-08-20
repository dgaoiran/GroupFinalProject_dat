package com.datstore.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.datstore.models.Product;
import com.datstore.repositories.ProductRepository;



@Service
public class ProductService {
	
	@Autowired
    private ProductRepository productRepo;
    
    public ProductService(ProductRepository productRepo) {
    	this.productRepo = productRepo;
    }
    
    public List<Product> allProduct() {
    	return(List<Product>) productRepo.findAll();
    }
    
    
    public Product createProduct(Product b) {
    	return productRepo.save(b);
    }
    
    public Product findProduct(Long id) {
    	Optional<Product> optionalProduct = productRepo.findById(id);
    	if(optionalProduct.isPresent()) {
    		return optionalProduct.get();
    	}else {
    		return null;
    	}
    }
    
    public Product updateProduct(Product product) {
    	return productRepo.save(product);
    }
    
    public void deleteProduct(Long id) {
    	Optional<Product> optionalProduct = productRepo.findById(id);
    	if(optionalProduct.isPresent()) {
    		productRepo.deleteById(id);
    	}
    }

}
