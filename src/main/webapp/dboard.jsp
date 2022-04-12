<%@taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
<head>

<script src="dist/js/jquery-1.10.1.min.js">

</script>
  						 
	                    	<% 
	                    String admin=(String)session.getAttribute("userType");
	                    if(admin==null) { %>
	                    	<jsp:forward page="/index.jsp" />
	                    	
	                    <%} 
	                    
	                    %>
	                    <%--
	                    the above codes is checking if a session is created with a name userType(see LoginAction.java class)
	                    if no session created then redirected to index.jsp which is a login form.
	                     --%>
	                     
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" name="viewport">
  <title>Dashboard &mdash; RTAPMS</title>

  <link rel="stylesheet" href="dist/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="dist/modules/ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="dist/modules/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">

  <link rel="stylesheet" href="dist/modules/summernote/summernote-lite.css">
  <link rel="stylesheet" href="dist/modules/flag-icon-css/css/flag-icon.min.css">
  <link rel="stylesheet" href="dist/css/demo.css">
  <link rel="stylesheet" href="dist/css/style.css">
</head>

<body>
 <jsp:include page="menu.jsp"/>;
<%--<jsp:forward page="/index.jsp" /> to make it easier to edit content of menu without going through each page, a file for menu is created and will be import using this code. imagine if you put the menu code in each pages, and every time make changes in 1 page you do the same with other pages. --%>>

      <div class="main-content">
        <section class="section">
          <h1 class="section-header">
            <div>Dashboard</div>
          </h1>
          <div class="row">
            <div class="col-lg-3 col-md-6 col-12">
              <div class="card card-sm-3">
                <div class="card-icon bg-primary">
                  <i class="ion ion-person"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>Total Admin</h4>
                  </div>
                  <div class="card-body">
                    <%= session.getAttribute("admin_count") %> <%--! this a session variable created on LoginAction.java, displays the total count of admin users --%>
                  </div>
                </div>
              </div>
            </div>
        
   
            <div class="col-lg-3 col-md-6 col-12">
              <div class="card card-sm-3">
                <div class="card-icon bg-success">
                  <i class="ion ion-record"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>RTA Personnel</h4>
                  </div>
                  <div class="card-body">
                    <%= session.getAttribute("users_count") %><%--! this a session variable created on LoginAction.java, displays the total count of  registered personnels --%>
                  </div>
                </div>
              </div>
            </div>                  
          </div>
          <div class="row">
            <div class="col-lg-8 col-md-12 col-12 col-sm-12">
              
            </div>
            
          </div>
         
        </section>
      </div>
      <footer class="main-footer">
        <div class="footer-left">
         
          </div>
        <div class="footer-right"></div>
      </footer>
    </div>
  </div>

  <script src="dist/modules/jquery.min.js"></script>
  <script src="dist/modules/popper.js"></script>
  <script src="dist/modules/tooltip.js"></script>
  <script src="dist/modules/bootstrap/js/bootstrap.min.js"></script>
  <script src="dist/modules/nicescroll/jquery.nicescroll.min.js"></script>
  <script src="dist/modules/scroll-up-bar/dist/scroll-up-bar.min.js"></script>
  <script src="dist/js/sa-functions.js"></script>
  
  <script src="dist/modules/chart.min.js"></script>
  <script src="dist/modules/summernote/summernote-lite.js"></script>

  
  <script src="dist/js/scripts.js"></script>
  <script src="dist/js/custom.js"></script>
</body>
</html>
