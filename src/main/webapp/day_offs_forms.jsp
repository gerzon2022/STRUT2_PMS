<%@taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
<head>
<script src="dist/js/jquery-1.10.1.min.js"></script>

      
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
  <title>Add &mdash; Day Offs</title>
  <style type="text/css">
    
.weekDays-selector input {
  display: none!important;
}

.weekDays-selector input[type=checkbox] + label {
  display: inline-block;
  border-radius: 6px;
  background: #dddddd;
  height: 40px;
  width: 30px;
  margin-right: 3px;
  line-height: 40px;
  text-align: center;
  cursor: pointer;
}

.weekDays-selector input[type=checkbox]:checked + label {
  background: #2AD705;
  color: #ffffff;
}

  </style>
<link rel="stylesheet" href="DataTables/css/jquery.dataTables.css">
<script src="DataTables/js/jquery-3.5.1.js"></script>
<script src="DataTables/js/jquery.dataTables.min.js"></script>
<script src="Buttons/js/buttons.min.js"></script>
<script src="Buttons/js/dataTables.buttons.min.js"></script>
<script src="Buttons/js/buttons.html5.min.js"></script>
<script src="Buttons/js/buttons.print.min.js"></script>
<link rel="stylesheet" href="dist/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="dist/modules/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="dist/modules/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">
<link rel="stylesheet" href="dist/css/style.css">
</head>
<body>
      						
	                   
<jsp:include page="menu.jsp"/> <%-- to make it easier to edit content of menu without going through each page, a file for menu is created and will be import using this code. imagine if you put the menu code in each pages, and every time make changes in 1 page you do the same with other pages. --%>>
	                    
	                  

  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-8 offset-xl-2">
            <div class="login-brand">
              -
            </div>

            <div class="card card-primary">
              <div class="card-header"><h4>Day Offs Information</h4></div>

              <div class="card-body">
                <form method="POST" action="reg_day_offs.action" id="form_dayoff">
                  <div class="row">
                    <div class="form-group">
                    <%-- codes below is the feedback/notification from the processes, we have variable msg in the classes, 
                    this tells us if successfully registered a data or error
                
                    --%>
                       <s:if test="ctr>0"> 
								<span style="color: green;"><s:property value="msg" /></span>
						</s:if>
					<s:else>
								<span style="color: red;"><s:property value="msg" /></span>
					</s:else><br>
                    <label for="days-of-work">Day Offs</label>
                    <div class="weekDays-selector">
                    <input type="checkbox" id="weekday-mon" class="weekday" value="Mon" name="day_offs" />
                    <label for="weekday-mon">Mon</label>
                    <input type="checkbox" id="weekday-tue" class="weekday" value="Tue" name="day_offs"/>
                    <label for="weekday-tue">Tue</label>
                    <input type="checkbox" id="weekday-wed" class="weekday" value="Wed" name="day_offs"/>
                    <label for="weekday-wed">Wed</label>
                    <input type="checkbox" id="weekday-thu" class="weekday" value="Thu" name="day_offs"/>
                    <label for="weekday-thu">Thu</label>
                    <input type="checkbox" id="weekday-fri" class="weekday" value="Fri" name="day_offs"/>
                    <label for="weekday-fri">Fri</label>
                    <input type="checkbox" id="weekday-sat" class="weekday" value="Sat" name="day_offs" checked />
                    <label for="weekday-sat">Sat</label>
                    <input type="checkbox" id="weekday-sun" class="weekday" value="Sun" name="day_offs" checked/>
                    <label for="weekday-sun">Sun</label>
                  </div>
                  </div>

                  </div>

                  <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">
                      Add
                    </button>
                  </div>
                </form>
                <div class="form-group col-12">
                    <div class="row">
                      <div>
                        <div>
                          <div>
                            <h4>Day Offs Record</h4>
                          </div>
                          <div  class="card-header">
                            <div class="table-responsive">
                            <s:if test="noData==true">
                              <table id="myTable" class="display nowrap" style="width:100%">
                              <thead>
                                <tr>
                                  
                                  <th>DAY OFFS</th>
                                  <th>USERS</th>
                                  <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
 <%--!notice the iterator value --%><s:iterator value="tbl_day_offs"><%--! tbl_day_offs array is located on Retrieve.java file line 106(declaration) and line 117(value assignment)--%>
                                <tr>
                                  <%--! notice that between iterator tags are the values added to line 117 of Retrieve.java class, see below line 134, s:property value="Day_offs"   --%>
                                  <td><s:property value="Day_offs" /></td>
                                  <td><div class="badge badge-success">Active</div></td>
                                  
                                  <td><a href="Delete_day_off?Day_offs_id=<s:property value="Day_offs_id"/>" class="btn btn-action btn-secondary">Delete</a></td>
                                </tr>
                               </s:iterator>
                               </tbody>
                              </table>
                              </s:if>
								<s:else>
									<div style="color: red;">No Data Found.</div>
								</s:else>
                            </div>
                          </div>
                          <div class="card-footer text-right">
                            <nav class="d-inline-block">
                              <ul class="pagination mb-0">
                                <li class="page-item disabled">
                                  <a class="page-link" href="#" tabindex="-1"><i class="ion ion-chevron-left"></i></a>
                                </li>
                                <li class="page-item active"><a class="page-link" href="#">1 <span class="sr-only">(current)</span></a></li>
                                <li class="page-item">
                                  <a class="page-link" href="#">2</a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                  <a class="page-link" href="#"><i class="ion ion-chevron-right"></i></a>
                                </li>
                              </ul>
                            </nav>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
              </div>
              </div>
            </div>
           
          </div>
       
				       <script>
				       //this codes will prevent empty input
				 $( '#form_dayoff' ).on('submit', function(e) {
					   if($( 'input[class^="weekday"]:checked' ).length === 0) {
					      alert( 'Oops! No day selected!.' );
					      e.preventDefault();
					   }
					});
				 </script>
    </section>
  </div>

  
<script src="dist/modules/bootstrap/js/bootstrap.min.js"></script>
<script src="dist/modules/scroll-up-bar/dist/scroll-up-bar.min.js"></script>
<script src="dist/js/scripts.js"></script>
<script src="dist/js/custom.js"></script> 
  <!-- For pdfmake -->
<script src="dist/js/pdfmake.0.1.68.min.js"></script>
<script src="dist/js/pdfmake.vfs_fonts.0.1.68.min.js"></script>
 <script>

$(document).ready(function () {
    // Setup - add a text input to each footer cell
    $('#myTable thead tr')
        .clone(true)
        .addClass('filters')
        .appendTo('#myTable thead');
 
    var table = $('#myTable').DataTable({
    	dom: 'Bfrtip',
        buttons: [
        	'print',
            'csv',
            'pdf'
        
        ],
        orderCellsTop: true,
        fixedHeader: true,
        initComplete: function () {
            var api = this.api();
 
            // For each column
            api
                .columns()
                .eq(0)
                .each(function (colIdx) {
                    // Set the header cell to contain the input element
                    var cell = $('.filters th').eq(
                        $(api.column(colIdx).header()).index()
                    );
                    var title = $(cell).text();
                    $(cell).html('<input type="text" placeholder="' + title + '" />');
 
                    // On every keypress in this input
                    $(
                        'input',
                        $('.filters th').eq($(api.column(colIdx).header()).index())
                    )
                        .off('keyup change')
                        .on('keyup change', function (e) {
                            e.stopPropagation();
 
                            // Get the search value
                            $(this).attr('title', $(this).val());
                            var regexr = '({search})'; //$(this).parents('th').find('select').val();
 
                            var cursorPosition = this.selectionStart;
                            // Search the column for that value
                            api
                                .column(colIdx)
                                .search(
                                    this.value != ''
                                        ? regexr.replace('{search}', '(((' + this.value + ')))')
                                        : '',
                                    this.value != '',
                                    this.value == ''
                                )
                                .draw();
 
                            $(this)
                                .focus()[0]
                                .setSelectionRange(cursorPosition, cursorPosition);
                        });
                });
        },
    });
    
   
});


</script>
 
</body>
</html>