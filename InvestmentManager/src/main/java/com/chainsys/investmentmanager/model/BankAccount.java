package com.chainsys.investmentmanager.model;

public class BankAccount {
	  	private int userId;
	    private String bankname;
	    private String pan;
	    private String acNum;
	    private String accountType;
	    private double amountinvesting;

	  
	    public BankAccount() {
	   
	    }
	    
	    public int getUserId() {
	        return userId;
	    }

	    public void setUserId(int userId) {
	        this.userId = userId;
	    }
	    
	    public String getBankname() {
	        return bankname;
	    }

	    public void setBankname(String bankname) {
	        this.bankname = bankname;
	    }

	    public String getPan() {
	        return pan;
	    }

	    public void setPan(String pan) {
	        this.pan = pan;
	    }

	    public String getAcNum() {
	        return acNum;
	    }

	    public void setAcNum(String acNum) {
	        this.acNum = acNum;
	    }

	    public String getAccountType() {
	        return accountType;
	    }

	    public void setAccountType(String accountType) {
	        this.accountType = accountType;
	    }

	    public double getAmountInvesting() {
	        return amountinvesting;
	    }

	    public void setAmountInvesting(double amountInvesting) {
	        this.amountinvesting = amountInvesting;
	    }
	}


