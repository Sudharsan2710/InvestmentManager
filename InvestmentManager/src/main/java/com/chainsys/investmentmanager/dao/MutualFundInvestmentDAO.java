package com.chainsys.investmentmanager.dao;

import java.util.List;

import org.springframework.stereotype.Repository;


import com.chainsys.investmentmanager.model.MutualFundInvestment;

@Repository
public interface MutualFundInvestmentDAO {
	
	public boolean addFund(MutualFundInvestment mutualfund);
	public List<MutualFundInvestment> getMutualFundInvestmentsByUserId(int userId);
	public double getTotalMutualAmountInvestedByUserId(int userId);

}
