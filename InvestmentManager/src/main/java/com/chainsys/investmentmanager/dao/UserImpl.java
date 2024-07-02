package com.chainsys.investmentmanager.dao;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.chainsys.investmentmanager.mapper.Mapper;
import com.chainsys.investmentmanager.model.User;

@Repository
public class UserImpl  implements UserDAO{

	@Autowired
	JdbcTemplate jdbcTemplate;	
	
	@Override
	public void register(User u) {
		String query="insert into Users(username,password,email,contact)values(?,?,?,?)";
		Object[] params= {u.getUsername(),u.getPassword(),u.getEmail(),u.getContact()};
	
		int row=jdbcTemplate.update(query,params);	
		System.out.println("inserting..."+row);
	}
	
	@Override
	public User findByEmail(String email) {
        String query = "SELECT * FROM Users WHERE email = ?";
        List<User> users = jdbcTemplate.query(query, new Mapper(), email);
        if (users.isEmpty()) {
            return null;
        } else {
            return users.get(0);
        }
    }
}
