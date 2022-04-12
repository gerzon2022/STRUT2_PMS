package com.rpms.action;

import java.sql.ResultSet;

import com.rpms.dao.Admin;

import com.opensymphony.xwork2.ActionSupport;

public class UpdateAction extends ActionSupport {

	private static final long serialVersionUID = -1905974197186620917L;
	private String lname = "", fname = "";
	private String msg = "";
	private int area_no, shifts_id, day_offs_id, person_id;
	ResultSet rs = null;
	Admin dao = new Admin();
	String submitType;

	@Override
	public String execute() throws Exception {
		try {
			if (submitType.equals("updatedata")) {
				rs = dao.fetchUserDetails(lname.trim());
				if (rs != null) {
					while (rs.next()) {
						lname = rs.getString("fld_lname");
						fname = rs.getString("fld_fname");
						
					}
				}
			} else {
				int i = dao.updateUserDetails(lname, fname);
				if (i > 0) {
					msg = "Record Updated Successfuly";
				} else {
					msg = "error";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "UPDATE";
	}

	public String update_ass() throws Exception { // update the assignment of personnel
		try {
			int i=0;
			i = dao.update_ass(person_id, day_offs_id, shifts_id, area_no); //here is dao as an instance of Admin, it access the method update_ass with parameters of person_id, day_offs_id, shifts_id and area no. these are the new values.
				
				if (i > 0) {
					msg = "Record Updated Successfuly"; 
				} else {
					msg = "error";	
				}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "UPDATE";
	}
	private String mname, address, bt, tin, gsis,philhealth,pagibig,dob,  status;
	
	private int code;
	private String email, frist_name, last_name,contact_num;
	
public String update_personnel() throws Exception { // update personnel informations method
		
		
		int i=0;
		System.out.print("data below:");
		System.out.println(last_name+frist_name+ contact_num+ email+ address+ bt+ tin+ gsis+ philhealth+ pagibig+ dob+ person_id);
		try {
			i=dao.update_personnel(last_name, frist_name,mname, contact_num, email, address, bt, tin, gsis, philhealth, pagibig, dob,status,code, person_id);
		
			
			if (i > 0) {
				msg = "Successfully Updated!";
			}
			
			else {
				msg = "Update not Successful!";
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg=msg+e.toString();
				
		}
	

	return "PERSONNEL";
}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}



	public String getSubmitType() {
		return submitType;
	}

	public void setSubmitType(String submitType) {
		this.submitType = submitType;
	}


	public int getPerson_id() {
		return person_id;
	}


	public void setPerson_id(int person_id) {
		this.person_id = person_id;
	}


	public int getDay_offs_id() {
		return day_offs_id;
	}


	public void setDay_offs_id(int day_offs_id) {
		this.day_offs_id = day_offs_id;
	}


	public int getArea_no() {
		return area_no;
	}


	public void setArea_no(int area_no) {
		this.area_no = area_no;
	}


	public int getShifts_id() {
		return shifts_id;
	}


	public void setShifts_id(int shifts_id) {
		this.shifts_id = shifts_id;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBt() {
		return bt;
	}

	public void setBt(String bt) {
		this.bt = bt;
	}

	public String getTin() {
		return tin;
	}

	public void setTin(String tin) {
		this.tin = tin;
	}

	public String getPhilhealth() {
		return philhealth;
	}

	public void setPhilhealth(String philhealth) {
		this.philhealth = philhealth;
	}

	public String getPagibig() {
		return pagibig;
	}

	public void setPagibig(String pagibig) {
		this.pagibig = pagibig;
	}

	public String getFrist_name() {
		return frist_name;
	}

	public void setFrist_name(String frist_name) {
		this.frist_name = frist_name;
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

	public String getContact_num() {
		return contact_num;
	}

	public void setContact_num(String contact_num) {
		this.contact_num = contact_num;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getGsis() {
		return gsis;
	}

	public void setGsis(String gsis) {
		this.gsis = gsis;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}
	

}
