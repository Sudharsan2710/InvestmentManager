package com.chainsys.investmentmanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
@Controller
public class AccountController {
		
	
	@Autowired
	AccountImpl account;
	
	
		@PostMapping("/account")
		public String addbankacc(@RequestParam("user_id") int user_id,@RequestParam("bankname") String bankname , @RequestParam("pan") String pan , @RequestParam("acNum") String acNum ,@RequestParam("username") String username  )
			
		
	
	
}
