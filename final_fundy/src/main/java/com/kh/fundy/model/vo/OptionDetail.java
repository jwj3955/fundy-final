package com.kh.fundy.model.vo;

public class OptionDetail {
	
	private int packageNo;
	private String packageName;
	private int packageAmount;
	private int funderNo;
	
	public OptionDetail() {}

	public OptionDetail(int packageNo, String packageName, int packageAmount, int funderNo) {
		super();
		this.packageNo = packageNo;
		this.packageName = packageName;
		this.packageAmount = packageAmount;
		this.funderNo = funderNo;
	}

	public int getPackageNo() {
		return packageNo;
	}

	public void setPackageNo(int packageNo) {
		this.packageNo = packageNo;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public int getPackageAmount() {
		return packageAmount;
	}

	public void setPackageAmount(int packageAmount) {
		this.packageAmount = packageAmount;
	}

	public int getFunderNo() {
		return funderNo;
	}

	public void setFunderNo(int funderNo) {
		this.funderNo = funderNo;
	}
	
}
