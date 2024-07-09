package com.chainsys.investmentmanager.dao;

import org.springframework.stereotype.Repository;

import com.chainsys.investmentmanager.model.User;


@Repository
public interface UserDAO {
	
	public  void register(User u);
	
	public User findByEmail(String email);
	
	
	

}
