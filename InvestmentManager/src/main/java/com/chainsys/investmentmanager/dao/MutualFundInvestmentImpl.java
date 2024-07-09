package com.chainsys.investmentmanager.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.chainsys.investmentmanager.model.MutualFundInvestment;

@Repository
public class MutualFundInvestmentImpl implements MutualFundInvestmentDAO{
	
	@Autowired
	JdbcTemplate jdbcTemplate; 
	
	
	
	public void addFund(MutualFundInvestment mutualfund) {
		 System.out.println(mutualfund.toString());
		String query = "INSERT INTO Mutual_Fund_Investments (user_id, Mutual_type,mutual_fund_name, amount,holding_period_months) VALUES (?, ?, ?, ?, ?)";  
        Object[] params= {mutualfund.getUserId(),mutualfund.getCategoryName(),mutualfund.getMutualFundName(),mutualfund.getAmountInvestedOnFund(),mutualfund.getHoldingMonths()};
        		int row=jdbcTemplate.update(query, params);
        		System.out.println("inserting fund...."+row);
        
	}
	
	
	

}

