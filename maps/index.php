<?php
$url = "https://foodtrack.ml/";
try{
$bdd = new PDO('mysql:host=db4free.net;dbname=projetcas', 'epsiprojet', 'W!pj2M9@!v_V5ku');
echo "BDD Connecté !";
}
catch (Exception $e){
die('Erreur : ' . $e->getMessage());
}
?>

<!doctype html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Maps Integration</title>
        <link href="maps.css" rel="stylesheet">
    </head>
    <body>
        <div id="map"></div>
        <script>
            var obj = { prop: ["1a", "2a", "3a"] };
            //console.log(obj);
            var ports = [
                //Id, Nom, Lat, Lng
                ["Cork", 51.89, -8.498],//0 (en php -> index -1)
                ["Plymouth", 50.369806, -4.147944],//1
                ["Brest", 48.384167, -4.486639],//2
                ["La Rochelle", 46.157417, -1.155333],//3
                ["St John's", 47.557806, -52.696722],//4
                ["New York", 40.696444, -73.992611],//5
                ["Miami", 25.759278, -80.190500],//6
                ["La Havane", 23.169194, -82.169083],//7
                ["Dakar", 14.759417, -17.134083],//8
                ["Cap-Vert", 14.920278, -23.489694],//9
                ["Acores", 37.806222, -25.501806],//10
                ["Porto Rico", 18.436333, -66.142861],//11
                ["Port-au-Price", 18.628194, -72.316194],//12
            ];
            console.log(ports);

            var liens = [
                //Port1, Port2
                [0, 2],
                [2, 4],
                [4, 8],
                [8, 9],
                [9, 11],
                [11, 12],
                [12, 0],
            ];

            //Inisialisation de la Map
            let map;

            function initMap() {

                const line = {
                    path: "M 0,-1 0,1",
                    strokeOpacity: 1,
                    scale: 4,
                };
   
                const lineSymbol = {
                    path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
                    strokeOpacity: 1,
                };

                map = new google.maps.Map(document.getElementById("map"), {
                    center: { lat: 35, lng: -40 },
                    zoom: 4,
                });

                //Affichage des ports sur la carte
                for (var i = 0; i < ports.length; i++) {
                    var port = ports[i];

                    var marker = new google.maps.Marker({
                        position: { lat: port[1], lng: port[2] },
                        map: map,
                        title: port[0],
                        icon: "none.png",
                        label: {
                            text: port[0],
                            color: "#FFFFF",
                            fontSize: "15px",
                            fontWeight: "bold",
                        },
                    });

                    const cityCircle = new google.maps.Circle({
                        strokeColor: "#FF0000",
                        strokeOpacity: 0.8,
                        strokeWeight: 2,
                        fillColor: "#FF0000",
                        fillOpacity: 0.20,
                        map,
                        center: { lat: port[1], lng: port[2] },
                        radius: 50000,
                    });

                }
                //Afichage des liens sur la carte
                for (var i = 0; i < liens.length; i++) {
                    var lien = liens[i];

                    const mline = new google.maps.Polyline({
                        path: [
                            { lat: ports[lien[0]][1], lng: ports[lien[0]][2] },
                            { lat: ports[lien[1]][1], lng: ports[lien[1]][2] },
                        ],
                        strokeOpacity: 0,
                        icons: [
                            {
                                icon: line,
                                repeat: "20px",
                            },
                            {
                                icon: lineSymbol,
                                offset: "50%",
                                repeat: "200px",
                            },
                        ],
                        map: map,
                    });

                }
            };
        </script>
        <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHnjTqndZxR1H2FHNaArsx3pUi_FqHFYs&callback=initMap"></script>
    </body>
</html>