package newpackage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Shaiv
 */
public class User {
    int pid,docid,dept_id,qid;
    String fname,lname,utype;
    String scid;
    String email;
    String password;
    String dob,gender,bldgrp;
    int height,weight,fees;
    long phoneno;
    public User() {
    }

    public User(String fname,String lname,String email, String password,String gender,String dob, String bldgrp,long phoneno,int height, int weight,String scid) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.dob = dob;
        this.bldgrp = bldgrp;
        this.phoneno = phoneno;
        this.height = height;
        this.weight = weight;
        this.scid = scid;

    }

//    public User(String name, String email, String password) {
//        this.fname = name;
//        this.email = email;
//        this.password = password;
//    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getfName() {
        return fname;
    }
    public String getlName() {
        return lname;
    }
    public String getBldgrp() {
        return bldgrp;
    }
    public String getGender() {
        return gender;
    }

    public String getDob() {
        return dob;
    }
     public String getScid() {
        return scid;
    }
    public int getHeight() {
        return height;
    }
    public int getWeight() {
        return weight;
    }
     public int getPid() {
        return pid;
    }
     public String getutype() {
        return utype;
    }
    
    public long getPhone() {
        return phoneno;
    }
    public void setFname(String fname) {
        this.fname = fname;
        
    }
    public void setLname(String lname) {
        this.lname = lname;
    }
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    public void setDob(String dob) {
        this.dob = dob;
    }
    public void setScid(String scid) {
        this.scid = scid;
    }
    public void setBldgrp(String bldgrp) {
        this.bldgrp = bldgrp;
    }
    public void setPid(int pid) {
        this.pid = pid;
    }
    public void setPhone(long phone) {
        this.phoneno = phone;
    }
    public void setHeight(int height) {
        this.height = height;
    }
    public void setWeight(int weight) {
        this.weight = weight;
    }
    public void setUtype(String utype) {
        this.utype = utype;
    }
    public int getDocid() {
        return docid;
    }
     public void setDocid(int docid) {
        this.docid=docid;
    }
    public int getFees() {
        return fees;
    }
     public void setFees(int fees) {
        this.fees=fees;
    }
     public int getDeptid() {
        return dept_id;
    }
     public void setDeptid(int deptid) {
        this.dept_id=deptid;
    }
     public int getqid() {
        return dept_id;
    }
     public void setqid(int deptid) {
        this.dept_id=deptid;
    }
}

