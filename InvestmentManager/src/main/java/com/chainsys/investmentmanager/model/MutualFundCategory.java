package com.chainsys.investmentmanager.model;

public class MutualFundCategory {
			
	
			private int categoryId;
			private String categoryName;
			private String mutualFundName;
			
			public MutualFundCategory() {
				
			}
			
			public String getMutualFundName() {
				return mutualFundName;
			}
			public void setMutualFundName(String mutualFundName) {
				this.mutualFundName = mutualFundName;
			}
			public int getCategoryId() {
				return categoryId;
			}
			public void setCategoryId(int categoryId) {
				this.categoryId = categoryId;
			}
			public String getCategoryName() {
				return categoryName;
			}
			public void setCategoryName(String categoryName) {
				this.categoryName = categoryName;
			}
			
			
}
