<%@taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
<head>
<script src="dist/js/jquery-1.10.1.min.js"></script>

   <% 
	                    String t=(String)session.getAttribute("userType");
	                    if(t!=null) { 
	                    
	                    } 
	                    else{  %> 
	                    	<jsp:forward page="/index.jsp" />
	                    
	                   <%  }
	                    %>  
  <script type="text/javascript" >
 

  
    function txtlat(latLng){
    	
      document.getElementById("lat").value=latLng
        //document.map_form.map_url.value =1;
        
        //return true;c
      }
    function txtLng(latLng){
    	
        document.getElementById("Lng").value=latLng
          //document.map_form.map_url.value =1;
          
          //return true;c
        }
    function txtmark(lblmarked){
    	
        document.getElementById("marked").value=lblmarked
          //document.map_form.map_url.value =1;
          
          //return true;c
        }

  </script>

  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" name="viewport">
  <title>Add/Delete &mdash; Traffic Hotspot</title>

  


    <script src="dist/js/myscript.js"></script>
   
               <script>
               				<%--!
							$(document).ready(function(){
							  $("#myInput").on("keyup", function() {
							    var value = $(this).val().toLowerCase();
							    $("#myTable tr").filter(function() {
							      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
							    });
							  });
							});
							--%>
							//below is table data to input
							$(document).ready(function(){
									
							    // code to read selected table row cell data (values).
							    $("#myTable").on('click','.btnSelect',function(){
							         // get the current row
							         var currentRow=$(this).closest("tr"); 
							         var area_no=currentRow.find("td:eq(1)").text();
							         var loc_address=currentRow.find("td:eq(2)").text();
							         var map_url=currentRow.find("td:eq(3)").text();
							          // get current row 1st TD value
							         $("#area_no").val(area_no);
							         $("#loc_address").val(loc_address);
							         $("#map_url").val(map_url);
							         $("#p").html(map_url);
							         let btn_submit = document.querySelector("#btn_submit");
							         let btn_new = document.querySelector("#btn_new");
							         btn_submit.disabled = true;
							         btn_new.disabled = false;
							         
							        // var data=col1;
							         
							        
							    });
							    $( "#btn_new" ).click(function(){
							         // get the current row
							         var currentRow=$(this).closest("tr"); 
							         var area_no=currentRow.find("td:eq(1)").text();
							         var loc_address=currentRow.find("td:eq(2)").text();
							         var map_url=currentRow.find("td:eq(3)").text();
							          // get current row 1st TD value
							         $("#area_no").val(area_no);
							         $("#loc_address").val(loc_address);
							         $("#map_url").val(map_url);
							         $("#p").html(map_url);
							         let btn_submit = document.querySelector("#btn_submit");
							         let btn_new = document.querySelector("#btn_new");
							         btn_submit.disabled = false;
							         btn_new.disabled = true;
							         
							        // var data=col1;
							         
							        
							    });
							});
						
							var x=0;
							let map;
							let letter="A";
							let A=0;
							let B=0;
							let C=0;
							let D=0;
							let E=0;
							let F=0;
							let clickedA=0;
							let clickedB=0;
							let clickedC=0;
							let clickedD=0;
							let clickedE=0;
							let clickedF=0;
							
							var marker;
							var infowindow;
							 var maparray = [];
							   <s:iterator value="beanList">
									maparray.push(['<s:property value="marked_lbl"/>',<s:property value="lat"/>,<s:property value="lng"/>]);
								</s:iterator>
								
							const labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
							let labelIndex = 0;
							
							  labelIndex=x;
							function initMap() { 
								
								
							  const cdo = { lat: 8.477217, lng: 124.645920 };
							  map = new google.maps.Map(document.getElementById("map"), {
							    zoom: 15,
							    center:cdo,
							  });
							  
							  
							  
							 

							  for(let i = 0; i < maparray.length; i++) {
								  labelIndex++;
							     for(let j = 0; j < maparray[i].length; j++) {
							       	if(j==0){lbl=maparray[i][j];
							       	
							       		if(lbl.charAt(0)=='A'){if(A<parseInt(lbl.substring(1))){A=parseInt(lbl.substring(1));}}
							       		else if(lbl.charAt(0)=='B'){if(B<parseInt(lbl.substring(1))){B=parseInt(lbl.substring(1));}}
							       		else if(lbl.charAt(0)=='C'){if(C<parseInt(lbl.substring(1))){C=parseInt(lbl.substring(1));}}
							       		else if(lbl.charAt(0)=='D'){if(D<parseInt(lbl.substring(1))){D=parseInt(lbl.substring(1));}}
							       		else if(lbl.charAt(0)=='E'){if(E<parseInt(lbl.substring(1))){E=parseInt(lbl.substring(1));}}
							       		else if(lbl.charAt(0)=='F'){if(F<parseInt(lbl.substring(1))){F=parseInt(lbl.substring(1));}}
							       	}
							       	
							       	if(j==2){th={ lat: maparray[i][j-1], lng: maparray[i][j] };}
							    	
							     }
							     
							     addMarkerFrDb(th,lbl );
							     
							  }
							  
							 
							 
							 
							  // This event listener calls addMarker() when the map is clicked.
							  google.maps.event.addListener(map, "click", (event) => {
								
								
									if ($('input[name=radio]:checked').length < 1) {
									   alert("Please select code first!");
									   
									}
									else{
									txtlat(event.latLng.lat());
									txtLng(event.latLng.lng());
										addMarker(event.latLng);}
									
							    	
							    	

							  });
							  
							  // Add a marker at the center of the map.
							 
							  
							  
							
						
							
							}
							
							function iclicked(){
								
								var num=0;
								letter=document.querySelector('input[name="radio"]:checked').value;
								if(letter=='A'){if(!clickedA){A++;clickedA=1;} num=A;}
								if(letter=='B'){if(!clickedB){B++;clickedB=1;}num=B;}
								else if(letter=='C'){if(!clickedC){C++;clickedC=1;}num=C;}
								else if(letter=='D'){if(!clickedD){D++;clickedD=1;}num=D;}
								else if(letter=='E'){if(!clickedE){E++;clickedE=1;}num=E;}
								else if(letter=='F'){if(!clickedF){F++;clickedF=1;}num=F;}
								
								marker.set('label', letter+""+num);
								
								txtmark(marker.getLabel());
							}
							function addMarker(location) {
							 	
							var i=labelIndex;
									
									 if (!marker || !marker.setPosition) {
										    marker = new google.maps.Marker({
										      position: location,
										      label: letter+""+A,
										      map: map,
										    });
										  } else {
										    marker.setPosition(location);
										  }
									 txtmark(marker.getLabel());
								 
							}
							// Adds a marker to the map.
								
								function addMarkerFrDb(location,lbl) {
								
								
							  // Add the marker at the clicked location, and add the next-available label
							  // from the array of alphabetical characters.
							  new google.maps.Marker({
							    position: location,
							    label: lbl,
							    map: map,
							  });
							 
							  addMarker(location);
							 // txtmark(lblmarked)
							}
							
							</script>
							
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
   <script> 
 
  

  
 
   
   //twodarray.forEach(alert(item));
    </script>
     						<% 
	                    String admin=(String)session.getAttribute("userType");
	                    if(admin==null) { %>
	                    	<jsp:forward page="/index.jsp" />
	                    	
	                    <%} 
	                    
	                    %> 
<jsp:include page="menu.jsp"/>;

  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
        <div  class="col-12 col-sm-1 offset-sm-2 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-10 offset-xl-2">
           <div class="login-brand">
              -
            </div>

            <div class="card card-primary">
              <div class="card-header"><h4>Traffic Hotspot Information</h4></div>
<div class="form-group">
                  <br>
	                 &nbsp &nbsp <b>CODE</b>
						<label class="form-control">
						  <input type="radio" value="A" name="radio" onclick="iclicked()"/>
						  <label for="radio">High Traffic(A)</label> &nbsp &nbsp
						  <input type="radio" value="B" name="radio"  onclick="iclicked()" />
						  <label for="radio">Medium Traffic(B) </label>&nbsp&nbsp
						  <input type="radio" value="C" name="radio" onclick="iclicked()" />
						  <label for="radio">Low Traffic(C)</label>&nbsp&nbsp
						  <input type="radio" value="D" name="radio" onclick="iclicked()" />
						  <label for="radio">Special(D)</label>&nbsp&nbsp
						  <input type="radio" value="E" name="radio" onclick="iclicked()" />
						  <label for="radio">Office(E)</label>&nbsp&nbsp
						  <input type="radio" value="F" name="radio" onclick="iclicked()" />
						  <label for="radio">Towing(F)</label>&nbsp&nbsp
						  
						</label>
						
				</div>
              <div class="card-body">
                <form method="POST" action="register_map.action" id="map_form" name="map_form" >
                                    
                  <div class="row">
                  
     
                         <div id="map" style="background-color: coral;height: 450px;
  border: 1px solid black;  width:100%;"></div>
 <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCEuKuVVkIhRXYlaEkpEcJ0F2LRdnU-xSY&callback=initMap&v=weekly"
      async
    ></script>
    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    
                   
           
                  </div>
                
				<br>
                  <div class="form-group">
                    <s:if test="ctr>0">
								<span style="color: green;"><s:property value="msg" /></span>
						</s:if>
					<s:else>
								<span style="color: red;"><s:property value="msg" /></span>
					</s:else>
                  <br>
                    <label for="map_address">Location</label>
                    <input  type="text" class="form-control" name="map_address" id="loc_address" required>
                    <div class="invalid-feedback">
                    </div>
                  
                 
                  </div>
                   <div class="form-group">
                    <label for="loc">Description</label>
                    <input  type="text" class="form-control" name="loc_desc" id="loc_desc" required>
                    <div class="invalid-feedback">
                    </div>
                  
                 
                  </div>

                  <div class="row">
                  
                    <div class="form-group col-4">
                      <label for="lbl" class="d-block">Area</label>
                      <input id="marked" type="text" class="form-control" name="marked" onkeypress="return false;" required> 
                    </div>
                    <div class="form-group col-4">
                      <label for="lat" class="d-block">Longitude</label>
                      <input id="Lng" type="text" class="form-control" name="lng" onkeypress="return false;" required> 
                    </div>
                    <div class="form-group col-4">
                      <label for="lat" class="d-block">Latitude</label>
                      <input id="lat" type="text" class="form-control" name="lat" onkeypress="return false;"	 required> 
                    </div>
                    
                  </div>

                  <div class="form-divider">
                    <!-- Your Home -->
                  </div>
                   <div class="row">
                  
                    <div class="form-group col-12">
                       <button type="submit" class="btn btn-primary btn-block" id="btn_submit">
                      Register
                    </button>
                    </div>
                  
                  </div>
                 

                </form>
               
                    <div class="card-header">
                  
                    <h4>Advanced Table</h4>
                  </div>
                  <div class="table-responsive">
                  	<s:if test="noData==true">
                      <table id="myTable" class="display nowrap" style="width:100%">
                      <thead>
                        <tr>
                        	
                          
                          <th>AREA NO.</th>
                          <th>Location</th>
                          <th>Description</th>
                          <th>Marked</th>
                          <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="beanList">
                        
                          <td><s:property value="area_no" /></td>
                          <td class="align-middle">
                            <s:property value="map_address" />
                          </td>
                          <td>
                             <s:property value="loc_desc" />
                             </td>
                         
                          <td><s:property value="marked_lbl" /></td>
                          <td><a href="delete_map?loc_id=<s:property value="area_no"/>" class="confirmation" class="confirmation">DELETE</a></td>
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
            </div>
            <div class="simple-footer">
              
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
 <script>
 
                  
                  
 </script>
<script src="dist/modules/bootstrap/js/bootstrap.min.js"></script>
<script src="dist/modules/scroll-up-bar/dist/scroll-up-bar.min.js"></script>
<script src="dist/js/scripts.js"></script>
<script src="dist/js/custom.js"></script> 
  <!-- For pdfmake -->
<script src="dist/js/pdfmake.0.1.68.min.js"></script>
<script src="dist/js/pdfmake.vfs_fonts.0.1.68.min.js"></script>
    <script>
   
  $('.confirmation').on('click', function () {
      return confirm('Are you sure?');
  });
  </script>
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