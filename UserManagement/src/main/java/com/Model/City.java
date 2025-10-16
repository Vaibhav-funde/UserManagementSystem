package com.Model;

public class City {
    private int cid;
    private String cname;
    private int sid; // reference to State

    // Default constructor
    public City() {
    }

    // Parameterized constructor
    public City(int cid, String cname, int sid) {
        this.cid = cid;
        this.cname = cname;
        this.sid = sid;
    }

    // Getters and Setters
    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

   
    @Override
    public String toString() {
        return "City [cid=" + cid + ", cname=" + cname + ", sid=" + sid + "]";
    }
}
