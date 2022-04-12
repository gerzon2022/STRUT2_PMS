package com.rpms.action;

import com.rpms.dao.Admin;

public class Delete {
//	private static final long serialVersionUID = -146601914103585418L;
	private String msg, what;
	private int personnel_id, loc_id, active_status;
	private int shifts_id, person_id, leave_id;
	
	private int Day_offs_id;
	Admin dao = new Admin(); // created an instance of Admin class as dao, in this way we can access the methods of admin


	public String execute() throws Exception {
		try {
			int isDeleted = dao.deleteUserDetails(personnel_id); //dao is the instance of Admin and deleteUserDetails is a method of Admin that requires a parameter personnel_id
			if (isDeleted > 0) { // by calling the method above it will return value of 0 if not deleted and greater than 0 if deleted
				setMsg("Record deleted successfully"); // we have msg variable in the interface, so what ever the value assigned here will be reflected to the interface
			} else {
				setMsg("Some error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "DELETE"; //returned value is very important to struts.xml file, this determine what page to be displayed
	}

	public String delete_shifts() throws Exception { //delete shifts methods
		try {
			int isDeleted = dao.deleteShifts(shifts_id);
			if (isDeleted > 0) {
				setMsg("Record deleted successfully");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "DELETED";
	}
	
	public String del_map() throws Exception { //delete map method
		try {
			int isDeleted = dao.deleteMap(loc_id);
			if (isDeleted > 0) {
				setMsg("Record deleted successfully");
			} else {
				setMsg("Some error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	public String delete_person() throws Exception { //delete personnel method
		try {
			int isDeleted = dao.deletePerson(person_id, active_status );
			
			if (isDeleted > 0) {
				setMsg("Record updated successfully");
			} else {
				setMsg("Some error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "DELETED";
	}
	
	public String delete_day_offs() throws Exception { // delete dayoffs
		try {
			int isDeleted = dao.deleteDayOffs(Day_offs_id);
			if (isDeleted > 0) {
				setMsg("Record deleted successfully");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "DELETED";
	}
	public int getPersonnel_id() {
		return personnel_id;
	}

	public void setPersonnel_id(int personnel_id) {
		this.personnel_id = personnel_id;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getShifts_id() {
		return shifts_id;
	}

	public void setShifts_id(int shifts_id) {
		this.shifts_id = shifts_id;
	}

	public int getDay_offs_id() {
		return Day_offs_id;
	}

	public void setDay_offs_id(int day_offs_id) {
		Day_offs_id = day_offs_id;
	}

	public int getPerson_id() {
		return person_id;
	}

	public void setPerson_id(int person_id) {
		this.person_id = person_id;
	}

	public int getLeave_id() {
		return leave_id;
	}

	public void setLeave_id(int leave_id) {
		this.leave_id = leave_id;
	}

	public int getLoc_id() {
		return loc_id;
	}

	public void setLoc_id(int loc_id) {
		this.loc_id = loc_id;
	}

	public String getWhat() {
		return what;
	}

	public void setWhat(String what) {
		this.what = what;
	}

	public int getActive_status() {
		return active_status;
	}

	public void setActive_status(int active_status) {
		this.active_status = active_status;
	}
}
