



import java.sql.ResultSet;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.rpms.dao.Admin;

class AuthenticationTest extends ActionSupport implements SessionAware{

	
	private static final long serialVersionUID = 1L;
	
	private Map<String,Object> sessionMap;
	
	public Map<String, Object> getSessionMap() {
		return sessionMap;
	}


	
	
    private String userName;
    private String password;
    private String authUser;
    String user_type="NOT REGISTERED";
    private int this_id;
    Admin admin = new Admin(); // create an instance of Admin class as admin and to be use within this class,with this you can access the methods of another class.
    ResultSet rs = null;
    int ctr =0;
  
    private String msg;
   
	
	public String profile() {
    	int person_id=0;
    	int area_no=0;
    	int day_offs_id=0;
    	int shifts_id=0;
    	String shifts=null;
    	String lname=null;
    	String f_name=null;
    	String email=null;
    	String contact=null;
    	String day_offs=null;
    
    	try {
			
			
			rs = admin.R_profile(this_id); //R_profile is a method found in Admin Class which is to retrieve the personnel infos
			int i = 0;
			if (rs != null) {
				while (rs.next()) {
					i++;
					person_id=rs.getInt("fld_personnel_id");
					area_no=rs.getInt("fld_area_no");
					day_offs_id=rs.getInt("fld_day_offs_id");
					shifts_id=rs.getInt("fld_shifts_id");
					lname=rs.getString("fld_lname");
					f_name=rs.getString("fld_fname");
					email=rs.getString("fld_email");
					contact=rs.getString("fld_contact_no");
				}
				//sessionMap is the code to create session variable and assign value to it,
	            sessionMap.put("email", email);// "email" is the session name and email contains variable
	            sessionMap.put("contact_no", contact); //you can use session through out the pages. there is also a code to access the session
	            sessionMap.put("shifts_id", shifts_id);
	            sessionMap.put("day_offs_id", day_offs_id);
	            sessionMap.put("area_no", area_no);
	           sessionMap.put("f_name", f_name);
	           sessionMap.put("lname", lname);
			}
			
			
			rs=null;// rs or results set contains the retrieve data from database
            rs = admin.R_shifts_by_id(shifts_id); // R_shifts_by_id is a method of Admin class with returns a result set if called, R stands for retrieve.
			i = 0;
			if (rs != null) { // if it has retrieved data from database 
				while (rs.next()) { //while there is still data in the resultset
					i++; // to be used in the condition, if value remains 0, then there is no data fetching occurred.
					shifts=rs.getString("fld_shift"); // get or fetch the data on column fld_shift to variable shifts then proceed to next data of the same column.
				}
	            sessionMap.put("shifts", shifts); //nag create ug session variable na "shifts" and insert ug value sa variable na shifts
			}
			
			rs=null; // gi empty ang result set para sudlan sa next line
            rs = admin.R_Day_Offs_by_id(day_offs_id); // R_day_offs_by_id() is method makita sa Admin Class, will retrieve the dayoffs data
			i = 0; // mao ni gamiton sa mga conditions, if 0, meaning walai data na naretrieve
			if (rs != null) {//if naai sulod ang resultset
				while (rs.next()) {
					i++; //increase i value by 1 every loop, therefore if gamiton sya sa condition, we could tell that there were data na naretrieve
					day_offs=rs.getString("fld_day_offs");//value from column fld_day_offs sa database to the system variable day_offs
				}
	            sessionMap.put("day_offs", day_offs);//same algorithm above, different variable and value lang.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success"; // mao ni ang return value na basihan sa struts.xml if what page is display next.
    }
    

	public String login() {
        
        String f_name=null;
        String sess_fname=null;
        String sess_lname=null;
        int i=0;
        // check if the userName is already stored in the session
       
       
         
        // if no userName stored in the session,
        // check the entered userName and password
        
        int personid=0;
		
		
		try {
			
			rs = admin.R_login(userName, password);
			if (rs != null) {
				
				while (rs.next()) {
					i++;
					ctr=i;
					authUser=rs.getString("fld_privilege");
					personid=rs.getInt("fld_personnel_id");
					f_name=rs.getString("fld_lname") + ", "+ rs.getString("fld_fname");
					sess_lname=rs.getString("fld_lname");
					sess_fname=rs.getString("fld_fname");

					
				}
				sessionMap.put("pid", personid);
				sessionMap.put("fullname", f_name);
	            sessionMap.put("firstname", sess_fname);
	            sessionMap.put("lastname", sess_lname);
	            sessionMap.put("userType", authUser);
	            sessionMap.put("person_id", personid);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			msg="Wrong username/password";
			return "error";
		}

		System.out.println(userName);
		System.out.println(password);
		System.out.println(authUser);
        // in other cases, return login page
        return "success";
    }
     
    public String logout() {
        // remove userName from the session or destroy the session variable named userType
        if (sessionMap.containsKey("userType")) {
            sessionMap.remove("userType");
        }
        return "success"; 
    }
 

  
     
    public void setUserName(String userName) {
        this.userName = userName;
    }
     
    public void setPassword(String password) {
        this.password = password;
    }

	public int getThis_id() {
		return this_id;
	}

	public void setThis_id(int this_id) {
		this.this_id = this_id;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
    public int getCtr() { //sa web page naai name ang mga input tag sulod sa kada form tag, para mapasa ang value,we generate getters and setters, dapat kung unsai name sa input tag same pud ang mga variables dari.
		return ctr;
	}

	public void setCtr(int ctr) {
		this.ctr = ctr;
	}


	@Override
	public void setSession(Map<String, Object> sessionMap) {
		 this.sessionMap = sessionMap;
		
	}

    
}
