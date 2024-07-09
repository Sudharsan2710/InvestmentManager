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

    @PostMapping("/fund")
    public String mf(@RequestParam("investmentType") String investmentType,
            @RequestParam(value = "principal", required = false) Double principal,
            @RequestParam(value = "sipContribution", required = false) Double sipContribution,
            @RequestParam("holdingPeriod") int holdingPeriod,
            @RequestParam("mutualFundName") String mutualFundName,
            HttpSession session,Model model) {

        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "login.jsp";
        }

        MutualFundInvestment mutualFundInvestment = new MutualFundInvestment();
        mutualFundInvestment.setUserId(currentUser.getUserid());
        mutualFundInvestment.setMutualFundName(mutualFundName);
        mutualFundInvestment.setCategoryName(investmentType);
        mutualFundInvestment.setHoldingMonths(holdingPeriod);
        
        if ("lumpsum".equalsIgnoreCase(investmentType)) {
        	mutualFundInvestment .setAmountInvestedOnFund(principal);
        	mutualFundInvestment.setCategoryName(investmentType);
        } else if ("sip".equalsIgnoreCase(investmentType)) {
        	mutualFundInvestment.setCategoryName(investmentType);
            mutualFundInvestment.setCategoryName("sip");
        }

        mutualFundInvestmentDAO.addFund(mutualFundInvestment);
       
        
        return "redirect:/home.jsp?status=success";
    }

}
