package com.datstore.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.datstore.models.Product;
import com.datstore.models.User;
import com.datstore.models.UserLogin;
import com.datstore.services.ProductService;
import com.datstore.services.UserService;



@Controller
public class MainController {
	
	 @Autowired
	    private ProductService productService;
	    
	 @Autowired
	    private UserService userService;
	
	@GetMapping ("/")
	public String index(Model model, HttpSession session) {
		
		if(session.getAttribute("userSession") == null) {
			return "redirect:/datclassifieds/login";
	}
		return "redirect:/datclassifieds/dashboard";
	}
	
	@GetMapping ("/datclassifieds/login")
	public String loginRegister(Model model) {
		model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new UserLogin());
		return "login.jsp";
	}
	
	@GetMapping ("/datclassifieds/register")
	public String register(Model model) {
		model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new UserLogin());
		return "register.jsp";
	}
	
	@PostMapping ("/datclassifieds/login/submit")
	public String login(@Valid @ModelAttribute("newLogin") UserLogin newLogin, 
			BindingResult result, Model model, HttpSession session) {
		
		User user = userService.login(newLogin, result);
		 
	    if(result.hasErrors() || user==null) {
	        model.addAttribute("newUser", new User());
	        return "login.jsp";
	    }
	     
	    session.setAttribute("userSession", user.getId());

    
        return "redirect:/datclassifieds/dashboard";
   
	}
	
	@PostMapping ("/datclassifieds/register/submit")
	public String register(@Valid @ModelAttribute("newUser") User newUser, 
			BindingResult result, Model model, HttpSession session) {
		
		User user = userService.register(newUser, result);
		
	    if(result.hasErrors()) {
	        model.addAttribute("newLogin", new UserLogin());
	        return "register.jsp";
	    }
	    
	    session.setAttribute("userSession", user.getId());
	 
	    return "redirect:/datclassifieds/dashboard";
	}
	
	
	@GetMapping ("/datclassifieds/dashboard")
	public String dashboard(Model model, HttpSession session) {
		
		if(session.getAttribute("userSession") == null) {
			return "redirect:/datclassifieds/logout";
		}
		
		Long userSession = (Long) session.getAttribute("userSession");
		model.addAttribute("userSession", userService.findById(userSession));
		
		List<Product> products = productService.allProduct();
		model.addAttribute("products", products);
		
		model.addAttribute("user", userService.findById(userSession));
		
		return "dashboard2.jsp";
	}
	
	@GetMapping ("/datclassifieds/sell")
	public String sell(@ModelAttribute("newProduct") Product product, Model model, HttpSession session) {
		model.addAttribute("newProduct", new Product());
		
		User user = userService.findById((Long)session.getAttribute("userSession"));
    	model.addAttribute("user", user);
    	
    	return "sell.jsp";
	}
	
	@PostMapping("/datclassifieds/sell/submit")
    public String newProduct (@Valid @ModelAttribute("newProduct") Product product, 
            BindingResult result, Model model, HttpSession session) {
        
    
        if(result.hasErrors()) {
            return "sell.jsp";
        } else {
        	
        	productService.createProduct(product);
        }
    
        return "redirect:/datclassifieds/dashboard";
    }
	
//	@GetMapping ("/datclassifieds/vroom")
//	public String vroom(Model model, HttpSession session) {
//		
//		if(session.getAttribute("userSession") == null) {
//			return "redirect:/datclassifieds/logout";
//		}
//		
//		Long userSession = (Long) session.getAttribute("userSession");
//		model.addAttribute("userSession", userService.findById(userSession));
//		
//		List<Product> products = productService.allProduct();
//		model.addAttribute("products", products);
//		
//		model.addAttribute("user", userService.findById(userSession));
//		
//		return "vroom.jsp";
//	}
//	
	@GetMapping ("/datclassifieds/view/{id}")
	public String product(@PathVariable("id") Long id, Model model, HttpSession session) {
		
		Product product = productService.findProduct(id);
		model.addAttribute("product", product);
		
		User user = userService.findUser(id);
		model.addAttribute("user", user);
		
		Long userSession = (Long) session.getAttribute("userSession");
		model.addAttribute("userSession", userService.findById(userSession));
		
		List<Product> products = productService.allProduct();
		model.addAttribute("products", products);
		
		model.addAttribute("user", userService.findById(userSession));
				
		return "view.jsp";
	}
	
	
	@GetMapping("/datclassifieds/edit/{id}")
	public String editProduct(@PathVariable("id") Long id, Model model, 
			@ModelAttribute("newProduct") Product product, HttpSession session) {
		model.addAttribute("product", productService.findProduct(id));
		
		User user = userService.findById((Long)session.getAttribute("userSession"));
    	model.addAttribute("user", user);
		return "edit.jsp";
	}
	
	@PutMapping("/datclassifieds/product/update/{id}")
    public String updateProduct(@PathVariable("id") Long id,Model model, 
    		@Valid @ModelAttribute("newProduct") Product product,
    		BindingResult result, HttpSession session) {
		
        if (result.hasErrors()) {
        	model.addAttribute("product", productService.findProduct(id));
            return "edit.jsp";
        } else {
        	
        	Long userSession = (Long) session.getAttribute("userSession");
    		model.addAttribute("userSession", userService.findById(userSession));
    		
    		List<Product> products = productService.allProduct();
    		model.addAttribute("products", products);
            productService.updateProduct(product);
            return "redirect:/datclassifieds/dashboard";
        }
    }
	
	
	@DeleteMapping("/datclassifieds/product/delete/{id}")
	public String destroy(@PathVariable("id") Long id) {
		productService.deleteProduct(id);
		return "redirect:/datclassifieds/dashboard";
	}
	
	
	@GetMapping("/datclassifieds/logout")
	public String logout(HttpSession session) {
		
		session.setAttribute("userSession", null);
 
	     
	    return "redirect:/datclassifieds/login";
	}

}
