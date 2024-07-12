package com.chainsys.investmentmanager.mapper;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.investmentmanager.model.Gold;
import com.chainsys.investmentmanager.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {

		User u = new User();
		u.setUserid(rs.getInt("user_id"));
		u.setUsername(rs.getString("username"));
		u.setPassword(rs.getString("password"));
		u.setEmail(rs.getString("email"));
		u.setContact(rs.getString("contact"));
		return u;

	}
	
	
	
}
