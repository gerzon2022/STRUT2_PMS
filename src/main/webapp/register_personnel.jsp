<%@taglib prefix="s" uri="/struts-tags"%>
<html>
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

function alertMessages()
{
	var A=<s:property value="An" />;
	var B=<s:property value="Bn" />;
	var C=<s:property value="Cn" />;
	var D=<s:property value="Dn" />;
	var E=<s:property value="En" />;
	var F=<s:property value="Fn" />;
		var As=<s:property value="AreaA" />;
		var Bs=<s:property value="AreaB" />;
		var Cs=<s:property value="AreaC" />;
		var Ds=<s:property value="AreaD" />;
		var Es=<s:property value="AreaE" />;
		var Fs=<s:property value="AreaF" />;
	var code=document.getElementById('code').value;

	
	let ok;
	let count=0;
	if(code==1){
	   ok=A-1;
	   md=A%10;
	   max=As*10;
	   if((ok<0 && md==0) || A>=max){alert("No more Area to be assigned in this Category");document.getElementById("code").selectedIndex = 0;}
	}else if(code==2){
		ok=B-1;
		md=B%10;
		max=Bs*10;
		if((ok<0 && md==0) || B>=max){alert("No more Area to be assigned in this Category");document.getElementById("code").selectedIndex = 0;}
	}
	else if(code==3){
		   ok=C-1;
		   md=C%10;
		   max=Cs*10;
		   if((ok<0 && md==0) || C>=max){alert("No more Area to be assigned in this Category");document.getElementById("code").selectedIndex = 0;}
	}else if(code==4){
	   ok=D-1;
	   md=D%10;
	   max=Ds*10;
	   if((ok<0 && md==0) || D>=max){alert("No more Area to be assigned in this Category");document.getElementById("code").selectedIndex = 0;}
	}else if(code==5){
	   ok=E-1;
	   md=E%10;
	   max=Es*10;
	   if((ok<0 && md==0) || E>=max){alert("No more Area to be assigned in this Category"); document.getElementById("code").selectedIndex = 0;}
	}else if(code==6){
	   ok=F-1;
	   md=F%10;
	   max=Fs*10;
	   if((ok<0 && md==0) || F>=max){alert("No more Area to be assigned in this Category"); document.getElementById("code").selectedIndex = 0;}
	}


}
$(document).ready(function(){

// code to read selected table row cell data (values).
$("#myTable ").on('click','.btnSelect',function(){
     var currentRow=$(this).closest("tr"); 
     	var col0=currentRow.find("td:eq(0)").text(); // get current row 
	     var col1=currentRow.find("td:eq(1)").text(); // get current row 
	     var col2=currentRow.find("td:eq(2)").text(); // get current row 
	     var col3=currentRow.find("td:eq(3)").text(); // get current row 
	     var col4=currentRow.find("td:eq(4)").text(); // get current row 
	     var col5=currentRow.find("td:eq(5)").text(); // get current row 
	     var col6=currentRow.find("td:eq(6)").text(); // get current row
	     var col7=currentRow.find("td:eq(7)").text(); // get current row 
	     var col8=currentRow.find("td:eq(8)").text(); // get current row 
	     var col9=currentRow.find("td:eq(9)").text(); // get current row 
	     var col10=currentRow.find("td:eq(10)").text(); // get current row
	     var col11=currentRow.find("td:eq(11)").text(); // get current row 11th TD value
	     var col12=currentRow.find("td:eq(12)").text();
	     var col13=currentRow.find("td:eq(13)").text(); // get current row 11th TD value
	     var col14=currentRow.find("td:eq(14)").text();
	     document.getElementById("person_id").value=col0;
	     var strlname="";
	     var strfname="";
	     var strmname="";
	     var this_id=0;
	     <s:iterator value="beanList" var="parent">
	     
	     this_id='<s:property value="#parent.personnel_id" />';
	     
		     if(this_id==col0){
		    	 strlname='<s:property value="#parent.lname" />';
		    	 strfname='<s:property value="#parent.fname" />';
		    	 strmname='<s:property value="#parent.mname" />';
		     }
	     
	     </s:iterator>
	     
	     $("#standard-select_details option:contains("+col13+")").attr('selected', 'selected');
         $("#code_details option:contains("+col14+")").attr('selected', 'selected');
	     document.getElementById("fname").value=strfname;
	     document.getElementById("lname").value=strlname;
	     document.getElementById("mname").value=strmname;
	     document.getElementById("email").value=col2;
	     document.getElementById("contact_no").value=col3;
	     document.getElementById("dob").value=col6;
	     document.getElementById("btype").value=col7;
	     document.getElementById("address").value=col8;
	     document.getElementById("tin").value=col9;
	     document.getElementById("gsis").value=col10;
	     document.getElementById("pagibig").value=col11;
	     document.getElementById("philhealth").value=col12;
	     document.getElementById("standard-select_details").value=col13;
	     document.getElementById("code_details").value=col14;
	     
	    $('#lname').attr('readonly', true);
 		$('#fname').attr('readonly', true);
 		$('#mname').attr('readonly', true);
 		$('#gsis').attr('readonly', true);
 		$('#pagibig').attr('readonly', true);
 		$('#philhealth').attr('readonly', true);
 		$('#contact_no').attr('readonly', true);
 		$('#address').attr('readonly', true);
 		$('#tin').attr('readonly', true);
 		$('#btype').attr('readonly', true);
 		$('#dob').attr('readonly', true);
 		$('#email').attr('readonly', true);
 		$('#code_details').prop('disabled', true);
		$('#standard-select_details').prop('disabled', true);
 		$("#btnedit").html("Edit");
	});
});

var email_array = [];
<s:iterator value="beanList">
	email_array.push('<s:property value="email" />');
</s:iterator>
	
</script> 
<title>Add &mdash; Personnel</title>
</head>

<body>
		
<jsp:include page="menu.jsp"/>
	                    	

  <div id="app">
    <section class="section" >
      <div class="container mt-5" >
      
        <div class="row" >
          <div  class="col-12 col-sm-1 offset-sm-2 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-10 offset-xl-2">
            <div class="login-brand">
              -
            </div>

            <div class="card card-primary">
              <div class="card-header"><h4>Personnel Information Registration</h4>
							
								<span style="color: red;"><s:property value="msg" /></span>
					</div>		
              <div class="card-body">
                <form method="POST" action="register_personnel.action">
             
		                  <div class="row">
		                    <div class="form-group col-4">
		                      <label for="frist_name">First Name</label>
		                      <input id="frist_name" type="text" class="form-control" name="frist_name" autofocus required>
		                      <div class="valid-feedback">Please provide a valid city.</div>
		                    </div>
		                    <div class="form-group col-4">
		                      <label for="last_name">Middle name</label>
		                      <input id="mid_name" type="text" class="form-control" name="mname" required>
		                    </div>
		                    <div class="form-group col-4">
		                      <label for="last_name">Last Name</label>
		                      <input id="last_name" type="text" class="form-control" name="last_name" required>
		                    </div>
		                  </div>
		                  <div class="row">
		                  <div class="form-group col-4">
		                      <label for="last_name">Date of Birth</label>
		                      <input id="last_name" type="date" class="form-control" name="bod" required>
		                    </div>
		                    <div class="form-group col-4">
		                      <label for="last_name">Blood Type</label>
		                      <input type="text" class="form-control" name="bt" maxlength="3" required>
		                    </div>
		                  </div>
		                  <div class="row">
			                  <div class="form-group col-12" >
			                    <label for="address">Address</label>
			                    <input type="text" class="form-control" name="address" required>
			                    <div class="invalid-feedback">
			                    </div>
			                  </div>
		                  </div>
						<div class="row">
		                  <div class="form-group col-6" >
		                    <label for="email">Email</label>
		                    <input  type="email" class="form-control" name="email" required>
		                    <div class="invalid-feedback">
		                    </div>
		                  </div>
		                   <div class="form-group col-6">
		                    <label for="contact">Contact no</label>
		                    <input  type="text" class="form-control" name="contact_num" required>
		                    <div class="invalid-feedback">
		                    </div>
		                  </div>
						</div>
						  <div class="row">
		                    <div class="form-group col-3">
		                      <label for="tin">TIN</label>
		                      <input placeholder="000-000-000-000" type="text" class="form-control" name="tin" autofocus required>
		                      <div class="valid-feedback">Please provide a valid city.</div>
		                    </div>
		                    <div class="form-group col-3">
		                      <label for="gsis">GSIS</label>
		                      <input  type="text" class="form-control" name="gsis" required>
		                    </div>
		                    <div class="form-group col-3">
		                      <label for="pagibig">Pag-ibig</label>
		                      <input  type="text" class="form-control" name="pagibig" required>
		                    </div>
		                    <div class="form-group col-3">
		                      <label for="philhealth">Philhealth</label>
		                      <input  type="text" class="form-control" name="philhealth" required>
		                    </div>
		                  </div>
						
						<div class="row">
		                  <div class="form-group col-6" >
		                    <label for="standard-select">Status</label>
								<div class="select">
								  <select id="standard-select" name ="status" required>
								    <option value=""></option>
								    <option value="Job Order">Job Order</option>
								    <option value="Regular">Regular</option>
								    </select>
								  <span class="focus"></span>
								</div>
		                  </div>
		                   <div class="form-group col-6">
		                    <label for="standard-select">Personnel Rank</label>
								<div class="select">
								  <select id="code" name="code" onchange="alertMessages()" required>
								    <option value=""></option>
								    <option value="1">Rank 1 -Area A's</option>
								    <option value="2">Rank 2 -Area B's</option>
								    <option value="3">Rank 3 -Area C's</option>
								    <option value="4">Rank 4 -Area D's)</option>
								    <option value="5">Rank 5 -Area E's</option>
								    <option value="6">Rank 6 -Area F's</option>
								    </select>
								    
								  <span class="focus"></span>
								</div>
								
		                    </div>
		                  </div>
		                    
		                  <div class="form-group">
		                    <input type="submit" class="btn btn-primary btn-block" value="ADD">
		                  </div>
                </form>
               
                   
                    
                  </div>
                  <div class="table-responsive">
                     <h4>Personal Information</h4>
                      <table id="myTable" class="display nowrap" style="width:100%">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Fullname</th>
                          <th>EMAIL</th>
                          <th>CONTACT NO.</th>
                          <th>VIEW</th>
                          <th>STATUS</th>
                          <th style="display:none;">dob</th>
                          <th style="display:none;">Btype</th>
                          <th style="display:none;">Address</th>
                          <th style="display:none;">TIN</th>
                          <th style="display:none;">GSIS</th>
                          <th style="display:none;">PAGIBIG</th>
                          <th style="display:none;">PhilHealth</th>
                          <th style="display:none;">Status</th>
                          <th style="display:none;">Code</th>
                        </tr>
                       </thead>
                        <tbody>
                        <s:iterator value="beanList">
                        <tr>
                          <td><s:property value="personnel_id" /></td>
                          <td><s:property value="lname" />, <s:property value="fname" /> <s:property value="mname"/></td>
                          <td><s:property value="email" /></td>
                          <td class="align-middle"><s:property value="contact_no" /></td>
                          <td>
                          	<a href="" data-toggle="modal" data-target="#myModal" class="btnSelect">Details</a>
                          </td>
	                       
                          <td><a  id="t" href="Delete_person?person_id=<s:property value="personnel_id"/>&active_status=<s:property value="fld_active" />" class="link">
	                          <script>
	                          if(<s:property value="fld_active"/>==1){document.write("Active");}
	                          else{document.write("Inactive");}
	                          </script></a>
	                       </td>
                          <td style="display:none;"><s:property value="dob"/></td>
                          <td style="display:none;"><s:property value="btype"/></td>
                          <td style="display:none;"><s:property value="address"/></td>
                          <td style="display:none;"><s:property value="tin"/></td>
                          <td style="display:none;"><s:property value="gsis"/></td>
                          <td style="display:none;"><s:property value="pagibig"/></td>
                          <td style="display:none;"><s:property value="philhealth"/></td>
                          <td style="display:none;"><s:property value="status"/></td>
                          <td style="display:none;"><s:property value="code"/></td>
                        </tr>
                        
                      </s:iterator>
                      </tbody>
                      </table>
                    </div>
              </div>
            </div>
            <div class="simple-footer">
            </div>
	       
          </div>
        </div>
     
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
        Personal Details
        <form id="frm_update" action="update_person_info.action" method="post">
         <div class="row">
         <input type="hidden" id="person_id" name="person_id">
		                    <div class="form-group col-4">
		                      <label for="frist_name">First Name</label>
		                      <input id="fname" name="frist_name" type="text" class="form-control"  readonly>
		                      <div class="valid-feedback">Please provide a valid city.</div>
		                    </div>
		                    
		                    <div class="form-group col-4">
		                      <label for="frist_name">Last name</label>
		                      <input id="lname" type="text" class="form-control" name="last_name" readonly>
		                      <div class="valid-feedback">Please provide a valid city.</div>
		                    </div>
		                     <div class="form-group col-4">
		                      <label for="frist_name">Middle name</label>
		                      <input id="mname" type="text" class="form-control" name="mname" readonly>
		                      <div class="valid-feedback">Please provide a valid city.</div>
		                    </div>
		                  </div>
		                  <div class="row">
		                  <div class="form-group col-6">
		                      <label for="Date of birth">Date of Birth</label>
		                      <input id="dob" name="dob" type="DATE" class="form-control" readonly>
		                    </div>
		                    <div class="form-group col-6">
		                      <label for="blood type">Blood Type</label>
		                      <input id ="btype" name="bt" type="text"  class="form-control"  readonly>
		                    </div>
		                  </div>
		                  <div class="row">
			                  <div class="form-group col-12" >
			                    <label for="address">Address</label>
			                    <input id="address" name="address" type="text" class="form-control" readonly>
			                    <div class="invalid-feedback">
			                    </div>
			                  </div>
		                  </div>
						<div class="row">
		                  <div class="form-group col-6" >
		                    <label for="email">Email</label>
		                    <input id="email" type="email" name="email" class="form-control" readonly>
		                    <div class="invalid-feedback">
		                    </div>
		                  </div>
		                   <div class="form-group col-6">
		                    <label for="contack">Contact no</label>
		                    <input id="contact_no" name="contact_num" type="text" class="form-control" readonly>
		                    <div class="invalid-feedback">
		                    </div>
		                  </div>
						</div>
						  <div class="row">
		                    <div class="form-group col-3">
		                      <label for="tin">TIN</label>
		                      <input id="tin" name="tin" type="text" class="form-control" readonly>
		                      <div class="valid-feedback">Please provide a valid city.</div>
		                    </div>
		                    <div class="form-group col-3">
		                      <label for="gsis">GSIS</label>
		                      <input  type="text" class="form-control" id="gsis" name="gsis" readonly>
		                    </div>
		                    <div class="form-group col-3">
		                      <label for="pagibig">Pag-ibig</label>
		                      <input  type="text" class="form-control" id="pagibig" name="pagibig" readonly>
		                    </div>
		                    <div class="form-group col-3">
		                      <label for="philhealth">Philhealth</label>
		                      <input  type="text" class="form-control" id="philhealth" name="philhealth" readonly>
		                    </div>
		                  </div>
		                  
		                  <div class="row">
		                  <div class="form-group col-6" >
		                    <label for="standard-select">Status</label>
								<div class="select">
								  <select id="standard-select_details" name ="status" required >
								    <option value=""></option>
								    <option value="Job Order">Job Order</option>
								    <option value="Regular">Regular</option>
								    </select>
								  <span class="focus"></span>
								</div>
		                  </div>
		                   <div class="form-group col-6">
		                    <label for="standard-select">Category</label>
								<div class="select">
								  <select id="code_details" name="code" onchange="alertMessages()" required >
								    <option value=""></option>
								    <option value="1">Field(A)</option>
								    <option value="5">Field(B)</option>
								    <option value="6">Field(C)</option>
								    <option value="2">Special(D)</option>
								    <option value="3">Office(E)</option>
								    <option value="4">Towing(F)</option>
								    </select>
								    
								  <span class="focus"></span>
								</div>
								
		                    </div>
		                  </div>
		                 
		     </form>             
        </div>
        <div class="modal-footer">
          <button type="button" id="btnedit" onclick="update()" class="btn btn-default">Edit</button><button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
      
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
<script>
function submitDetailsForm() {
   alert("ello!");
	// $("#formId").submit();
 }
$(document).ready(function() {

   
    
    $("#btnedit").click(function(){
    	btn_action=$("#btnedit").html();
    	if(btn_action=="Edit"){
    		$("#btnedit").html("Update");
    		$('#gsis').attr('readonly', false);
    		$('#lname').attr('readonly', false);
    		$('#fname').attr('readonly', false);
    		$('#mname').attr('readonly', false);
    		$('#pagibig').attr('readonly', false);
    		$('#philhealth').attr('readonly', false);
    		$('#contact_no').attr('readonly', false);
    		$('#address').attr('readonly', false);
    		$('#tin').attr('readonly', false);
    		$('#btype').attr('readonly', false);
    		$('#dob').attr('readonly', false);
    		$('#email').attr('readonly', false);
    		$('#code_details').removeAttr('disabled');
    		$('#standard-select_details').removeAttr('disabled');
    		}
    	else{
    		var email=document.getElementById('email').value;
    		//if ($.inArray(email, email_array) != -1)
    		//{
    		  //alert("Existing Email address!");
    		  
    		//}
    	//	else{
    			
    			$("#btnedit").html("Edit");
        		$('#gsis').attr('readonly', true);
        		$('#pagibig').attr('readonly', true);
        		$('#philhealth').attr('readonly', true);
        		$('#contact_no').attr('readonly', true);
        		$('#address').attr('readonly', true);
        		$('#tin').attr('readonly', true);
        		$('#btype').attr('readonly', true);
        		$('#dob').attr('readonly', true);
        		$('#email').attr('readonly', true);
        		$('#lname').attr('readonly', true);
        		$('#fname').attr('readonly', true);
        		$('#mname').attr('readonly', true);
        		$('#code_details').attr('disabled','disabled');
        		$('#standard-select_details').attr('disabled','disabled');
        		var form = document.getElementById("frm_update");
        		form.submit();
        		
    		//}
    	
    	}
    	 
    	});
} );

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