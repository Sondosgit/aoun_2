import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class locations extends StatefulWidget {
  const locations({super.key});
  @override
  State<locations> createState() => _locationsState();
}

class _locationsState extends State<locations> {
  StreamSubscription<Position>? positionStream;

  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.whileInUse) {
      positionStream =
          Geolocator.getPositionStream().listen((Position? position) {
        m.add(Marker(
          
            markerId: MarkerId("1"),
            position: LatLng(position!.latitude, position.longitude)));
          print(position!.latitude);
          print("=======================================");
        gmc!.animateCamera(CameraUpdate.newLatLng(
            LatLng(position!.latitude, position.longitude)));
        setState(() {});
      });
    }
  }

  GoogleMapController? gmc;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  List<Marker> m = [];

  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  @override
  void dispose() {
    positionStream!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(color: Color(0xFF6869D6), size: 33),
            title: const Text("الموقع",
                style: TextStyle(
                    fontSize: 36,
                    color: Color(0xFF6869D6),
                    fontWeight: FontWeight.bold))),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  child: GoogleMap(
                markers: m.toSet(),
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (mapcontroller) {
                  gmc = mapcontroller;
                },
              ))
            ],
          ),
        ));
  }
}
