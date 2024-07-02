package com.chainsys.investmentmanager.dao;

import org.springframework.stereotype.Repository;

import com.chainsys.investmentmanager.model.BankAccountDetails;

@Repository
public interface AccountDAO {
	
	public void addAccount (BankAccountDetails details);

}
