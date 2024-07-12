package com.chainsys.investmentmanager.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.investmentmanager.model.BankAccount;

public class BankAccountMapper implements RowMapper<BankAccount> {

	@Override
	public BankAccount mapRow(ResultSet rs, int rowNum) throws SQLException {
		BankAccount ba = new BankAccount();
		ba.setUserId(rs.getInt("user_id"));
		ba.setBankname(rs.getString("bank_name"));
		ba.setPan(rs.getString("user_pan"));
	    ba.setAcNum(rs.getString("account_number"));
	    ba.setAmountInvesting(rs.getDouble("amountinvesting"));
		
		return ba ;
	}

}
