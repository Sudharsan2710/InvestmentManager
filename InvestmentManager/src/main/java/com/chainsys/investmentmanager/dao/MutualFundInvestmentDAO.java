package com.chainsys.investmentmanager.dao;

import org.springframework.stereotype.Repository;

import com.chainsys.investmentmanager.model.MutualFundInvestment;

@Repository
public interface MutualFundInvestmentDAO {
	
	public void addFund(MutualFundInvestment mutualfund);
	
	

}
