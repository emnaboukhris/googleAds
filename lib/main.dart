
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:googleads/screens/map/Location.dart';
import 'package:googleads/screens/map/follow_location.dart';
import 'package:googleads/services/geolocator_service.dart';
import 'package:googleads/wrapper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  Color _primaryColor = HexColor('#80FF72');
  Color _accentColor = HexColor('#7EE8FA') ;
  final geoService = GeolocatorService();

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => geoService.getInitialLocation(),
      initialData: null,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: _primaryColor,
            accentColor: _accentColor ,
            scaffoldBackgroundColor : Colors.grey.shade100 ,
            primarySwatch: Colors.grey ,

          ),

          home:Consumer<Position>(builder: (context,position,widget){
            return (position != null)
              ? Map( initialPosition: position):
                Center(child: CircularProgressIndicator()) ;
          },)
      ),
    );
  }
}
