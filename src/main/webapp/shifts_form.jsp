<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script src="dist/js/jquery-1.10.1.min.js"></script>
        <script>
        if ( window.history.replaceState ) {
        	  window.history.replaceState( null, null, window.location.href );
        	}
        </script>
     <% 
	                    String t=(String)session.getAttribute("userType");
	                    if(t!=null) { 
	                    	out.print("good");
	                    } 
	                    else{  %> 
	                    	<jsp:forward page="/index.jsp" />
	                    
	                   <%  }
	                    %>  
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" name="viewport">
  <title>Add &mdash; Shift details</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
  	<script>
	$("#_10").click(function(){
  		alert("hey");
  	    
  	} );
  	$(document).ready(function() {
		$('#mytbl').dataTable();
		table.page.len( 10 ).draw();
		
	});
  	
  	
  	function onTimeChange() {
  	   var timeSplit = inputEle.value.split(':'),
  	      hours,
  	      minutes,
  	      meridian;
  	   hours = timeSplit[0];
  	   minutes = timeSplit[1];
  	   if (hours > 12) {
  	      meridian = 'PM';
  	      hours -= 12;
  	   } else if (hours < 12) {
  	      meridian = 'AM';
  	      if (hours == 0) {
  	         hours = 12;
  	      }
  	   } else {
  	      meridian = 'PM';
  	   }
  	   alert(hours + ':' + minutes + ' ' + meridian);
  	}
  	 
  
  
</script>

  <style type="text/css">

    .options {
    display:none;
    position:absolute;
    top:100%;
    right:0;
    left:0;
    z-index:999;
    margin:0 0;
    padding:0 0;
    list-style:none;
    border:1px solid #ccc;
    background-color:white;
    -webkit-box-shadow:0 1px 2px rgba(0, 0, 0, 0.2);
    -moz-box-shadow:0 1px 2px rgba(0, 0, 0, 0.2);
    box-shadow:0 1px 2px rgba(0, 0, 0, 0.2);
}
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


	  						<% 
	                    String admin=(String)session.getAttribute("userType");
	                    if(admin!=null) { 
	                    	%>
	                    		 <jsp:include page="menu.jsp"/>
	                    	<% 
	                    	
	                    } 
	                    else{  %> 
	                    	<jsp:forward page="/index.jsp" />
	                    
	                   <%  }
	                    %> 
   
  
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-8 offset-xl-2">
            <div class="login-brand">
              -
            </div>

            <div class="card card-primary" color='red'>
              <div class="card-header"><h4>Shift Information</h4></div>
              <div class="card-body">
               			<s:if test="ctr>0">
								<span style="color: green;"><s:property value="msg" /></span>
						</s:if>
						<s:else>
								<span style="color: red;"><s:property value="msg" /></span>
						</s:else><br>
               <form method="POST" action="Process_shift.action">
               
                  <div class="row">
                    <div class="form-group col-6">
                      <label for="frist_name">Time In:</label>
                      <input id="frist_name" type="time" class="form-control" name="time_in" onchange="onTimeChange()" required>
                    </div>
                    <div class="form-group col-6">
                      <label for="last_name">Time Out:</label>
                      <input id="last_name" type="time" class="form-control" name="time_out" onchange="onTimeChange()" required>
                
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
                            <h4>Shifts Record</h4>
                          </div>
                          <div  class="card-header">
                            <div class="table-responsive">
                            
                            <s:if test="noData==true">
                            
                              <table id="myTable" class="display nowrap" style="width:100%">
                              <thead>
                                <tr>
                                  
                                  <th>SHIFT INFO</th>
                                  <th>ACTION</th>
                                </tr>
                                </thead>
                                <tbody>
                                <s:iterator value="beanList">
                                <tr>
                                 
                                  <td><s:property value="shift" /></td>
                                  <td><a href="Delete_shift?shifts_id=<s:property value="srNo"/>" class="btn btn-action btn-secondary">DELETE</a></td>
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
                  			<div id="pageNavPosition" class="pager-nav"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>
  </div>

  <div class="main-content">
        <section class="section">
          
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