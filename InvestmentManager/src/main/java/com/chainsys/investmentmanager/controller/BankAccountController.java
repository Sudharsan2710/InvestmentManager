package com.chainsys.investmentmanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.investmentmanager.dao.AccountDAO;
import com.chainsys.investmentmanager.dao.GoldInvestmentDAO;
import com.chainsys.investmentmanager.dao.MutualFundInvestmentDAO;
import com.chainsys.investmentmanager.model.BankAccount;
import com.chainsys.investmentmanager.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class BankAccountController {
			
	
	@Autowired
	AccountDAO accountDAO;
	
	@Autowired
	GoldInvestmentDAO goldInvestmentDAO;
	
	
	@Autowired
	MutualFundInvestmentDAO  mutualFundInvestmentDAO;
	
	
	@PostMapping("/BankAccount")
		public String acc( @RequestParam("bankName") String bankName , @RequestParam("userPan") String userPan , @RequestParam("accountNumber") String accountNumber , @RequestParam("accountType") String accountType , @RequestParam("amountInvesting") double amountInvesting , HttpSession session, Model model ) {
	
		  User currentUser = (User) session.getAttribute("currentUser");
	        if (currentUser == null) {
	            return "login.jsp";
	        }
		
		
		BankAccount details = new BankAccount();
		details.setUserId(currentUser.getUserid());
		details.setBankname(bankName);
		details.setPan(userPan);
		details.setAcNum(accountNumber);
		details.setAccountType(accountType);
		details.setAmountInvesting(amountInvesting);
		
		accountDAO.addAccount(details);
		 model.addAttribute("message", "Account added successfully");
		 return "home.jsp";

	}
	
	@GetMapping("/portfolio")
	public String viewPortfolio(HttpSession session, Model model) {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "login.jsp";
        }
        
        
        double totalInvestedInGold = goldInvestmentDAO.getTotalGoldAmountInvested(currentUser.getUserid());
        double totalInvestedInMutualFunds=mutualFundInvestmentDAO.getTotalMutualAmountInvestedByUserId(currentUser.getUserid());
        double totalInvested = totalInvestedInGold + totalInvestedInMutualFunds ; 
        
        
        double totalAmountInBankAccount= accountDAO.getTotalAmountInvestedByUserId(currentUser.getUserid());
        double remainingBalance = totalAmountInBankAccount - totalInvested;
        
        
       model.addAttribute("totalInvestedInGold",totalInvestedInGold);
       model.addAttribute("totalInvestedInMutualFunds",totalInvestedInMutualFunds );
       model.addAttribute("totalInvested",totalInvested );
       model.addAttribute("remainingBalance",remainingBalance );
       model.addAttribute("totalAmountInBankAccount", totalAmountInBankAccount);
       return "portfolio.jsp";
	}
}


