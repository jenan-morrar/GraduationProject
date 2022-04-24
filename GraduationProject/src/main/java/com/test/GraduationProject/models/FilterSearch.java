package com.test.GraduationProject.models;

public class FilterSearch {
	
	private String location;
	private float minPrice;
	private float maxPrice;
	private int minNumOfGuests;
	private int maxNumOfGuests;
	
	public FilterSearch() {
		
	}

	public FilterSearch(String location, float minPrice, float maxPrice, int minNumOfGuests, int maxNumOfGuests) {
		super();
		this.location = location;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.minNumOfGuests = minNumOfGuests;
		this.maxNumOfGuests = maxNumOfGuests;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public float getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(float minPrice) {
		this.minPrice = minPrice;
	}

	public float getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(float maxPrice) {
		this.maxPrice = maxPrice;
	}

	public int getMinNumOfGuests() {
		return minNumOfGuests;
	}

	public void setMinNumOfGuests(int minNumOfGuests) {
		this.minNumOfGuests = minNumOfGuests;
	}

	public int getMaxNumOfGuests() {
		return maxNumOfGuests;
	}

	public void setMaxNumOfGuests(int maxNumOfGuests) {
		this.maxNumOfGuests = maxNumOfGuests;
	}
	
}
