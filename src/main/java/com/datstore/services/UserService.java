package com.datstore.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.datstore.models.User;
import com.datstore.models.UserLogin;
import com.datstore.repositories.UserRepository;



@Service
public class UserService {
	
	@Autowired
    private UserRepository userRepo;
    
    public UserService(UserRepository userRepo) {
    	this.userRepo = userRepo;
    }
    
    public List<User> allUser() {
    	return(List<User>) userRepo.findAll();
    }
    
    public User createUser(User b) {
    	return userRepo.save(b);
    }
    
    public User findUser(Long id) {
    	Optional<User> optionalUser = userRepo.findById(id);
    	if(optionalUser.isPresent()) {
    		return optionalUser.get();
    	}else {
    		return null;
    	}
    }
    
    public User updateUser(User user) {
    	return userRepo.save(user);
    }
    
    public void deleteUser(Long id) {
    	Optional<User> optionalUser = userRepo.findById(id);
    	if(optionalUser.isPresent()) {
    		userRepo.deleteById(id);
    	}
    }
    
    public User findById(Long id) {
    	Optional<User> potentialUser = userRepo.findById(id);
    	if(potentialUser.isPresent()) {
    		return potentialUser.get();
    	}
    	return null;
    }
    
    public User register(User newUser, BindingResult result) {
        
    	Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
    	
    	if(potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "An account with that email already exists!");
    	}
    	
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    		result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
    	}
    	
    	if(result.hasErrors()) {
    		return null;
    	}
    
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashed);
    	return userRepo.save(newUser);
    	
    }
    
    public User login(UserLogin newLogin, BindingResult result) {
    	
    	Optional<User> potentialUser = userRepo.findByEmail(newLogin.getEmail());
        

    	if(!potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "User not found!");
    		return null;
    	}
    	
    	User user = potentialUser.get();
        
    	if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	}
    	
    	if(result.hasErrors()) {
    		return null;
    	}
    	
        return user;
    }

}
