
<?php
$localidad = "Bogota";
$Calles = "Carrera";
$numerouno = "95a";
$numerodos = "129d";
$numero3 = "36";


$latitud;
$longitud;
$address = urlencode($localidad . $Calles . $numerouno . '#' . $numerodos . '-'. $numero3);     
    $googleMapUrl = "https://maps.googleapis.com/maps/api/geocode/json?address={$address}&key=AIzaSyBcThllYK4h_5A6qPw-z4iFinePf3GRVQc";
    $geocodeResponseData = file_get_contents($googleMapUrl);
    $responseData = json_decode($geocodeResponseData, true);
    if($responseData['status']=='OK') {
        $latitude = $responseData['results'][0]['geometry']['location']['lat'];
        $longitude = $responseData['results'][0]['geometry']['location']['lng'];
        $formattedAddress = isset($responseData['results'][0]['formatted_address']) ? $responseData['results'][0]['formatted_address'] : "";         
        if($latitude && $longitude && $formattedAddress) {         
            $geocodeData = array();                         
            array_push(
                $geocodeData, 
                $latitude, 
                $longitude, 
                $formattedAddress
            );        
            
            $latitud = $latitude;
            $longitud = $longitude;
           // return $geocodeData;             
        } else {
            return false;
        }         
    } else {
        echo "ERROR: {$responseData['status']}";
        return false;
    }

?>

<!--------------------->


    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcThllYK4h_5A6qPw-z4iFinePf3GRVQc&callback=initMap&libraries=&v=weekly"
      defer
    ></script>
    <style type="text/css">
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }

      /* Optional: Makes the sample page fill the window. */
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    <script>
      "use strict";

      let map;

      function initMap() {
        map = new google.maps.Map(document.getElementById("map"), {
          center: {
            lat: <?php echo $latitud; ?>,
            lng: <?php echo $longitud; ?>
          },
          zoom: 20
        });
      }
    </script>
</head>
<body>



  </body>
</html>