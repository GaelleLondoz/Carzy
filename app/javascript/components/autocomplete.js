function autocompletebyID(id) {
  document.addEventListener("DOMContentLoaded", function() {
    var flatAddress = document.getElementById(id);

    if (flatAddress) {
      var autocomplete = new google.maps.places.Autocomplete(flatAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(flatAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

function autocomplete() {
    autocompletebyID('vehicule_location');
    autocompletebyID('location');
}

export { autocomplete };


