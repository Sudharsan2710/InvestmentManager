package com.chainsys.investmentmanager.dao;

import org.springframework.stereotype.Repository;

import com.chainsys.investmentmanager.model.Gold;

@Repository
public  interface GoldInvestmentDAO  {
	
	public void addGold(Gold gold);
			
}
