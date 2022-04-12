package com.rpms.action;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TryCatchFinally;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.rpms.bean.ShiftBean;
import com.rpms.dao.Admin;

public class LoginAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = -3434561352924343132L;
	Admin admin = new Admin();
	private boolean noData = false;
	private String display_error;
	private String authUser;
	private String email, password;
	ResultSet rs = null;
	List<ShiftBean> beanList = null;
	// Generate getters and setters....
	private String userId, userPass, msg;
	private SessionMap<String, Object> sessionMap;
	HttpSession session = ServletActionContext.getRequest().getSession(true);
	@Override
	public void setSession(Map<String, Object> map) {
		sessionMap = (SessionMap<String, Object>) map;
	}

	@Override
	public String execute() throws Exception {
		
		
			int personid=0;
		
			
			try {
				beanList = new ArrayList<ShiftBean>();
				rs = admin.R_login(userId, userPass);
				int i = 0;
				
				String fullname=null;
				if (rs != null) {
					while (rs.next()) {
						i++;
						
						authUser=rs.getString("fld_privilege");
						personid=rs.getInt("fld_personnel_id");
					    fullname=rs.getString("fld_lname") +", "+rs.getString("fld_fname");
						
					}
					sessionMap.put("person_id",userId);
				    sessionMap.put("fullname",userId);
				    sessionMap.put("userType",authUser);
				    sessionMap.put("fullname",fullname);
					String getSessionAttr = (String) session.getAttribute("userType");
					if(getSessionAttr!=null) {
						
						rs = admin.count_users();
						if (rs != null) {
							while (rs.next()) {
								sessionMap.put("users_count",rs.getInt("count(fld_personnel_id)"));
							}
						}
						rs = admin.count_admin("Admin");
						if (rs != null) {
							while (rs.next()) {
								sessionMap.put("admin_count",rs.getInt("count(fld_personnel_id)"));
							}
						}
						
						return "success";
					}
					
					
				}
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}
			msg = "These credentials does not match our records";
			return "login";
		
	}
	public String index() throws Exception {
		
	
		String getSessionAttr = (String) session.getAttribute("userType");
		if(getSessionAttr!=null) {
			return "success";
		}
		return "login";
	}
	
	public String logout() {
		
		sessionMap.remove("userType");
		sessionMap.invalidate();
		
		return "logout";
	}

	public SessionMap<String, Object> getSessionMap() {
		return sessionMap;
	}

	public void setSessionMap(SessionMap<String, Object> sessionMap) {
		this.sessionMap = sessionMap;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public boolean isNoData() {
		return noData;
	}

	public void setNoData(boolean noData) {
		this.noData = noData;
	}

	public String getDisplay_error() {
		return display_error;
	}

	public void setDisplay_error(String display_error) {
		this.display_error = display_error;
	}



}