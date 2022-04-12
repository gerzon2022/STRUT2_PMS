package com.rpms.action;


import java.sql.ResultSet;


import com.rpms.bean.ShiftBean;
import com.rpms.dao.Admin;
import com.rpms.action.LoginAction;
import com.opensymphony.xwork2.ActionContext;
import java.util.Map;

import java.util.*;

import javax.servlet.http.*;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;  
 
public class Retrieve extends HttpServlet {
	   public void doGet(HttpServletRequest request, HttpServletResponse response) {
		   try{
			     
			      HttpSession session=request.getSession(false);
			      int myName=(int)session.getAttribute("personid"); // we created a session variable "personid", this is how we use them by get attribute and converting it to int or string.
			      String myPass=(String)session.getAttribute("upass"); // same, converting to string from session variable named upass
			     
			  }catch(Exception exp){
			      
			   }
			  }
	   
	private static final long serialVersionUID = 6329394260276112660L;
	private String un,this_pw;
	private int id, this_id;
	HttpSession session = ServletActionContext.getRequest().getSession(true);
	
	ResultSet rs = null;
	ResultSet rs_personnel = null;
	ResultSet rs_area = null;
	ResultSet rs_days_off = null;
	ResultSet rs_shifts = null;
	ResultSet rs_ass = null;
	
	ShiftBean bean_personnel = null;
	ShiftBean bean_area = null;
	ShiftBean bean_day_offs = null;
	ShiftBean bean_shifts = null;
	ShiftBean bean = null;
	ShiftBean bean2 = null;
	ShiftBean bean_ass = null;
	
	List<ShiftBean> tbl_personnel = null;
	List<ShiftBean> tbl_ass = null;
	List<ShiftBean> tbl_location = null;
	List<ShiftBean> tbl_leave_app = null;
	List<ShiftBean> tbl_shifts = null;
	List<ShiftBean> beanList = null;
	List<ShiftBean> beanList2 = null;
	List<ShiftBean> tbl_day_offs = null;
	LoginAction login =new LoginAction();
	Admin admin = new Admin();
	private boolean noData = false;
	private String display_error;
	private String authUser;
	SessionMap<String,String> sessionmap; 
	private String errorinfo;
	private int pid, An, Bn, Cn,Dn,En,Fn,AreaA, AreaB,AreaC,AreaD,AreaE,AreaF;

	

	


	public String execute() throws Exception { //retrieve all data from tbl_shifts method
		try {
			
			beanList = new ArrayList<ShiftBean>();// and array object
			rs = admin.R_shifts();
			int i = 0;
			if (rs != null) {
				while (rs.next()) {
					i++;
					bean = new ShiftBean(); // create an instance of ShiftBean Class(located on com.rpms.bean) as bean
					bean.setSrNo(rs.getInt("fld_shifts_id")); //by creating an instance of that class we can access the methods declared in it(access the getters and setters to assign value).
					bean.setShift(rs.getString("fld_shift"));// in this method we assign values from column fld_shift in our database to variable shift.
//					bean.setUpass(rs.getString("UPASS").replaceAll("(?s).", "*"));
//					bean.setUdeg(rs.getString("UDEG"));
					beanList.add(bean);
				}
			}
			
			if (i == 0) {
				noData = false;
			} else {
				noData = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "DISPLAY";
	}
	
	
	
	public String retrieve_day_off_action() throws Exception { //retrieve all data on tbl_dayoffs
		try {
			tbl_day_offs = new ArrayList<ShiftBean>();
			rs = admin.R_Day_Offs();
			int i = 0;
			if (rs != null) {
				while (rs.next()) {
					i++;
					bean_day_offs = new ShiftBean();
					bean_day_offs.setDay_offs_id(rs.getInt("fld_day_offs_id"));
					bean_day_offs.setDay_offs(rs.getString("fld_day_offs"));
					tbl_day_offs.add(bean_day_offs); //this is passed and used in day_offs_forms.jsp line 131 as iterator object,
				}
			}
			
			if (i == 0) {
				noData = false;
			} else {
				noData = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "DISPLAY";
	}

	
	public void count_areaLbl() throws Exception { //methods used in personnel assignment to count the personnel assigned in the area.
		rs = admin.R_areaLbl();
		String lbl="";
		int A=0,B=0,C=0,D=0,E=0,F=0,area_n=0, i=0;
		if (rs != null) {
			while (rs.next()) {
				lbl=rs.getString("fld_lbl");
				area_n=rs.getInt("fld_area_no");
				i =admin.count_Shifts(area_n);
				lbl=rs.getString("fld_lbl");
				if(lbl.charAt(0)=='A' ) {if(i<1) {i++;} A=A+i; An=A;}//count all personnel in area A
				else if(lbl.charAt(0)=='B') {if(i<1){i++;} B=B+i;Bn=B;}//count all personnel in area B
				else if(lbl.charAt(0)=='C') {if(i<1){i++;} C=C+i;Cn=C;}//count all personnel in area C
				else if(lbl.charAt(0)=='D') {if(i<1){i++;} D=D+i;Dn=D;}//count all personnel in area D
				else if(lbl.charAt(0)=='E') {if(i<1){i++;} E=E+i;En=E;}//count all personnel in area E
				else if(lbl.charAt(0)=='F') {if(i<1){i++;} F=F+i;Fn=F;}//count all personnel in area F
				//System.out.println(lbl.charAt(0)+ " :"+D);
			}
		}
		i=0;
		rs=null;
		rs = admin.R_maps_by_lbl();
		if (rs != null) {
			while (rs.next()) {
				lbl=rs.getString("fld_lbl");
				if(lbl.charAt(0)=='A' ) {if(i<1) {i++;} AreaA=AreaA+i;} //count all area A ex. A1, A2..ETC
				else if(lbl.charAt(0)=='B') {if(i<1){i++;} AreaB=AreaB+i;}//count all area B ex. B1, B2..ETC
				else if(lbl.charAt(0)=='C') {if(i<1){i++;} AreaC=AreaC+i;}//...
				else if(lbl.charAt(0)=='D') {if(i<1){i++;} AreaD=AreaD+i;}//...
				else if(lbl.charAt(0)=='E') {if(i<1){i++;} AreaE=AreaE+i;}//...
				else if(lbl.charAt(0)=='F') {if(i<1){i++;} AreaF=AreaF+i;}//...
				//System.out.println(lbl.charAt(0)+ " :"+D);
			}
		}
		
	}
	public String retrieve_personnel() throws Exception { // Retrieve tbl_personnel data
		try {
			beanList = new ArrayList<ShiftBean>();
			rs = admin.R_personnel();
			int i = 0;
			if (rs != null) {
				while (rs.next()) {
					i++;
					bean = new ShiftBean();
					bean.setPersonnel_id(rs.getInt("fld_personnel_id"));
					bean.setLname(rs.getString("fld_lname"));
					bean.setFname(rs.getString("fld_fname"));
					bean.setMname(rs.getString("fld_mname"));
					bean.setEmail(rs.getString("fld_email"));
					bean.setContact_no(rs.getString("fld_contact_no"));
					bean.setFld_active(rs.getInt("fld_active"));
					bean.setDob(rs.getString("fld_dob"));
					bean.setBtype(rs.getString("fld_btype"));
					bean.setAddress(rs.getString("fld_address"));
					bean.setTin(rs.getString("fld_tin"));
					bean.setGsis(rs.getString("fld_gsis"));
					bean.setPagibig(rs.getString("fld_pagibig"));
					bean.setPhilhealth(rs.getString("fld_philhealth"));
					bean.setStatus(rs.getString("fld_status"));
					bean.setCode(rs.getInt("fld_code"));
//					bean.setUpass(rs.getString("UPASS").replaceAll("(?s).", "*"));
//					bean.setUdeg(rs.getString("UDEG"));
					beanList.add(bean); // beanList contains all the retrieved data from our database, it will be passed to html page to display the data.
					
				}
				
			}
			count_areaLbl(); //calling this method
			dboard();
			
			if (i == 0) {
				noData = false;
			} else {
				noData = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			display_error=e.toString();
		}
		
		return "DISPLAY";
	}

	public String dboard() throws Exception { //call this methods after successfully logged in.
		try {
			int i=0;
			rs = admin.count_users();
			if (rs != null) {
				while (rs.next()) {
					i++;
					ActionContext.getContext().getSession()
	                .put("users_count",rs.getInt("count(fld_personnel_id)"));
					

				}
			}
			rs = admin.count_admin("Admin");
			if (rs != null) {
				while (rs.next()) {
					i++;
					ActionContext.getContext().getSession()
	                .put("admin_count",rs.getInt("count(fld_personnel_id)"));
					

				}
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
			display_error=e.toString();
		}
		
		return "success";
	}

	public String personnel_ass() throws Exception { //retrieved personnel assignment data
		int i = 0;
		tbl_personnel = new ArrayList<ShiftBean>();
		beanList = new ArrayList<ShiftBean>();
		tbl_shifts=new ArrayList<ShiftBean>();
		tbl_location=new ArrayList<ShiftBean>();
		tbl_day_offs=new ArrayList<ShiftBean>();
		tbl_ass=new ArrayList<ShiftBean>();
		rs_personnel=null;
		try {
			
			
			rs_personnel = admin.R_personnel_ass();
			
			if (rs_personnel != null) {
				while (rs_personnel.next()) {
					i++;
					bean = new ShiftBean();
					bean.setP_id(rs_personnel.getInt("fld_personnel_id"));
					bean.setLname(rs_personnel.getString("fld_lname"));
					bean.setFname(rs_personnel.getString("fld_fname"));
					bean.setMname(rs_personnel.getString("fld_mname"));
					bean.setEmail(rs_personnel.getString("fld_email"));
					bean.setContact_no(rs_personnel.getString("fld_contact_no"));
					tbl_personnel.add(bean);// tbl_personnel is an array that contains the data from tbl_ass of our database, this array will be passed the html page to dispay the data.
					
				}
			}
			if (i == 0) {
				noData = false;
			} else {
				noData = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			errorinfo=e.toString();
		}
		
		try {
			rs=null;
			rs=admin.R_shifts();
			if (rs != null) {
				while (rs.next()) {
					i++;
					bean = new ShiftBean();
					bean.setSrNo(rs.getInt("fld_shifts_id"));
					bean.setShift(rs.getString("fld_shift"));
					tbl_shifts.add(bean); // tbl_shifts is an array object, this will be used in diplaying the data to our html page
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			errorinfo=e.toString();
		}
			try {
				rs=null;
				rs = admin.R_Day_Offs();
				 i = 0;
				if (rs != null) {
					while (rs.next()) {
						i++;
						bean_day_offs = new ShiftBean();
						//bean.setDay_offs_pid(rs.getInt("fld_personnel_id"));
						bean_day_offs.setDay_offs_id(rs.getInt("fld_day_offs_id"));
						bean_day_offs.setDay_offs(rs.getString("fld_day_offs"));
//						bean.setUpass(rs.getString("UPASS").replaceAll("(?s).", "*"));
//						bean.setUdeg(rs.getString("UDEG"));
						tbl_day_offs.add(bean_day_offs);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				errorinfo=e.toString();
			}
			
			try {
				rs=null;
				rs = admin.R_maps();
				i = 0;
				if (rs != null) {
					while (rs.next()) {
						i++;
						bean = new ShiftBean();
						bean.setArea_no(rs.getInt("fld_area_no"));
						bean.setMap_address(rs.getString("fld_address"));
						bean.setLat(rs.getString("fld_lat"));
						bean.setLng(rs.getString("fld_lng"));
						bean.setMarked_lbl(rs.getString("fld_lbl"));
						bean.setLoc_desc(rs.getString("fld_desc"));
						tbl_location.add(bean); //tbl_location is an array, to be used in display data to our html page, please do not be confuse, it is thesame with the table name in our database, you can freely change this name if you want.
													//but make sure to also change the array on the html page.(you can locate it on personnel_ass.jsp file)
												////tbl_location, you will find this variable on register_map in this tag<s: iterator value='tbl_Location'></s:iterator> between this tag iteration happens.
					}
					
				}
			} catch (Exception e) {
				e.printStackTrace();
				errorinfo=e.toString();
			}
			
			try {
				rs=null;
				rs = admin.R_ass();
				i = 0;
				if (rs != null) {
					while (rs.next()) {
						i++;
						bean_ass = new ShiftBean();
						bean_ass.setDay_offs_pid(rs.getInt("fld_day_offs_id"));
						bean_ass.setAss_pid(rs.getInt("fld_personnel_id"));
						bean_ass.setShifts_pid(rs.getInt("fld_shifts_id"));
						bean_ass.setArea_pid(rs.getInt("fld_area_no"));
						
						tbl_ass.add(bean_ass);//tbl_ass in an array, you will find this variable on personnel_ass in this tag<s: iterator value='tbl_ass'></s:iterator> between this tag iteration happens.
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				errorinfo=e.toString();
			}
			
			
			
		
		
		return "DISPLAY";
	}
	public String retrieve_map() throws Exception { //retrieve map data method
		try {
			
			beanList = new ArrayList<ShiftBean>();
			rs = admin.R_maps();
			int i = 0;
			if (rs != null) {
				while (rs.next()) {
					i++;
					bean = new ShiftBean();
					bean.setArea_no(rs.getInt("fld_area_no"));
					bean.setMap_address(rs.getString("fld_address"));
					bean.setLat(rs.getString("fld_lat"));
					bean.setLng(rs.getString("fld_lng"));
					bean.setMarked_lbl(rs.getString("fld_lbl"));
					bean.setLoc_desc(rs.getString("fld_desc"));
					beanList.add(bean); //beanList in an array, you will find this variable on register_map in this tag<s: iterator value='beanList'></s:iterator> between this tag iteration happens.
				}
			}

			if (i == 0) {
				noData = false;
			} else {
				noData = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "DISPLAY";
	}
	
	
	private int person_id;
	public String retrieve_by_id() throws Exception {
		try {
			beanList = new ArrayList<ShiftBean>();
			
			rs=admin.R_profile(person_id);
			int i = 0;
			if (rs != null) {
				while (rs.next()) {
					i++;
					bean = new ShiftBean();
					
					bean.setMap_address(rs.getString("fld_address"));
					bean.setMap_url(rs.getString("fld_url"));
//					bean.setUpass(rs.getString("UPASS").replaceAll("(?s).", "*"));
//					bean.setUdeg(rs.getString("UDEG"));
					beanList.add(bean);
				}
			}

			if (i == 0) {
				noData = false;
			} else {
				noData = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "DISPLAY";
	}
	
	// the getters and setters methods of each variable, this methods are to get the value or set the value of that specific variable
	public boolean isNoData() {
		return noData;
	}

	public void setNoData(boolean noData) {
		this.noData = noData;
	}
 
	public List<ShiftBean> getBeanList() {
		return beanList;
	}

	public void setBeanList(List<ShiftBean> beanList) {
		this.beanList = beanList;
	}
	public List<ShiftBean> getBeanList2() {
		return beanList2;
	}

	public void setBeanList2(List<ShiftBean> beanList2) {
		this.beanList2 = beanList2;
	}
	public List<ShiftBean> getTbl_ass() {
		return tbl_ass;
	}

	public void setTbl_ass(List<ShiftBean> tbl_ass) {
		this.tbl_ass = tbl_ass;
	}

	public String getDisplay_error() {
		return display_error;
	}
	public void setDisplay_error(String display_error) {
		this.display_error = display_error;
	}
	public List<ShiftBean> getTbl_day_offs() {
		return tbl_day_offs;
	}
	public void setTbl_day_offs(List<ShiftBean> tbl_day_offs) {
		this.tbl_day_offs = tbl_day_offs;
	}
	public List<ShiftBean> getTbl_personnel() {
		return tbl_personnel;
	}
	public void setTbl_personnel(List<ShiftBean> tbl_personnel) {
		this.tbl_personnel = tbl_personnel;
	}
	public List<ShiftBean> getTbl_location() {
		return tbl_location;
	}
	public void setTbl_location(List<ShiftBean> tbl_location) {
		this.tbl_location = tbl_location;
	}
	public List<ShiftBean> getTbl_shifts() {
		return tbl_shifts;
	}
	public void setTbl_shifts(List<ShiftBean> tbl_shifts) {
		this.tbl_shifts = tbl_shifts;
	}

	public String getUn() {
		return un;
	}

	public void setUn(String un) {
		this.un = un;
	}

	public String getThis_pw() {
		return this_pw;
	}

	public void setThis_pw(String this_pw) {
		this.this_pw = this_pw;
	}



	public String getAuthUser() {
		return authUser;
	}

	public void setAuthUser(String authUser) {
		this.authUser = authUser;
	}
	public void setSession(Map map) {  
	    sessionmap=(SessionMap)map;  
	    sessionmap.put("user",authUser);  
	}  
	  
	public String logout(){  
	    sessionmap.invalidate();  
	    return "success";  
	}

	public String getErrorinfo() {
		return errorinfo;
	}

	public void setErrorinfo(String errorinfo) {
		this.errorinfo = errorinfo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getThis_id() {
		return this_id;
	}

	public void setThis_id(int this_id) {
		this.this_id = this_id;
	}

	public int getEn() {
		return En;
	}

	public void setEn(int en) {
		En = en;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getAn() {
		return An;
	}

	public void setAn(int an) {
		An = an;
	}

	public int getFn() {
		return Fn;
	}

	public void setFn(int fn) {
		Fn = fn;
	}

	public int getDn() {
		return Dn;
	}

	public void setDn(int dn) {
		Dn = dn;
	}

	public int getCn() {
		return Cn;
	}

	public void setCn(int cn) {
		Cn = cn;
	}

	public int getBn() {
		return Bn;
	}

	public void setBn(int bn) {
		Bn = bn;
	}

	public int getAreaE() {
		return AreaE;
	}

	public void setAreaE(int areaE) {
		AreaE = areaE;
	}

	public int getAreaD() {
		return AreaD;
	}

	public void setAreaD(int areaD) {
		AreaD = areaD;
	}

	public int getAreaF() {
		return AreaF;
	}

	public void setAreaF(int areaF) {
		AreaF = areaF;
	}

	public int getAreaC() {
		return AreaC;
	}

	public void setAreaC(int areaC) {
		AreaC = areaC;
	}

	public int getAreaA() {
		return AreaA;
	}

	public void setAreaA(int areaA) {
		AreaA = areaA;
	}

	public int getAreaB() {
		return AreaB;
	}

	public void setAreaB(int areaB) {
		AreaB = areaB;
	}

	public int getPerson_id() {
		return person_id;
	}

	public void setPerson_id(int person_id) {
		this.person_id = person_id;
	}  

}

