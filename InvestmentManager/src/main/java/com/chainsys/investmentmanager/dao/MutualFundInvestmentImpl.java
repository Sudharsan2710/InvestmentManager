package com.chainsys.investmentmanager.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.chainsys.investmentmanager.mapper.MutualFundMapper;
import com.chainsys.investmentmanager.model.MutualFundInvestment;

@Repository
public class MutualFundInvestmentImpl implements MutualFundInvestmentDAO{
	
	@Autowired
	JdbcTemplate jdbcTemplate; 
	
	
	
	public boolean addFund(MutualFundInvestment mutualfund) {
		
		String query = "INSERT INTO Mutual_Fund_Investments (user_id, Mutual_type,mutual_fund_name, amount,holding_period_months) VALUES (?, ?, ?, ?, ?)";  
        Object[] params= {mutualfund.getUserId(),mutualfund.getCategoryName(),mutualfund.getMutualFundName(),mutualfund.getAmountInvestedOnFund(),mutualfund.getHoldingMonths()};
        		int row=jdbcTemplate.update(query, params);
        		System.out.println("inserting fund...."+row);
				return row>0;
        
	}
	
	@Override
	 public List<MutualFundInvestment> getMutualFundInvestmentsByUserId(int userId) {
	        String query = "SELECT * FROM Mutual_Fund_Investments WHERE user_id = ?";
	        return jdbcTemplate.query(query, new MutualFundMapper(),  userId  );
	    }
	
	@Override 
	public double getTotalMutualAmountInvestedByUserId(int userId) {
		String query = "SELECT SUM(amount) FROM Mutual_Fund_Investments WHERE user_id = ?";
		 return jdbcTemplate.queryForObject(query,  Double.class,new Object[]{userId});
	}



	
	
	
	

}

