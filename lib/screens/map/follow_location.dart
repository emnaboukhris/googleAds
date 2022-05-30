import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googleads/services/geolocator_service.dart';

class Map extends StatefulWidget {
  const Map({Key? key, required this.initialPosition}) : super(key: key);
  final Position initialPosition ;

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  final GeolocatorService geoService = GeolocatorService();
  static const  _initialCameraPosition = CameraPosition(target:LatLng( 37.773972,-122.431297),zoom: 11.5);
  Completer<GoogleMapController> _controller = Completer() ;
  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow:InfoWindow(title: 'Google Plex'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(37.42796133580664, -122.085749655962),

  );

  @override
  void initState() {
    // TODO: implement initState
    geoService.getCurrentLocation().listen((position) {
      centerScreen(position) ;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: GoogleMap(
         initialCameraPosition:
         CameraPosition(
         target: LatLng(
         widget.initialPosition.latitude,
         widget.initialPosition.longitude )
             ,zoom:18.0),
        mapType: MapType.normal,
         myLocationEnabled: true,
         onMapCreated: (GoogleMapController controller){
           _controller.complete(controller) ;
         },
         markers: {
           _kGooglePlexMarker
         },
     ),
    )
    );
  }
  Future<void> centerScreen(Position position) async {
    final GoogleMapController controller = await _controller.future ; 
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude,position.longitude),zoom:18.0))) ;
  }
}

