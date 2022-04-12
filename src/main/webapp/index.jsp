<%@taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
<head>
<script src="dist/js/jquery-1.10.1.min.js"></script>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" name="viewport">
  <title>RTA &rsaquo; Login &mdash; PMS</title>

  <link rel="stylesheet" href="dist/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="dist/modules/ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="dist/modules/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">

  <link rel="stylesheet" href="dist/css/style.css">
</head>

<body>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="login-brand">
              RTA Personnel Management
            </div>

            <div class="card card-primary">
              <div class="card-header"><h4>Login</h4>
			
				<span style="color: red;"><s:property value="msg" /></span>
						
			</div>
              <div class="card-body">
                <form method="POST" action="login" class="needs-validation" >
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input  type="email" class="form-control" name="userId" tabindex="1" required autofocus>
                    <div class="invalid-feedback">
                      Please fill in your email
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="password" class="d-block">Password
                      
                    </label>
                
                    <s:property value="authUser" />
                    
                    <input  type="password" class="form-control" name="userPass" tabindex="2" required>
                    <div class="invalid-feedback">
                      please fill in your password
                    </div>
                    
                    
                  </div>

                  

                  <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block" tabindex="4">
                      Login
                    </button>
                  </div>
                </form>
              </div>
            </div>
            <div class="mt-5 text-muted text-center">
              
            </div>
            <div class="simple-footer">
              
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

  <script src="dist/modules/jquery.min.js"></script>
 
 
  <script src="dist/modules/bootstrap/js/bootstrap.min.js"></script>
  <script src="dist/modules/nicescroll/jquery.nicescroll.min.js"></script>
  <script src="dist/modules/scroll-up-bar/dist/scroll-up-bar.min.js"></script>
  <script src="dist/js/sa-functions.js"></script>
  
  <script src="dist/js/scripts.js"></script>
  <script src="dist/js/custom.js"></script>
  
</body>
</html>