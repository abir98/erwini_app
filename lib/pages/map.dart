import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../services/authservice.dart';
import '../widgets/header.dart';

class mymap extends StatefulWidget {
  @override
  _mymapState createState() => _mymapState();
}

class _mymapState extends State<mymap> {
  final LatLng _center = const LatLng(45.521563, -122.677433);
  late GoogleMapController _controller;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            ElevatedButton(

              onPressed: () {
                // Call the logout function from the auth service
                authservice().logout();

                // Navigate to the login screen
                Navigator.pushNamedAndRemoveUntil(
                 context,
                 '/login',
                      (Route<dynamic> route) => false,
                );
              },
              child: const Text('Logout'),
            ),
          ],
          toolbarHeight: 75,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: waveclipper(),
            child: Container(
                color: const Color.fromARGB(255, 11, 164, 105),
                height: 130,
                width: double.infinity),
          ),
        ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
