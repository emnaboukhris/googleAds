import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Polyline extends StatefulWidget {
  const Polyline({Key? key}) : super(key: key);

  @override
  State<Polyline> createState() => _PolylineState();
}

class _PolylineState extends State<Polyline> {
  static const _initialCameraPosition = CameraPosition(
      target: LatLng(37.773972, -122.431297), zoom: 11.5);


 Marker? _origin;
 Marker? _destination;


  Completer<GoogleMapController> _controller = Completer();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleMap(
          initialCameraPosition:  CameraPosition(
              target: LatLng(37.773972, -122.431297), zoom: 11.5),
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller){
    _controller.complete(controller);} ,
          markers: {
            if (_origin != null) _origin!,
            if (_destination != null) _destination!
          },

          onLongPress: _addMarker,


        ),

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue, foregroundColor: Colors.black,
        onPressed: _goTo,),
    );
  }

  Future<void> _goTo() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_initialCameraPosition));
  }

  // add Marker

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        // Reset destination
        _destination = null;

        // Reset info
      });
    } else {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      // Get directions

    }
  }
}
// add Marker
