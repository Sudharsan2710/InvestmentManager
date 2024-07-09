package com.chainsys.investmentmanager.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.investmentmanager.model.Gold;


	 public  class GoldMapper implements RowMapper<Gold> {
		 @Override
	        public Gold mapRow(ResultSet rs, int rowNum) throws SQLException {
	            Gold gold = new Gold();
	            gold.setUserId(rs.getInt("user_id"));
	            gold.setGoldRate(rs.getDouble("gold_rate"));
	            gold.setInvestmentAmountGold(rs.getDouble("investment_amount_gold"));
	            gold.setGramsPurchased(rs.getDouble("grams_purchased"));
	            return gold;
	        }
	    }


