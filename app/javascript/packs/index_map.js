import GMaps from 'gmaps';

const mapElement = document.getElementById('map');

if (mapElement) {
  const styles = [
    {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#e9e9e9"
            },
            {
                "lightness": 17
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#f5f5f5"
            },
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "lightness": 17
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "lightness": 29
            },
            {
                "weight": 0.2
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "lightness": 18
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "lightness": 16
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#f5f5f5"
            },
            {
                "lightness": 21
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#dedede"
            },
            {
                "lightness": 21
            }
        ]
    },
    {
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#ffffff"
            },
            {
                "lightness": 16
            }
        ]
    },
    {
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "saturation": 36
            },
            {
                "color": "#333333"
            },
            {
                "lightness": 40
            }
        ]
    },
    {
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#f2f2f2"
            },
            {
                "lightness": 19
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#fefefe"
            },
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#fefefe"
            },
            {
                "lightness": 17
            },
            {
                "weight": 1.2
            }
        ]
    }
]


  const map = new GMaps({
    el: '#map',
    lat: 45.5017,
    lng: -73.5673,
    // gestureHandling: 'none',
    // zoomControl: false
  });

  const markers = JSON.parse(mapElement.dataset.markers);

  console.log(markers);

  map.addMarkers(markers);

  if (markers.length === 0) {
    console.log('NO VEHICLE FOUND');

    const queryURL = new URLSearchParams(window.location.search);
    if (queryURL.has('location')) {
      console.log('location found');
      const geocoder = new google.maps.Geocoder();;
      geocoder.geocode( { 'address': queryURL.get('location') }, function (results, status) {
        console.log(status);
        if (status == 'OK') {
          const location = results[0].geometry.location;
          map.setCenter({lat: location.lat(), lng: location.lng()});
          map.setZoom(12);
        }
        else {
          alert("Location not found");
          //map.setZoom(4);
        }
      });
    }
    else {
      alert("Location not found");
      map.setZoom(4)
    }

  } else if (markers.length === 1) {
    console.log('ONE MARKER FOUND');
    map.setCenter(markers[0].lat + 0.012, markers[0].lng);
    // map.setZoom(15);
  } else {
    console.log('MARKERS FOUND');
    map.fitLatLngBounds(markers);
  }

  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });
  map.setStyle('map_style');



}

import { autocomplete } from '../components/autocomplete';
autocomplete();
