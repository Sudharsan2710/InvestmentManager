package com.chainsys.investmentmanager.model;

import java.sql.Date;

public class MutualFundInvestment {

	private int investmentId;
	private int userId;
	private int categoryId;
	private String mutualFundName;
	private double amountInvestedOnFund;
	private Date dateOfInvestment;
	
	public Date getDateOfInvestment() {
		return dateOfInvestment;
	}

	public void setDateOfInvestment(Date dateOfInvestment) {
		this.dateOfInvestment = dateOfInvestment;
	}

	public MutualFundInvestment() {
		
	}

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

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
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

}
