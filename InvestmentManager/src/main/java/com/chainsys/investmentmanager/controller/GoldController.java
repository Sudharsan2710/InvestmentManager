package com.chainsys.investmentmanager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.investmentmanager.dao.GoldInvestmentDAO;
import com.chainsys.investmentmanager.model.Gold;
import com.chainsys.investmentmanager.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class GoldController {

	
	@Autowired
	GoldInvestmentDAO goldinvestmentDAO;
	
	@PostMapping("/goldpurchase")
		public String gol(@RequestParam("gold_rate")double gold_rate, @RequestParam("investment_amount_gold") double investment_amount_gold , @RequestParam("grams_purchased") double grams_purchased , HttpSession session ,Model model  ) {
		
		User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "login.jsp";
}
        
        Gold gold = new Gold();
        gold.setUserId(currentUser.getUserid());
        gold.setGoldRate(gold_rate);
        gold.setInvestmentAmountGold(investment_amount_gold);
        gold.setGramsPurchased(grams_purchased);
        
        
        goldinvestmentDAO.addGold(gold);
        model.addAttribute("message","gold added successfully");
        return "home.jsp";
}
	  @GetMapping("/portfolio")
	    public String viewPortfolio(HttpSession session, Model model) {
	        User currentUser = (User) session.getAttribute("currentUser");
	        if (currentUser == null) {
	            return "login.jsp";
	        }

	        List<Gold> goldInvestments = goldinvestmentDAO.getGoldInvestmentsByUserId(currentUser.getUserid());
	        model.addAttribute("goldInvestments", goldInvestments);
	        return "portfolio.jsp";
	    }
}
