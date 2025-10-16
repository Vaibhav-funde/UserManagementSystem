package com.Model;

public class Users {

	 private int userId;
	    private String name;
	    private String email;
	    private String mobile;
	    private String password;
	    private int stateId;
	    private int cityId;
	    private String stateName; 
	    private String cityName; 
	    
	    

	 
		// Getters and Setters
	    public int getUserId() { return userId; }
	    public void setUserId(int userId) { this.userId = userId; }

	    public String getName() { return name; }
	    public void setName(String name) { this.name = name; }

	    public String getEmail() { return email; }
	    public void setEmail(String email) { this.email = email; }

	    public String getMobile() { return mobile; }
	    public void setMobile(String mobile) { this.mobile = mobile; }

	    public String getPassword() { return password; }
	    public void setPassword(String password) { this.password = password; }

	    public int getStateId() { return stateId; }
	    public void setStateId(int stateId) { this.stateId = stateId; }

	    public int getCityId() { return cityId; }
	    public void setCityId(int cityId) { this.cityId = cityId; }

	    public String getStateName() { return stateName; }
	    public void setStateName(String stateName) { this.stateName = stateName; }

	    public String getCityName() { return cityName; }
	    public void setCityName(String cityName) { this.cityName = cityName; }
	}