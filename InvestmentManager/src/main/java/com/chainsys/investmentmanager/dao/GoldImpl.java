package com.chainsys.investmentmanager.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.chainsys.investmentmanager.mapper.GoldMapper;
import com.chainsys.investmentmanager.model.Gold;

@Repository
public class GoldImpl implements GoldInvestmentDAO {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	

	@Override
	public void addGold(Gold gold) {
		String query="INSERT INTO gold_investments (user_id,gold_rate,investment_amount_Gold, grams_purchased ) VALUES (?, ?, ?, ?)";
		Object[] params= {gold.getUserId(),gold.getGoldRate(),gold.getInvestmentAmountGold(),gold.getGramsPurchased()};
		
		
		int row=jdbcTemplate.update(query,params);
		System.out.println("inserting goldrate..."+row);
		
		
	}
	
	@Override
	 public List<Gold> getGoldInvestmentsByUserId(int userId) {
	        String query = "SELECT * FROM gold_investments WHERE user_id = ?";
	        return jdbcTemplate.query(query, new GoldMapper(),  userId  );
	    }
}