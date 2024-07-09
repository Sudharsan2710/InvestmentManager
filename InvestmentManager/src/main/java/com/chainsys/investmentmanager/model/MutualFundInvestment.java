package com.chainsys.investmentmanager.model;

import java.sql.Date;

public class MutualFundInvestment {
	
	private int investmentId;
	private int userId;
	private String categoryName;
	private String mutualFundName;
	private double amountInvestedOnFund;
	private int holdingMonths;

	public int getInvestmentId() {
		return investmentId;
	}
	public void setInvestmentId(int investmentId) {
		this.investmentId = investmentId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getMutualFundName() {
		return mutualFundName;
	}
	public void setMutualFundName(String mutualFundName) {
		this.mutualFundName = mutualFundName;
	}
	public double getAmountInvestedOnFund() {
		return amountInvestedOnFund;
	}
	public void setAmountInvestedOnFund(double amountInvestedOnFund) {
		this.amountInvestedOnFund = amountInvestedOnFund;
	}
	@Override
	public String toString() {
		return "MutualFundInvestment [investmentId=" + investmentId + ", userId=" + userId + ", categoryName="
				+ categoryName + ", mutualFundName=" + mutualFundName + ", amountInvestedOnFund=" + amountInvestedOnFund
				+ ", holdingMonths=" + holdingMonths + "]";
	}
	public int getHoldingMonths() {
		return holdingMonths;
	}
	public void setHoldingMonths(int holdingMonths) {
		this.holdingMonths = holdingMonths;
	}
	
	
}