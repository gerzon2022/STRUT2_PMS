package com.rpms.action;

import java.util.Map;
 
import org.apache.struts2.interceptor.SessionAware;
 
import com.opensymphony.xwork2.ActionSupport;
 
public class MyAction extends ActionSupport implements SessionAware {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> sessionMap;
	public Map<String, Object> getSessionMap() {
		return sessionMap;
	}
	public void setSessionMap(Map<String, Object> sessionMap) {
		this.sessionMap = sessionMap;
	}
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}
     
   
 
 
    // action method goes here...
}