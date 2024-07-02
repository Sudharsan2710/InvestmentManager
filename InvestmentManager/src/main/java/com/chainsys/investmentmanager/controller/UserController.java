package com.chainsys.investmentmanager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.investmentmanager.dao.UserImpl;
import com.chainsys.investmentmanager.model.User;

import java.util.List;

@Controller
public class UserController {
	
		@Autowired
		UserImpl data;
		
		
		@RequestMapping("/")
		public String index() {
			return "index.jsp";
		}
		
		@PostMapping("/register")
			public String login(@RequestParam("username") String username, @RequestParam("password") String password,@RequestParam("email") String email,@RequestParam("contact") String contact, Model model ) {
				User u = new User();
				u.setUsername(username);
				u.setPassword(password);
				u.setEmail(email);
				u.setContact(contact);
				data.register(u);
				 model.addAttribute("message", "User registered successfully");
				return "login.jsp";
			}
		}



