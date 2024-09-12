import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OfferMapScreen extends StatefulWidget {
  const OfferMapScreen({Key? key}) : super(key: key);

  @override
  _OfferMapScreenState createState() => _OfferMapScreenState();
}

class _OfferMapScreenState extends State<OfferMapScreen> {


  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-11.2999, -41.8568);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('defaultMarker'),
            position: _center,
          ),
        },
        myLocationEnabled: true,
        zoomControlsEnabled: true,
      ),
    );
  }
}
