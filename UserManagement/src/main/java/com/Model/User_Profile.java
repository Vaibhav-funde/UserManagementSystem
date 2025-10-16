package com.Model;
public class User_Profile {
	
	 private int profileId;
	    private int userId;
	    private String address;
	    private String profileImage;
	    private String aadhaarNo;
	    private String panNo;
	    private String aadhaarDoc;
	    private String panDoc;

	    // Getters and Setters
	    public int getProfileId() { return profileId; }
	    public void setProfileId(int profileId) { this.profileId = profileId; }

	    public int getUserId() { return userId; }
	    public void setUserId(int userId) { this.userId = userId; }

	    public String getAddress() { return address; }
	    public void setAddress(String address) { this.address = address; }

	    public String getProfileImage() { return profileImage; }
	    public void setProfileImage(String profileImage) { this.profileImage = profileImage; }

	    public String getAadhaarNo() { return aadhaarNo; }
	    public void setAadhaarNo(String aadhaarNo) { this.aadhaarNo = aadhaarNo; }

	    public String getPanNo() { return panNo; }
	    public void setPanNo(String panNo) { this.panNo = panNo; }

	    public String getAadhaarDoc() { return aadhaarDoc; }
	    public void setAadhaarDoc(String aadhaarDoc) { this.aadhaarDoc = aadhaarDoc; }

	    public String getPanDoc() { return panDoc; }
	    public void setPanDoc(String panDoc) { this.panDoc = panDoc; }
	}