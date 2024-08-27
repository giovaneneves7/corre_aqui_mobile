import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OfferMapScreen extends StatefulWidget {
  const OfferMapScreen({Key? key}) : super(key: key);

  @override
  _OfferMapScreenState createState() => _OfferMapScreenState();
}

class _OfferMapScreenState extends State<OfferMapScreen> {

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Mapa de Ofertas',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary, // Texto branco
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        toolbarHeight: 50, // Reduz a altura da AppBar
      ),
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
