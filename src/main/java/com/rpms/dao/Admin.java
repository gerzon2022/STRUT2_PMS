package com.rpms.dao;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.rpms.bean.ShiftBean;
import java.io.*;
public class Admin {
	public static String sqluser="root";
	public static String sqluserpw="secret";
	public static String Db_url="jdbc:mysql://localhost:3306/RPMS";
	

	// method for create connection
	public static Connection conn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(Db_url,sqluser,sqluserpw);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public String CallingStoredProcedure() throws Exception {
		int i = 0;
		try {
			
			CallableStatement statement = conn().prepareCall("{call ROTATION()}");// call the stored procedure we created named ROTATION, SEE DB2.SQL LINE 92.
			statement.execute();
            statement.close();
 
            System.out.println("Stored procedure called successfully!");
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString() ;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	
	// method for save user data in database
	public String registerUser(String uname, String uemail, String upass, String udeg) throws Exception {
		int i = 0;
		try {
			String sql = "INSERT INTO STRUTS2CRUD VALUES (?,?,?,?)";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, uemail);
			ps.setString(3, upass);
			ps.setString(4, udeg);
			i = ps.executeUpdate();
			return "good";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString() ;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	
	public int existingShifts(String shift) throws Exception {
		int i = 0;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM tbl_shifts where fld_shift=?";
		PreparedStatement ps = conn().prepareStatement(sql);
		ps.setString(1, shift);
		rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				i=rs.getInt("COUNT(*)");
			}
		}
		System.out.print("Shift count:");
		System.out.println(i);
		return i;
	}
	public int existingDayOffs(String dayOff) throws Exception {
		int i = 0;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM tbl_dayoffs where fld_day_offs=?";
		PreparedStatement ps = conn().prepareStatement(sql);
		ps.setString(1, dayOff);
		rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				i=rs.getInt("COUNT(*)");
			}
		}
		System.out.print("day off count:");
		System.out.println(i);
		return i;
	}
	public int existingEmail(String email) throws Exception {
		int i = 0;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM tbl_personnel where fld_email=?";
		PreparedStatement ps = conn().prepareStatement(sql);
		ps.setString(1, email);
		rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				i=rs.getInt("COUNT(*)");
			}
		}
		return i;
	}
	public int existingArea(String lbl) throws Exception {
		int i = 0;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM tbl_location where fld_lbl=?";
		PreparedStatement ps = conn().prepareStatement(sql);
		ps.setString(1, lbl);
		rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				i=rs.getInt("COUNT(*)");
			}
		}
		return i;
	}

	// method for fetch saved user data
	

	public ResultSet R_shifts() throws SQLException {
		ResultSet rs = null;
		try {
			String sql = "SELECT fld_shifts_id, fld_shift FROM tbl_shifts";
			PreparedStatement ps = conn().prepareStatement(sql);
			rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}

	public ResultSet R_ass() throws SQLException {
		ResultSet rs = null;
		try {
			String sql = "select fld_area_no,fld_shifts_id, fld_personnel_id, fld_day_offs_id from tbl_ass where fld_shifts_Id>0 or fld_day_offs_id>0";
			PreparedStatement ps = conn().prepareStatement(sql);
			rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}

	public ResultSet count_users() throws SQLException {
		ResultSet rs = null;
		try {
			String sql = "SELECT count(fld_personnel_id) FROM tbl_personnel";
			PreparedStatement ps = conn().prepareStatement(sql);
			rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	public ResultSet count_admin(String uType) throws SQLException {
		ResultSet rs = null;
		try {
			String sql = "SELECT count(fld_personnel_id) FROM tbl_accounts where fld_privilege=?";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setString(1,uType);
			rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	
	
	public ResultSet R_shifts_by_id(int shifts_id) throws SQLException {
		ResultSet rs = null;
		try {
			String sql = "SELECT fld_shifts_id, fld_shift FROM tbl_shifts where fld_shifts_id=?";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setInt(1,shifts_id);
			rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	
	public ResultSet R_login(String un, String pw) throws SQLException {
		ResultSet rs = null;
		int i=0;
			try {
				String sql = "SELECT tbl_accounts.fld_privilege, tbl_personnel.fld_lname, tbl_personnel.fld_fname, tbl_personnel.fld_personnel_id FROM tbl_accounts inner join tbl_personnel on tbl_accounts.fld_personnel_id=tbl_personnel.fld_personnel_id where tbl_accounts.fld_email=? and fld_pw=?";
				PreparedStatement ps = conn().prepareStatement(sql);
				ps.setString(1,un);
				ps.setString(2,pw);
				rs = ps.executeQuery();

				return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	public ResultSet R_profile(int un) throws SQLException {
		ResultSet rs = null;
		
			try {
				String sql = "SELECT * FROM tbl_personnel where fld_personnel_id=?";
				PreparedStatement ps = conn().prepareStatement(sql);
				ps.setInt(1,un);
				
				rs = ps.executeQuery();
			
				return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	public ResultSet R_maps() throws SQLException {
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM tbl_location order by fld_lbl asc";
			PreparedStatement ps = conn().prepareStatement(sql);
			rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	public ResultSet R_maps_by_lbl() throws SQLException {
		ResultSet rs = null;
		try {
			String sql = "SELECT distinct(fld_lbl) FROM tbl_location";
			PreparedStatement ps = conn().prepareStatement(sql);
			rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	public int get_personnel_id(String email) throws SQLException {
		ResultSet rs = null;
		int this_id=0;
		try {
			String sql = "SELECT * FROM tbl_personnel where fld_email=?";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					
					this_id=rs.getInt("fld_personnel_id");
				}
			}
			return this_id;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	public ResultSet R_Day_Offs() throws SQLException {
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM tbl_dayoffs";
			PreparedStatement ps = conn().prepareStatement(sql);
			rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	public ResultSet R_Day_Offs_by_id(int id) throws SQLException {
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM tbl_dayoffs where fld_day_offs_id=?";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setInt(1,id);
			rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	public ResultSet R_personnel_id(String email) throws SQLException {
		ResultSet rs = null;
		try {
			String sql = "SELECT fld_personnel_id FROM tbl_personnel where fld_email= ? ";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();//
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	public ResultSet R_personnel() throws SQLException {
		ResultSet rs = null;
		try {
			
			String sql = "SELECT fld_dob, fld_btype, fld_address, fld_tin, fld_gsis, fld_pagibig, fld_philhealth, fld_personnel_id, fld_lname, fld_fname, fld_mname, fld_email, fld_contact_no, fld_active, fld_status, fld_code  FROM tbl_personnel order by fld_personnel_id desc";
			PreparedStatement ps = conn().prepareStatement(sql);
			rs = ps.executeQuery();//
			return rs;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	public ResultSet R_personnel_ass() throws SQLException {
		ResultSet rs = null;
		try {
			String sql = "SELECT fld_personnel_id, fld_lname, fld_fname,  fld_mname,fld_email, fld_contact_no, fld_active  FROM tbl_personnel where fld_active=1 order by fld_personnel_id desc";
			PreparedStatement ps = conn().prepareStatement(sql);
			rs = ps.executeQuery();//
			return rs;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	
	
	public int registerShift(String shifts) throws SQLException {
		int i = 0;
		try {
			if(existingShifts(shifts)<1) {
			String sql = "INSERT INTO tbl_shifts(fld_shift) VALUES (?)";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setString(1, shifts);
			i = ps.executeUpdate();
			}
			return i;
			
		} catch (Exception e) {
			e.printStackTrace();

			return 0;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
		
	}
	//last_name, frist_name, mname, email, contact_num, code, address, bt, tin, gsis,philhealth,pagibig,bod
	public int registerPersonnel(String lname, String fname, String mname,  String contact_no,String email,  int code, String address, String bt, String tin, String gsis, String philhealth, String pagibig, String dob, String status) throws SQLException {
		int i = 0;
		
		
		try {
			int acc_exist=0;
			acc_exist=existingEmail(email);
			if(acc_exist>0) {
				return 2;
			}
			i=initialize_personnel(lname, fname,mname, contact_no,email, code,address, bt, tin, gsis, philhealth, pagibig, dob, status);
			
			
			return i;

		
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
		
	}
	
	public int initialize_personnel(String lname, String fname, String mname,  String contact_no,String email,  int code, String address, String bt, String tin,String gsis,String philhealth, String pagibig,String dob, String status) throws SQLException{
		
		int count_shifts = 0, i=0;
		int area_n=0;
		int this_id=0;
		try {
		String lbl="";
		String sql="";
		
		ResultSet rs = null;
		System.out.println("line 485");
		rs=R_areaLbl();
		System.out.println("line 487");//troubleshooting if there is prior error on the above line, this code will not execute
	
		
		if (rs != null) {
			while (rs.next()) {

				lbl=rs.getString("fld_lbl");
				area_n=rs.getInt("fld_area_no");
				System.out.println(lbl);
				System.out.println(area_n);
				count_shifts=count_Shifts(area_n);
				System.out.println(count_shifts);
				
								
								if(code==1) {
									if(lbl.charAt(0)=='A') {
										if(count_shifts<=9) {
											int shift_id=0;
											if(count_shifts<=5) {
												shift_id=1;
											}
											else{
												shift_id=2;
											}
											i =common_initiate( lname,  fname,  mname,contact_no, email , address, bt, tin,gsis,philhealth,pagibig,dob,  area_n, shift_id, status,code);
											break;
											
										}
										
									}
									
								}
								else if(code==2) {
									if(lbl.charAt(0)=='B') {
										if(count_shifts<=9) {
											int shift_id=0;
											if(count_shifts<=5) {
												shift_id=1;
											}
											else{
												shift_id=2;
											}
											i =common_initiate( lname,  fname,  mname,contact_no, email , address, bt, tin,gsis,philhealth,pagibig,dob,  area_n, shift_id, status,code);
											break;
											
										}
										
									}
									
								}
								if(code==3) {
									if(lbl.charAt(0)=='C') {
										if(count_shifts<=9) {
											int shift_id=0;
											if(count_shifts<=5) {
												shift_id=1;
											}
											else{
												shift_id=2;
											}
											i =common_initiate( lname,  fname,  mname,contact_no, email , address, bt, tin,gsis,philhealth,pagibig,dob,  area_n, shift_id, status,code);
											break;
											
										}
										
									}
									
								}
								else if(code==4) {
									if(lbl.charAt(0)=='D') {
										if(count_shifts<=9) {
											int shift_id=0;
											if(count_shifts<=5) {
												shift_id=1;
											}
											else{
												shift_id=2;
											}
											i =common_initiate( lname,  fname,  mname,  contact_no,email,  address, bt, tin,gsis,philhealth,pagibig,dob,  area_n, shift_id, status,code);
											break;
										}
										
									}
									
									
								}
								else if(code==5) {
									if(lbl.charAt(0)=='E') {
										if(count_shifts<=9) {
											int shift_id=0;
											if(count_shifts<=5) {
												shift_id=1;
											}
											else{
												shift_id=2;
											}
											i =common_initiate( lname,  fname,  mname, contact_no, email,  address, bt, tin,gsis,philhealth,pagibig,dob,  area_n, shift_id, status,code);
											break;
										}
										
									}
									
								}
								else if(code==6) {
									if(lbl.charAt(0)=='F') {
										if(count_shifts<=9) {
											int shift_id=0;
											if(count_shifts<=5) {
												shift_id=1;
											}
											else{
												shift_id=2;
											}
											i =common_initiate( lname,  fname,  mname,  contact_no,email,  address, bt, tin,gsis,philhealth,pagibig,dob,  area_n, shift_id, status, code);
											break;
										}
										
									}
									
								}

			}
			
		}
		
		
		
		
			
			
			

		
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
		return i;
	}
	public int common_initiate (String lname, String fname, String mname, String contact_no, String email, String address, String bt, String tin,String gsis,String philhealth,String pagibig,String dob,  int area_n, int shift_id, String status, int code)  throws SQLException {
		String sql="";
		int this_id=0;
		int i=0;
		try {
			sql = "INSERT INTO tbl_personnel(fld_lname, fld_fname,fld_mname, fld_contact_no,fld_email, fld_address, fld_btype,fld_tin,fld_gsis, fld_philhealth, fld_pagibig, fld_dob, fld_status, fld_code) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setString(1, lname);
			ps.setString(2, fname);
			ps.setString(3, mname);
			ps.setString(4, contact_no);
			ps.setString(5, email);
			ps.setString(6, address);
			ps.setString(7, bt);
			ps.setString(8, tin);
			ps.setString(9, gsis);
			ps.setString(10, philhealth);
			ps.setString(11, pagibig);
			ps.setString(12, dob);
			ps.setString(13, status);
			ps.setInt(14, code);
			ps.executeUpdate();
			this_id=get_personnel_id(email);
			
			sql = "INSERT INTO tbl_ass(fld_personnel_id, fld_area_no, fld_shifts_id) VALUES (?,?,?)";
			PreparedStatement ps0 = conn().prepareStatement(sql);
			ps0.setInt(1, this_id);
			ps0.setInt(2, area_n);
			ps0.setInt(3, shift_id);
			i=ps0.executeUpdate();
			System.out.print("result is: ");
			System.out.println(i);
			System.out.print("area  is: ");
			System.out.println(area_n);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
		return i;
		
		
	}
	
	public int update_personnel(String lname, String fname,String mname, String contact_no, String email, String address, String bt, String tin,String gsis,String philhealth,String pagibig,String dob, String status, int code,int person_id)  throws SQLException {
		String sql="";
		int i=0;
		try {
			sql = "UPDATE tbl_personnel SET fld_lname=?, fld_fname=?,fld_mname=?, fld_contact_no=?,fld_email=?, fld_address=?, fld_btype=?,fld_tin=?,fld_gsis=?, fld_philhealth=?, fld_pagibig=?, fld_dob=?, fld_status=?, fld_code=? where fld_personnel_id=?";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setString(1, lname);
			ps.setString(2, fname);
			ps.setString(3, mname);
			ps.setString(4, contact_no);
			ps.setString(5, email);
			ps.setString(6, address);
			ps.setString(7, bt);
			ps.setString(8, tin);
			ps.setString(9, gsis);
			ps.setString(10, philhealth);
			ps.setString(11, pagibig);
			ps.setString(12, dob);
			ps.setString(13, status);
			ps.setInt(14, code);
			ps.setInt(15, person_id);
			i=ps.executeUpdate();
			i=2;
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
		return i;
		
		
	}
	public ResultSet R_areaLbl() throws SQLException {
		ResultSet rs = null;
		try {
			String sql = "SELECT distinct fld_lbl, fld_area_no FROM tbl_location order by fld_lbl asc";
			PreparedStatement ps = conn().prepareStatement(sql);
			rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	public int count_Shifts(int area_n) throws SQLException {
		ResultSet rs = null;
		int i=0;
		try {
			String sql = "SELECT count(fld_area_no) FROM tbl_ass where fld_area_no=?";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setInt(1, area_n);
			rs = ps.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					i= rs.getInt("count(fld_area_no)");
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
		return i;
	}
	public int registerMap(String mark,String lat, String lng, String loc_address, String loc_desc) throws SQLException {
		int i = 0;
		
		
		try {
			if(existingArea(mark)<1) {
				
			
			String sql = "INSERT INTO tbl_location(fld_lbl, fld_lat, fld_lng, fld_address, fld_desc) VALUES (?,?,?,?,?)";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setString(1, mark);
			ps.setString(2, lat);
			ps.setString(3, lng);
			ps.setString(4, loc_address);
			ps.setString(5, loc_desc);
		

			i = ps.executeUpdate();
		
			}
			else {
				return 2;
			}
			
			return i;
			
		
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
		
	}
	
	
	
	
	public int registerAreaAss(int personnel_id, int area_no) throws SQLException {
		int i = 0;
		
		try {
			String sql = "INSERT INTO tbl_area_ass(fld_area_no, fld_personnel_id) VALUES (?,?)";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setInt(1, area_no);
			ps.setInt(2, personnel_id);

			i = ps.executeUpdate();
			return i;
		} catch (Exception e) {
			e.printStackTrace();

			return 0 ;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
		
	}
	
	public int registerArea(String area) throws SQLException {
		int i = 0;
		
		try {
			String sql = "INSERT INTO tbl_location(fld_lat) VALUES (?)";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setString(1, area);
			i = ps.executeUpdate();
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			return 0 ;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
		
	}
	
	public int registerDayOffs(String day_offs) throws SQLException {
		int i = 0;
		
		try {
			if(existingDayOffs(day_offs)<1) {
				
			
			String sql = "INSERT INTO tbl_dayoffs(fld_day_offs) VALUES (?)";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setString(1, day_offs);

			i = ps.executeUpdate();
			}
			return i;
		} catch (Exception e) {
			e.printStackTrace();

			return 0 ;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
		
	}
	// method for fetch old data to be update
	public ResultSet fetchUserDetails(String uemail) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String sql = "SELECT UNAME,UEMAIL,UPASS,UDEG FROM STRUTS2CRUD WHERE UEMAIL=?";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setString(1, uemail);
			rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}

	// method for update new data in database
	public int updateUserDetails(String lname, String fname)
			throws SQLException, Exception {
		conn().setAutoCommit(false);
		int i = 0;
		try {
			String sql = "UPDATE STRUTS2CRUD SET UNAME=?,UEMAIL=?,UPASS=?,UDEG=? WHERE UEMAIL=?";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setString(1, lname);
			ps.setString(2, fname);
			
			i = ps.executeUpdate();
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			conn().rollback();
			return 0;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}

	// method for delete the record
	public int deleteUserDetails(int personnel_id) throws SQLException, Exception {
		conn().setAutoCommit(false);
		int i = 0;
		try {
			String sql = "DELETE FROM STRUTS2CRUD WHERE UEMAIL=?";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setInt(1, personnel_id);
			i = ps.executeUpdate();
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			conn().rollback();
			return 0;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	

	
	
public int deleteMap(int area_no) throws SQLException, Exception {
		
		int i = 0;
		try {
			String  sql = "Update tbl_ass set fld_area_no=0 WHERE fld_area_no=?";
			
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setInt(1, area_no);
			i = ps.executeUpdate();
			sql = "DELETE FROM tbl_location WHERE fld_area_no=?";
			PreparedStatement p = conn().prepareStatement(sql);
			p.setInt(1, area_no);
			i = p.executeUpdate();
			return i;
			
		} catch (Exception e) {
			e.printStackTrace();
			conn().rollback();
			return 0;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	
	public int deleteShifts(int shifts_id) throws SQLException, Exception {
		conn().setAutoCommit(false);
		int i = 0;
		try {
			String sql = "DELETE FROM tbl_shifts WHERE fld_shifts_id=?";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setInt(1, shifts_id);
			i=ps.executeUpdate();
			sql = "Update tbl_ass set fld_shifts_id=0 WHERE fld_shifts_id=?";
			PreparedStatement p = conn().prepareStatement(sql);
			p.setInt(1, shifts_id);
			p.executeUpdate();
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			conn().rollback();
			return 0;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	public int update_ass(int person_id, int day_offs_id, int shifts_id, int area_no) throws SQLException, Exception {
		conn().setAutoCommit(false);
		int i = 0;
		try {
			System.out.print("update id: ");
			System.out.println(person_id);	
			System.out.print("day off id: ");
			System.out.println(day_offs_id);
			System.out.print("shifts id: ");
			System.out.println(shifts_id);
			System.out.print("area no: ");
			System.out.println(area_no);
			String sql = "Update tbl_ass set fld_shifts_id=?, fld_area_no=?, fld_day_offs_id=? WHERE fld_personnel_id=?";
			PreparedStatement p = conn().prepareStatement(sql);
			p.setInt(1, shifts_id);
			p.setInt(2, area_no);
			p.setInt(3, day_offs_id);
			p.setInt(4, person_id);
			i = p.executeUpdate();
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			conn().rollback();
			return 0;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	public int deletePerson(int person_id, int active_status ) throws SQLException, Exception {
		conn().setAutoCommit(false);
		int i = 0;
		if(active_status==1) {active_status=0;}else {active_status=1;}
		try {
			String sql = "update tbl_personnel set fld_active=? WHERE fld_personnel_id=?";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setInt(1, active_status);
			ps.setInt(2, person_id);
			i = ps.executeUpdate();
			
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			conn().rollback();
			return 0;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
	}
	
	public int deleteDayOffs(int day_off_id) throws SQLException, Exception {
		conn().setAutoCommit(false);
		int i = 0;
		try {
			String sql = "DELETE FROM tbl_dayoffs WHERE fld_day_offs_id=?";
			PreparedStatement ps = conn().prepareStatement(sql);
			ps.setInt(1,day_off_id);
			i = ps.executeUpdate();
			sql = "update tbl_ass set fld_day_offs_id=0 WHERE fld_day_offs_id=?";
			PreparedStatement p = conn().prepareStatement(sql);
			p.setInt(1, day_off_id);
			p.executeUpdate();
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			conn().rollback();
			return 0;
		} finally {
			if (conn() != null) {
				conn().close();
			}
		}
		
	}
}
