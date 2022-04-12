<%@taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
<head>
<%     					
String t=(String)session.getAttribute("userType");
	if(t!=null) {} 
	else{  %> 
	<jsp:forward page="/index.jsp" />
	 <%  }
%> 
<script src="Modal/js/jquery.min.js"></script>
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

 <link rel="stylesheet" href="dist/css/select_tag.css">
        	<script>
            $(document).ready(function() { 
                window.history.pushState("","", location.href); 
            });
            $(document).ready(function(){

        	    // code to read selected table row cell data (values).
        	    $("#myTable ").on('click','.btnSelect',function(){
        	         var currentRow=$(this).closest("tr"); 
        	         var col0=currentRow.find("td:eq(0)").text(); // get current row 
        	         var col1=currentRow.find("td:eq(1)").text().trim(); // get current row
        	         var col4=currentRow.find("td:eq(4)").text().trim();
        	         var col5=currentRow.find("td:eq(5)").text().trim();
        	         var col6=currentRow.find("td:eq(6)").text().trim();
        	         $("#area_n option:contains("+col6+")").attr('selected', 'selected');
        	         $("#doff option:contains("+col5+")").attr('selected', 'selected');
        	         $("#shifts_id option:contains("+col4+")").attr('selected', 'selected');
        	         document.getElementById("update_id").value=parseInt(col0);
            	     document.getElementById("update_name").value=col1;
            	         
        	    });
        	});
        </script>

  
	          
    <title>Assign &mdash; Personnel</title>

  
  


  
  


</head>

<body>
<jsp:include page="menu.jsp"/>
  <div>
    <section class="section" >
      <div class="container mt-5">
          <div  class="col-12 col-sm-1 offset-sm-2 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-10 offset-xl-2">
            <div class="login-brand">
              -
            </div>

            <div class="card card-primary" >

       

            <div class="row mt-5">
              <div class="col-12"  >
                <div class="card">
                  <div class="card-header">
                
                  <div class="card-body">
                    <div class="table-responsive">
                   <h4>Personnel Assignment</h4>
                      <table id="myTable" class="display nowrap" style="width:100%">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Fullname</th>
                          <th>EMAIL</th>
                          <th>CONTACT NO</th>
                          <th>SHIFT</th>
                          <th>DAY OFFS</th>
                          <th>AREA NO</th>
                          <th>ACTION</th>
                        </tr>
                        </thead>
                         <s:if test="noData==true">
                        <tbody>
                        <script>
		                     let token=1;   				 	
				        </script>
                        <s:iterator  value="tbl_personnel" var="parent">
	                        <tr>
	                        <%int token=1;%>
		                          <td><s:property  value="#parent.p_id"/> <input type="hidden" name="person_id" value="<s:property  value="#parent.p_id"/>"></td>
		                          <td class="align-middle">
		                           <s:property value="#parent.lname"/>, <s:property value="#parent.fname"/> <s:property value="#parent.mname" />
		                          </td>
		                          <td>
		                          <s:property value="#parent.email"/>  
		                          </td>
		                          <td><s:property value="#parent.contact_no"/></td>
		                          <td><s:iterator value="tbl_shifts" var="shiftsParent"><s:iterator value="tbl_ass" var ="child"><s:if test="#child.ass_pid==#parent.p_id && #child.shifts_pid==#shiftsParent.srNo"><s:property value="#shiftsParent.shift"/><%token=0; %></s:if></s:iterator></s:iterator><% if(token==1){out.print("TBA");} token=1;%></td>        
					              <td><s:iterator value="tbl_day_offs" var="day_offs_parent"><s:iterator value="tbl_ass" var ="child"><s:if test="#child.ass_pid==#parent.p_id && #child.day_offs_pid==#day_offs_parent.day_offs_id"><s:property value="#day_offs_parent.day_offs" /><%token=0; %></s:if></s:iterator></s:iterator><% if(token==1){out.print("TBA");} token=1;%></td>
		                          <td><s:iterator value="tbl_location" var ="location"><s:iterator value="tbl_ass" var ="child"><s:if test="#child.ass_pid==#parent.p_id && #child.area_pid==#location.area_no"><s:property value="#location.marked_lbl"/><%token=0; %></s:if></s:iterator></s:iterator><% if(token==1){out.print("TBA");} token=1;%></td>
			                        			
		                           <td><a href="" data-toggle="modal" data-target="#myModal" class="btnSelect">Edit</a></td>
	                         
	                        </tr>
	                        </s:iterator>
                       </tbody>
                       	
                       	   </s:if>
								<s:else>
									<div style="color: red;">No Data Found.
									<s:property value="noData"/>
									</div>
									
								</s:else>
							
                              </table>
                              
                    </div>
                  </div>
                </div>
              </div>
            </div>
         </div>
            </div>

              </div>
              <button id="shuffle">df</button>
              </section>
              
               <!-- Modal -->
 	
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
        <p><center>Overide Assignment</center></p>
         <form action="update_ass" method="post">
         	<input id="update_id" type="hidden" class="form-control" name="person_id" readonly>
        <div class="row">
		                    <div class="form-group col-8">
		                      <label for="frist_name">Full Name</label>
		                      <input id="update_name" type="text" class="form-control"  readonly>
		                      <div class="valid-feedback">Please provide a valid city.</div>
		                    </div>
		                  </div>
		                  <table>
	<thead>
		</tr>
		<tr>
			<td>Area Assignment</td>
		</tr>
		<tr>
			<td>
				<select name="area_no" id="area_n">
				<option value=0>TBA</option>
    			<s:iterator value="tbl_location" var ="location">
        			<option value="<s:property value="#location.area_no"/>" ><s:property value="#location.marked_lbl" /> </option>
    			</s:iterator>
    			</select>
			</td>
		</tr>
		<tr>
			<td>Day Off Assignment</td>
		</tr>
		<tr>
			<td>
				<select name="day_offs_id" id="doff">
					                           
               <option value=0>TBA</option>
        			<s:iterator value="tbl_day_offs" var="day_offs_parent">
        					
        					<option value="<s:property value="#day_offs_parent.day_offs_id"/>"><s:property value="#day_offs_parent.day_offs" /></option>
        						
        			</s:iterator>
    			</select>
			</td>
		</tr>
		<tr>
			<td>Shift Assignment</td>
		</tr>
		<tr>
			<td>
				<select name="shifts_id" id="shifts_id">
                       <option value=0>TBA</option>
                			<s:iterator value="tbl_shifts" var="shiftsParent">
                				
                				<option value="<s:property value="#shiftsParent.srNo"/>" ><s:property value="#shiftsParent.shift" /></option>
                				
                			</s:iterator>
				                        			
    			</select>
			</td>
		</tr>
	</thead>
	
		
</table>
		    				
			                        			
				<input type="submit" class="btn btn-primary btn-block"  value="Update" />
						
          </form>
        </div>
       </div>
      </div>
    </div>
        
        
            </div>
         
            <div class="simple-footer">
              
            </div>

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
            'pdf',
            {
                text: 'Shuffle Assignment',
                action: function ( e, dt, node, config ) {
                	window.location.href='call_shuffle.action';
                }
            }
        
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
<script src="dist/modules/bootstrap/js/bootstrap.min.js"></script>
<script src="dist/modules/scroll-up-bar/dist/scroll-up-bar.min.js"></script>
<script src="dist/js/scripts.js"></script>
<script src="dist/js/custom.js"></script> 
  <!-- For pdfmake -->
<script src="dist/js/pdfmake.0.1.68.min.js"></script>
<script src="dist/js/pdfmake.vfs_fonts.0.1.68.min.js"></script>
</body>
</html>