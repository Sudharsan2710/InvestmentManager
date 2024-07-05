package com.chainsys.investmentmanager.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.investmentmanager.model.Gold;

@Repository
public class GoldImpl implements GoldInvestmentDAO {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	

	
	public void addGold(Gold gold) {
		String query="INSERT INTO gold_investments (user_id,gold_rate,investment_amount_Gold, grams_purchased ) VALUES (?, ?, ?, ?)";
		Object[] params= {gold.getUserId(),gold.getGoldRate(),gold.getInvestmentAmountGold(),gold.getGramsPurchased()};
		
		
		int row=jdbcTemplate.update(query,params);
		System.out.println("inserting goldrate..."+row);
		
		
	}
}