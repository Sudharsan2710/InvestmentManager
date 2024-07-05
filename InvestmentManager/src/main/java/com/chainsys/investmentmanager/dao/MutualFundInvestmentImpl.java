package com.chainsys.investmentmanager.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.chainsys.investmentmanager.model.MutualFundInvestment;

@Component
public class MutualFundInvestmentImpl {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	
	public void addFund(MutualFundInvestment mutualfund) {
		String query = "INSERT INTO Mutual_Fund_Investments (user_id, category_id,mutual_fund_name, amount, date_of_investment) VALUES (?, ?, ?, ?, ?)";  
        Object[] params= {mutualfund.getUserId(),mutualfund.getCategoryId(),mutualfund.getMutualFundName(),mutualfund.getAmountInvestedOnFund(),mutualfund.getDateOfInvestment()};
        		int row=jdbcTemplate.update(query, params);
        		System.out.println("inserting fund...."+row);
        
	}
	
	
	

}

