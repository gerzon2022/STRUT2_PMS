
<div id="app">

    <div class="main-wrapper">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar">
        <form class="form-inline mr-auto">
         
        </form>
        <ul class="navbar-nav navbar-right">
         
          <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg">
            <i class="ion ion-android-person d-lg-none"></i>
            <div class="d-sm-none d-lg-inline-block">Hi <b><%= session.getAttribute("fullname") %>!</div></a><%--! this a session variable created on LoginAction.java, displays fullname of admin --%>
            <div class="dropdown-menu dropdown-menu-right">
              <a href="profile?this_id=<%= session.getAttribute("person_id") %>" class="dropdown-item has-icon"><%--! this a session variable created on LoginAction.java, displays the personnel id --%>
                <i class="ion ion-android-person"></i> Profile
              </a>
              <a href="logout.action" class="dropdown-item has-icon"> <%--! all action is located on struts.xml file, but without the ".action" word --%>
                <i class="ion ion-log-out"></i> Logout
              </a>
            </div>
          </li>
        </ul>
      </nav>
      <div class="main-sidebar">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
            <a href="dboard.jsp">RPMS</a>
          </div>
          <div class="sidebar-user">
            <div class="sidebar-user-picture">
              
            </div>
            <div class="sidebar-user-details">
              <div class="user-name"><%= session.getAttribute("fullname") %></div><%--! this a session variable created on LoginAction.java, displays the  admin fullname--%>
              <div class="user-role">
                <%= session.getAttribute("userType") %><%--! this a session variable created on LoginAction.java, displays the user role, but we only have a role for this system and its "Admin" --%>
              </div>
            </div>
          </div>
          
          <ul class="sidebar-menu">
            <li class="menu-header">Dashboard</li>
            <li class="active">
              <a href="dboard.jsp"><i class="ion ion-speedometer"></i><span>Dashboard</span></a>
            </li>

            <li class="menu-header">Modules</li>
            
			 <li>
              <a href="retrieve_shift"><i class="ion-android-contacts"></i><span>Shift</span></a>
            </li>
             <li>
              <a href="retrieve_day_offs"><i class="ion-power"></i><span>Day Offs</span></a>
            </li>
             
             <li>
              <a href="retrieve_personnel"><i class="ion-person-add"></i><span>Add Personnel</span></a>
            </li>
             <li>
              <a href="retrieve_map"><i class="ion ion-pin"></i><span>Area Assignment</span></a>
            </li>
            <li>
              <a href="retrieve_personnel_ass"><i class="ion-ios-briefcase"></i><span>Personnel Assignment</span></a>
            </li>
           
        </aside>

      </div>