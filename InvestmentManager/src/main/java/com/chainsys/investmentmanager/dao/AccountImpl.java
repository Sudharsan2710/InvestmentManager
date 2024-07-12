package com.chainsys.investmentmanager.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.chainsys.investmentmanager.model.BankAccount;
import com.chainsys.investmentmanager.model.User;

@Repository
public class AccountImpl implements AccountDAO {
			
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	@Override
	public void addAccount(BankAccount details) {
		String query="INSERT INTO Bank_Accounts (user_id,bank_name, user_pan, account_number, account_type, amountinvesting) VALUES (?,?, ?, ?, ?,?)";
		Object[] params= {details.getUserId(),details.getBankname(),details.getPan(),details.getAcNum(),details.getAccountType(),details.getAmountInvesting()};
	
		int row=jdbcTemplate.update(query,params);	
		System.out.println("inserting bankdetails..."+row);
	}
	
	
	 @Override
	    public List<BankAccount> findByUserId(int userId) {
	        String sql = "SELECT * FROM BankAccountDetails WHERE user_id = ?";
	        RowMapper<BankAccount> rowMapper = (rs, rowNum) -> {
	            BankAccount details = new BankAccount();
	            details.setUserId(rs.getInt("user_id"));
	            details.setBankname(rs.getString("bank_name"));
	            details.setPan(rs.getString("user_pan"));
	            details.setAcNum(rs.getString("account_number"));
	            details.setAccountType(rs.getString("account_type"));
	            details.setAmountInvesting(rs.getDouble("amountinvesting"));
	            return details;
	        };
	        return jdbcTemplate.query(sql, rowMapper, userId);
	    }
	 
	 @Override
	 public  double getTotalAmountInvestedByUserId(int userId) {
		 String sql = "SELECT SUM(amountinvesting) FROM Bank_Accounts WHERE user_id = ?";
		 return jdbcTemplate.queryForObject(sql, Double.class,new Object[] {userId});
	 }
	
	
}
