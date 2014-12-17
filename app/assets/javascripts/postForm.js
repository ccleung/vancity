function initialize() {
    var options = {
      types: ['(cities)']
    };
    var autocomplete = new google.maps.places.Autocomplete($("#location")[0], options);
    google.maps.event.addListener(autocomplete, 'place_changed', function() {
      var place = autocomplete.getPlace();
    });
  }

document.ready = initialize();