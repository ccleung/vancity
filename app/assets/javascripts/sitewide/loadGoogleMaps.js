$(document).on("ready page:load", 
  function() {
  if (typeof google == "undefined") {
    jQuery.getScript("http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-US&callback=initialize")
  } 
  else {
    initialize();
  }
});

function initialize() {
  var options = {
    types: ['(cities)']
  };
  var autocomplete = new google.maps.places.Autocomplete($("#location")[0], options);
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    var place = autocomplete.getPlace();
  });
}