package com.chainsys.investmentmanager.model;

public class Gold {
	private int userId;
	private double goldRate;
	private double investmentAmountGold;
	private double gramsPurchased;

	
	public Gold() {
		
	}
   
    public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

    public double getGoldRate() {
        return goldRate;
    }

    public void setGoldRate(double goldRate) {
        this.goldRate = goldRate;
    }

    public double getInvestmentAmountGold() {
        return investmentAmountGold;
    }

    public void setInvestmentAmountGold(double investmentAmountGold) {
        this.investmentAmountGold = investmentAmountGold;
    }

    public double getGramsPurchased() {
        return gramsPurchased;
    }

    public void setGramsPurchased(double gramsPurchased) {
        this.gramsPurchased = gramsPurchased;
    }
}
