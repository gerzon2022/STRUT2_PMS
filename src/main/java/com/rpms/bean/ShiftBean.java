package com.rpms.bean;

import java.sql.Date;

public class ShiftBean {
	private String mname, lat, lng, marked_lbl,contact_no, shift_in, shift_out, lname,fname,email, shift, day_offs, map_address, map_url, userType, leavetype, date_leave, date_filed,date_approved, leave_status;
	private int personnel_id, shift_id, day_offs_id, area_no, p_id,shifts_pid, day_offs_pid, ass_pid, area_pid, fld_active,code;
	Date date_L;
	private String loc_desc;
	private String dob, btype,address, tin, gsis,pagibig, philhealth, status, category;
	public Date getDate_L() {
		return date_L;
	}

	public void setDate_L(Date date_L) {
		this.date_L = date_L;
	}

	int srNo;

	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}

	public String getShift_in() {
		return shift_in;
	}

	public void setShift_in(String shift_in) {
		this.shift_in = shift_in;
	}

	public String getShift_out() {
		return shift_out;
	}

	public void setShift_out(String shift_out) {
		this.shift_out = shift_out;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public int getDay_offs_id() {
		return day_offs_id;
	}

	public void setDay_offs_id(int day_offs_id) {
		this.day_offs_id = day_offs_id;
	}

	public int getShift_id() {
		return shift_id;
	}

	public void setShift_id(int shift_id) {
		this.shift_id = shift_id;
	}

	public int getArea_no() {
		return area_no;
	}

	public void setArea_no(int area_no) {
		this.area_no = area_no;
	}

	public int getPersonnel_id() {
		return personnel_id;
	}

	public void setPersonnel_id(int personnel_id) {
		this.personnel_id = personnel_id;
	}



	public String getDay_offs() {
		return day_offs;
	}

	public void setDay_offs(String day_offs) {
		this.day_offs = day_offs;
	}



	public String getMap_url() {
		return map_url;
	}

	public void setMap_url(String map_url) {
		this.map_url = map_url;
	}

	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getMap_address() {
		return map_address;
	}

	public void setMap_address(String map_address) {
		this.map_address = map_address;
	}

	public String getShift() {
		return shift;
	}

	public void setShift(String shift) {
		this.shift = shift;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getLeavetype() {
		return leavetype;
	}

	public void setLeavetype(String leavetype) {
		this.leavetype = leavetype;
	}

	public String getLeave_status() {
		return leave_status;
	}

	public void setLeave_status(String leave_status) {
		this.leave_status = leave_status;
	}

	public String getDate_leave() {
		return date_leave;
	}

	public void setDate_leave(String date_leave) {
		this.date_leave = date_leave;
	}

	public String getDate_filed() {
		return date_filed;
	}

	public void setDate_filed(String date_filed) {
		this.date_filed = date_filed;
	}

	public String getDate_approved() {
		return date_approved;
	}

	public void setDate_approved(String date_approved) {
		this.date_approved = date_approved;
	}

	public int getShifts_pid() {
		return shifts_pid;
	}

	public void setShifts_pid(int shifts_pid) {
		this.shifts_pid = shifts_pid;
	}

	public int getDay_offs_pid() {
		return day_offs_pid;
	}

	public void setDay_offs_pid(int day_offs_pid) {
		this.day_offs_pid = day_offs_pid;
	}

	public int getAss_pid() {
		return ass_pid;
	}

	public void setAss_pid(int ass_pid) {
		this.ass_pid = ass_pid;
	}

	public int getArea_pid() {
		return area_pid;
	}

	public void setArea_pid(int area_pid) {
		this.area_pid = area_pid;
	}

	public String getMarked_lbl() {
		return marked_lbl;
	}

	public void setMarked_lbl(String marked_lbl) {
		this.marked_lbl = marked_lbl;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public int getFld_active() {
		return fld_active;
	}

	public void setFld_active(int fld_active) {
		this.fld_active = fld_active;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhilhealth() {
		return philhealth;
	}

	public void setPhilhealth(String philhealth) {
		this.philhealth = philhealth;
	}

	public String getGsis() {
		return gsis;
	}

	public void setGsis(String gsis) {
		this.gsis = gsis;
	}

	public String getPagibig() {
		return pagibig;
	}

	public void setPagibig(String pagibig) {
		this.pagibig = pagibig;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getTin() {
		return tin;
	}

	public void setTin(String tin) {
		this.tin = tin;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}








}
