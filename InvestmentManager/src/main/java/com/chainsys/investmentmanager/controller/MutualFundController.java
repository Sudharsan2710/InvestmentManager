package com.chainsys.investmentmanager.controller;

import com.chainsys.investmentmanager.dao.*;
import com.chainsys.investmentmanager.model.MutualFundInvestment;
import com.chainsys.investmentmanager.model.User;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MutualFundController {

	@Autowired
	private MutualFundInvestmentDAO mutualFundInvestmentDAO;

	@Autowired
	private GoldInvestmentDAO goldInvestmentDAO;

	@Autowired
	private AccountDAO accountDAO;

	@PostMapping("/fund")
	public String mf(@RequestParam("investmentType") String investmentType,
			@RequestParam(value = "principal", required = false) Double principal,
			@RequestParam(value = "sipContribution", required = false) Double sipContribution,
			@RequestParam("holdingPeriod") int holdingPeriod, @RequestParam("mutualFundName") String mutualFundName,
			HttpSession session, Model model) {

		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			return "login.jsp";
		}

		MutualFundInvestment mutualFundInvestment = new MutualFundInvestment();
		mutualFundInvestment.setUserId(currentUser.getUserid());
		mutualFundInvestment.setMutualFundName(mutualFundName);
		mutualFundInvestment.setCategoryName(investmentType);
		mutualFundInvestment.setHoldingMonths(holdingPeriod);

		double amountToInvest=0.0 ;
		if ("lumpsum".equalsIgnoreCase(investmentType)&& principal != null) {
			mutualFundInvestment.setAmountInvestedOnFund(principal);
			mutualFundInvestment.setCategoryName(investmentType);
			 amountToInvest = principal;
		} else if ("sip".equalsIgnoreCase(investmentType)&& sipContribution != null) {
			mutualFundInvestment.setAmountInvestedOnFund(sipContribution);
			mutualFundInvestment.setCategoryName(investmentType);
			 amountToInvest = sipContribution;
		}
		else {
            model.addAttribute("error", "Invalid investment amount.");
            return getMutualFundjspPage(mutualFundName);
        }
		

		double totalInvestedInMutualFunds = mutualFundInvestmentDAO.getTotalMutualAmountInvestedByUserId(currentUser.getUserid());
		double totalAmountInBankAccount = accountDAO.getTotalAmountInvestedByUserId(currentUser.getUserid());
		double toatalInvestedInGold = goldInvestmentDAO.getTotalGoldAmountInvested(currentUser.getUserid());
		
		
		 double totalInvested = totalInvestedInMutualFunds + toatalInvestedInGold;
	        double remainingBalance = totalAmountInBankAccount - totalInvested;
	        
	        
	        if (amountToInvest > remainingBalance) {
	            model.addAttribute("error", "Insufficient funds in your bank account. Please add more money.");
	            return getMutualFundjspPage(mutualFundName);
	        }

		
		boolean isFundAdded = mutualFundInvestmentDAO.addFund(mutualFundInvestment);
		  if (isFundAdded) {
	            model.addAttribute("message", "Investment added successfully!");
	            return "home.jsp";
	        } else {
	            model.addAttribute("error", "Failed to add investment. Please try again.");
	            return getMutualFundjspPage(mutualFundName);
	        }
		}

	private String getMutualFundjspPage(String mutualFundName) {
		switch (mutualFundName.toLowerCase()) {
		case "nipponindiamulticapfund":
			return "nipponindiamulticapfund.jsp";
		case "nipponindiasmallcapfund":
			return "nipponindiasmallcapfund.jsp";
		case "jmflexicapfund":
			return "jmflexicapfund.jsp";
		case "motilaloswalmidcapfund":
			return "motilaloswalmidcapfund.jsp";
		case "icicprudentialfund":
			return "icicprudentialfund.jsp";
		default:
			return "home.jsp";
		}

	}

}
