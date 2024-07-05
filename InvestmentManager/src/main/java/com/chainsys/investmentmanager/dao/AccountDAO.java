package com.chainsys.investmentmanager.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.investmentmanager.model.BankAccount;

@Repository
public interface AccountDAO {
	
	public void addAccount (BankAccount details);
	public   List<BankAccount> findByUserId(int userId);

}
