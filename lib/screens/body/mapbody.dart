import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Map UI",
      home: MapPage(),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool mapToggle = false;

  var currentLocation;

  GoogleMapController mapController;

  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((currloc) {
      setState(() {
        currentLocation = currloc;
        mapToggle = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 117.0,
                width: double.infinity,
                child: mapToggle
                    ? GoogleMap(
                        onMapCreated: onMapCreated,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(currentLocation.latitude,
                                currentLocation.longitude),
                            zoom: 12.0))
                    : Center(
                        child: Text(
                        'Loading .. Please wait ..',
                        style: TextStyle(fontSize: 20.0),
                      )),
              )
            ],
          )
        ],
      ),
    );
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}
