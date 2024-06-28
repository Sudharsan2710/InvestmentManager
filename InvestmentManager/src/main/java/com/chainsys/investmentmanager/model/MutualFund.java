package com.chainsys.investmentmanager.model;

public class MutualFund {

	private int userId;
	private String investmentType;
    private double principalAmount;
    private double sipContribution;
    private double rateOfReturn;
    private int holdingPeriod;

    public MutualFund() {
    	
    }
    public int getId() {
        return userId;
        		
    }

    public void setId(int userId) 
    {
        this.userId = userId;
    }

    public String getInvestmentType() {
        return investmentType;
    }

    public void setInvestmentType(String investmentType) {
        this.investmentType = investmentType;
    }

    public double getPrincipalAmount() {
        return principalAmount;
    }

    public void setPrincipalAmount(double principalAmount) {
        this.principalAmount = principalAmount;
    }

    public double getSipContribution() {
        return sipContribution;
    }

    public void setSipContribution(double sipContribution) {
        this.sipContribution = sipContribution;
    }

    public double getRateOfReturn() {
        return rateOfReturn;
    }

    public void setRateOfReturn(double rateOfReturn) {
        this.rateOfReturn = rateOfReturn;
    }

    public int getHoldingPeriod() {
        return holdingPeriod;
    }

    public void setHoldingPeriod(int holdingPeriod) {
        this.holdingPeriod = holdingPeriod;
    }
}
