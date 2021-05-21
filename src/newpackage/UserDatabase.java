/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

/**
 *
 * @author Shaiv
 */
import static java.lang.System.out;
import java.sql.*;

public class UserDatabase {
    Connection con ;

    public UserDatabase(Connection con) {
        this.con = con;
    }
    
    //for register user 
    public boolean saveUser(User user){
        boolean set = false;
        try{
            //Insert register data to database
            String query1 = "insert into reg_user(email,password,f_name,l_name,gender,phone_no,user_type) values(?,?,?,?,?,?,?)";
            String query2="insert into patient(email,blood_grp,dob,height,weight,smartcard_id) values(?,?,?,?,?,?)";
           PreparedStatement pt = this.con.prepareStatement(query1);
           pt.setString(1, user.getEmail());
           pt.setString(2, user.getPassword());
           pt.setString(3, user.getfName());
           pt.setString(4, user.getlName());
           pt.setString(5, user.getGender());
           pt.setLong(6,user.getPhone());
           pt.setString(7, "PATIENT");
                      
           pt.executeUpdate();
           
           PreparedStatement pt1 = this.con.prepareStatement(query2);
           
           pt1.setString(1, user.getEmail());
           pt1.setString(2, user.getBldgrp());
           pt1.setString(3, user.getDob());
           pt1.setInt(4, user.getHeight());
           pt1.setInt(5, user.getWeight());
           pt1.setString(6, user.getScid());
           
           pt1.executeUpdate();
           set = true;
        }catch(Exception e){
            out.print(e);
        }
        return set;
    }
    //User Login
    public User loginUser(String email, String password){
        User usr=null;
        try{
            String query1 ="select * from reg_user where email=? and password=?";
            
            PreparedStatement pst1 = this.con.prepareStatement(query1);
            pst1.setString(1, email);
            pst1.setString(2, password);
            
            ResultSet rs = pst1.executeQuery();
            
            if(rs.next()){
                usr = new User();
                
                usr.setEmail(rs.getString("email"));
                usr.setPassword(rs.getString("password"));
                usr.setFname(rs.getString("f_name"));
                usr.setLname(rs.getString("l_name"));
                usr.setGender(rs.getString("gender"));
                usr.setPhone(rs.getLong("phone_no"));
                usr.setUtype(rs.getString("user_type"));
                            
            
            String query2 ="select * from patient where email=?";
            PreparedStatement pst2 = this.con.prepareStatement(query2);
            pst2.setString(1, email);
            ResultSet rs2 = pst2.executeQuery();
            
            if(rs2.next()){
                
                usr.setPid(rs2.getInt("pid"));
                usr.setBldgrp(rs2.getString("blood_grp"));
                usr.setDob(rs2.getString("dob"));
                usr.setHeight(rs2.getInt("height"));
                usr.setWeight(rs2.getInt("weight"));
                usr.setScid(rs2.getString("smartcard_id"));
            }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return usr;
    }
    //askquerry
//    public boolean askDoc(String querry, InputStream image ){
//         boolean set = false;
//        try{
//            //Insert register data to database question
//            String query1 = "insert into question(pid,querry) values(?,?,?)";
//            PreparedStatement pt = this.con.prepareStatement(query1);
//           pt.setString(1, pid);
//           pt.setString(2, querry);
//           
//           pt.executeUpdate();
//           
//           set = true;
//        }catch(Exception e){
//            e.printStackTrace();
//        }
//        return set;
//    }
    
    //Doctor Login
    public User loginDoctor(String email, String password){
        User doc=null;
        try{
            String query1 ="select * from reg_user where email=? and password=?";
            
            PreparedStatement pst1 = this.con.prepareStatement(query1);
            pst1.setString(1, email);
            pst1.setString(2, password);
            
            ResultSet rs = pst1.executeQuery();
            
            if(rs.next()){
                doc = new User();
                
                doc.setEmail(rs.getString("email"));
                doc.setPassword(rs.getString("password"));
                doc.setFname(rs.getString("f_name"));
                doc.setLname(rs.getString("l_name"));
                doc.setGender(rs.getString("gender"));
                doc.setPhone(rs.getLong("phone_no"));
                
        String query2 ="select * from doctor where email=?";
            PreparedStatement pst2 = this.con.prepareStatement(query2);
            pst2.setString(1, email);
            ResultSet rs2 = pst2.executeQuery();
            
            if(rs2.next()){
                
                doc.setDocid(rs2.getInt("doc_id"));
                doc.setFees(rs2.getInt("fees"));
                doc.setDeptid(rs2.getInt("dept_id"));
                
            }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return doc;
    }
}
