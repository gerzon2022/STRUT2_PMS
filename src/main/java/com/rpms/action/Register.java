package com.rpms.action;


import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.opensymphony.xwork2.ActionSupport;
import com.rpms.bean.ShiftBean;
import com.rpms.dao.Admin;



public class Register extends ActionSupport {

	
	private static final long serialVersionUID = 1L;
	private String time_out,email, frist_name, last_name,password, map_url, contact_num, map_address; //the name of the input tag on the html page shoud be thesame in this file
	
	private String time_in,  loc_desc; // same explanation above, in order to pass value from html form to here, getters and setters method for each variable are generated, it is in the bottom, the variables are accompanied with set and get keyword.
														//ex. if you have a input tag named "loc_desc" on your registration form, you will also need to create a variable here of the same name, then a getter and setter method are generated, you will find a getLoc_desc and setLoc_desc method at the bottom along with the other variable.
	private String[] day_offs;
	private String msg = "";
	private int pid,A,D,E,F;
	private String this_date;
	
	
	
	

	ResultSet rs = null;
	ShiftBean bean = null;
	List<ShiftBean> beanList = null;
	Admin admin = null;
	Retrieve retrieve=null;
	int ctr =0 ;

	@Override
	public String execute() throws Exception { //for shifts registration
		admin = new Admin();
		String shifts="Time in: "+ time_in + " Time out: "+time_out;
		try {
			
			ctr = admin.registerShift(shifts);
			if (ctr > 0) {
				msg = "Registration Successfull";
			} else {
				msg = "Already Registered!";
			
			}
		} catch (Exception e) {
			e.printStackTrace();
				setMsg(e.getMessage());
		}

		return "SHIFTS";
	}
	public String reg_day_offs() throws Exception { // for day off registration
		admin = new Admin();
		String dayoffs=" ";
		for(String s : day_offs) {
			dayoffs= dayoffs + s; // this is to concatenate the day offs into one word. ex "MonTue" 
		}
		
		try {
			
			ctr = admin.registerDayOffs(dayoffs);
			if (ctr > 0) {
				msg = "Registration Successfull";
			} else {
				msg = "Already Registered!";
			
			}
		} catch (Exception e) {
			e.printStackTrace();
				setMsg(e.getMessage());
		}

		return "dayoffs"; // you can change the return value, but make sure it is the same result name on struts.xml(remember, the return value of methods are the result name of every action in the struts.xml)
	}
	private String mname, address, bt, tin, gsis,philhealth,pagibig,bod,  status;
	private int code;
	public String reg_personnel() throws Exception { //methods for registration of personnel
			admin = new Admin(); //here we create instance for Admin class as admin
			retrieve=new Retrieve(); //here we create instance for Retrieve class as retrieve or your choice of name
			
			try {
				
				ctr= admin.registerPersonnel(last_name, frist_name, mname, contact_num, email, code, address, bt, tin, gsis,philhealth,pagibig,bod, status); //this method will return 0 or greater than 0 value and store it to the variable ctr
				
				if (ctr > 0) { //ctr is greater than 0 then you have successfully registered the personnel 
					msg = "Successfully Registered";
					retrieve.retrieve_personnel();
					
				}
				
				else {
					msg = "You can no longer assign personnel in this category due to maximum personnel allowed per Area!, Please go to Area assignment";
				
				}
				if(ctr==2) {msg="Already Registered!";}
			} catch (Exception e) {
				e.printStackTrace();
				msg=msg+e.toString();
					
			}
		

		return "PERSONNEL";
	}
	
	private String marked, lat, lng;
	public String reg_map() throws Exception { // for registration of map
		admin = new Admin();
		retrieve= new Retrieve();
		
		
		
		try {
			if(map_address!=null) {
				ctr= admin.registerMap(marked, lat,lng, map_address, loc_desc);
				if (ctr > 0) {
					msg = "Successfully Registered";
					
					retrieve.retrieve_map();
				} 
				
				else {
					msg = "Error!";
				}
				if(ctr==2) {msg="Already Registered!";}
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg=msg+e.toString();
			return msg;
				
		}
		return "MAP";
	}
	
	public String getTime_out() { //getter method of time_out variable
		return time_out;
	}
	public void setTime_out(String time_out) { //setters for timeout variable, this is how we pass values from html pages to here. the getters and setters methods of every variable
		this.time_out = time_out;
	}
	public String getTime_in() { // you can find more getters and setters of every variables here.
		return time_in;
	}
	public void setTime_in(String time_in) {
		this.time_in = time_in;
	}


	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String[] getDay_offs() {
		return day_offs;
	}
	public void setDay_offs(String[] day_offs) {
		this.day_offs = day_offs;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFrist_name() {
		return frist_name;
	}
	public void setFrist_name(String frist_name) {
		this.frist_name = frist_name;
	}
	public String getMap_url() {
		return map_url;
	}
	public void setMap_url(String map_url) {
		this.map_url = map_url;
	}
	public String getContact_num() {
		return contact_num;
	}
	public void setContact_num(String contact_num) {
		this.contact_num = contact_num;
	}
	public String getMap_address() {
		return map_address;
	}
	public void setMap_address(String map_address) {
		this.map_address = map_address;
	}


	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getThis_date() {
		return this_date;
	}
	public void setThis_date(String this_date) {
		this.this_date = this_date;
	}
	public String getMarked() {
		return marked;
	}
	public void setMarked(String marked) {
		this.marked = marked;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getLoc_desc() {
		return loc_desc;
	}
	public void setLoc_desc(String loc_desc) {
		this.loc_desc = loc_desc;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getE() {
		return E;
	}
	public void setE(int e) {
		E = e;
	}
	public int getA() {
		return A;
	}
	public void setA(int a) {
		A = a;
	}
	public int getF() {
		return F;
	}
	public void setF(int f) {
		F = f;
	}
	public int getD() {
		return D;
	}
	public void setD(int d) {
		D = d;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPagibig() {
		return pagibig;
	}
	public void setPagibig(String pagibig) {
		this.pagibig = pagibig;
	}
	public String getBod() {
		return bod;
	}
	public void setBod(String bod) {
		this.bod = bod;
	}
	public String getTin() {
		return tin;
	}
	public void setTin(String tin) {
		this.tin = tin;
	}
	public String getBt() {
		return bt;
	}
	public void setBt(String bt) {
		this.bt = bt;
	}
	public String getGsis() {
		return gsis;
	}
	public void setGsis(String gsis) {
		this.gsis = gsis;
	}
	public String getPhilhealth() {
		return philhealth;
	}
	public void setPhilhealth(String philhealth) {
		this.philhealth = philhealth;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
  


}
