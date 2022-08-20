package com.datstore.repositories;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.datstore.models.Product;





@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {
    
    
}
