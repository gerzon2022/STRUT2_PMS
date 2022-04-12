function initialize(id,name)
{

var geocoder =  new google.maps.Geocoder();
geocoder.geocode( { 'address':name}, function(results, status) {
 if (status == google.maps.GeocoderStatus.OK) {
 var myCenter=new google.maps.LatLng( results[0].geometry.location.lat() , results[0].geometry.location.lng());
 var marker;
 var mapProp = {
 scrollwheel:true,		  
 center:myCenter,
 zoom:15,
 mapTypeId: google.maps.MapTypeId.ROADMAP
 };
 var map=new google.maps.Map(document.getElementById("googleMap"+id),mapProp);
 
 marker=new google.maps.Marker({
 position:myCenter,
 animation:google.maps.Animation.BOUNCE
});
marker.setMap(map);

var infowindow = new google.maps.InfoWindow({
	  overlayImage:place,
	  content:contentString
	  });
	    google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map,marker);
	  });
 }
});
}
// In the following example, markers appear when the user clicks on the map.
// Each marker is labeled with a single alphabetical character.
const labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
let labelIndex = 0;

function initMap() {
  const bangalore = { lat: 12.97, lng: 77.59 };
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 12,
    center: bangalore,
  });

  // This event listener calls addMarker() when the map is clicked.
  google.maps.event.addListener(map, "click", (event) => {
    addMarker(event.latLng, map);
  });
  // Add a marker at the center of the map.
  addMarker(bangalore, map);
}

// Adds a marker to the map.
function addMarker(location, map) {
  // Add the marker at the clicked location, and add the next-available label
  // from the array of alphabetical characters.
  new google.maps.Marker({
    position: location,
    label: labels[labelIndex++ % labels.length],
    map: map,
  });
}