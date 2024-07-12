package com.chainsys.investmentmanager.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.investmentmanager.model.Gold;

@Repository
public  interface GoldInvestmentDAO  {
	
	public void addGold(Gold gold);
	public List<Gold> getGoldInvestmentsByUserId(int userId);
	public double getTotalGoldAmountInvested(int userId); 
			
}
