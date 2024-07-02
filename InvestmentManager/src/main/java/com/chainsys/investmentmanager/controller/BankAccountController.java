package com.chainsys.investmentmanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.investmentmanager.dao.AccountDAO;
import com.chainsys.investmentmanager.model.BankAccountDetails;

@Controller
public class BankAccountController {
			
	
	@Autowired
	AccountDAO accountDAO;
	
	
	@PostMapping("")
		public String acc(@RequestParam("userId") int userId , @RequestParam("bankname") String bankname , @RequestParam("pan") String pan , @RequestParam("acNum") String acNum , @RequestParam("accountType") String accountType , @RequestParam("amountinvesting") double amountinvesting , Model model ) {
		BankAccountDetails details = new BankAccountDetails();
		details.setUserId(userId);
		details.setBankname(bankname);
		details.setPan(pan);
		details.setAcNum(acNum);
		details.setAccountType(accountType);
		details.setAmountInvesting(amountinvesting);
		
		accountDAO.addAccount(details);
		 model.addAttribute("message", "Account added successfully");
		 return "home.jsp";

	}
}
