package com.chainsys.investmentmanager.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.investmentmanager.model.MutualFundInvestment;

public class MutualFundMapper implements RowMapper<MutualFundInvestment> {

	@Override
	public MutualFundInvestment mapRow(ResultSet rs, int rowNum) throws SQLException {
		MutualFundInvestment mfi = new MutualFundInvestment();
		mfi.setUserId(rs.getInt("user_id"));
		mfi.setCategoryName(rs.getString("Mutual_type"));
		mfi.setAmountInvestedOnFund(rs.getDouble("amount"));
		mfi.setMutualFundName(rs.getString("mutual_fund_name"));
		mfi.setHoldingMonths(rs.getInt("holding_period_months"));
		return mfi;
	}

	
}
