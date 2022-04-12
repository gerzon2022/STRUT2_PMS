package com.rpms.bean;



public class Location {

	private int id;
	private String locationName;

	public Location(int id, String locationName) {
		this.setId(id);
		this.setLocationName(locationName);
	}







	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}







	public String getLocationName() {
		return locationName;
	}







	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
}
