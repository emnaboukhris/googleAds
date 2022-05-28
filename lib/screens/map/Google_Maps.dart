
import 'package:flutter/material.dart';
import 'package:googleads/Layout/footer.dart';
import 'package:latlong2/latlong.dart' as lating;
import 'package:flutter_map/flutter_map.dart';

class Google_Maps extends StatefulWidget {
  const Google_Maps({Key? key}) : super(key: key);

  @override
  State<Google_Maps> createState() => _Google_MapsState();
}

class _Google_MapsState extends State<Google_Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map" ,
            style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold)
        ),
        elevation: 0.5 ,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end : Alignment.bottomRight ,
                  colors: <Color>[Theme.of(context).primaryColor , Theme.of(context).accentColor]
              ),
            )
        ),
        actions: [
          Container(
              margin: EdgeInsets.only(top: 16, right: 16),
              child:Stack(
                children: <Widget>[
                  Icon(Icons.notifications),
                  Positioned(right: 0,
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(6),),
                        constraints : BoxConstraints(minWidth: 12 , minHeight: 12) ,
                        child: Text('5', style: TextStyle(color: Colors.white , fontSize: 8), textAlign: TextAlign.center,),


                      ))
                ],
              )
          )
        ],
      ),
      body:  Stack(
        children: <Widget>[
          new Container(
          child: FlutterMap(
      options: new MapOptions(
      center: new lating.LatLng(51.5, -0.09),
      zoom: 13.0,
    ),
    layers: [
    new TileLayerOptions(
    urlTemplate: "https://api.mapbox.com/styles/v1/emnabkk/cl3pqxis6000x14nq9lt82csu/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZW1uYWJrayIsImEiOiJjbDNwcTVwbXUwMncxM2twNzdsMGhzdHM5In0.yELxUo17ML0Ws6hkiNhLbQ",
    additionalOptions: {
    'accessToken':'pk.eyJ1IjoiZW1uYWJrayIsImEiOiJjbDNwcTVwbXUwMncxM2twNzdsMGhzdHM5In0.yELxUo17ML0Ws6hkiNhLbQ',
    'id':'mapbox.mapbox-streets-v8'
    ,
    },
    ),

    ],
    ),
    )


          ,Footer()
        ],
      ),
    );
  }
}