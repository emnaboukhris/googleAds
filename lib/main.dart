// @dart=2.9

import 'package:flutter/material.dart';
import 'package:googleads/Layout/footer.dart';
import 'package:googleads/Layout/layout.dart';
import 'package:googleads/screens/line_choice/metro_choice.dart';
import 'package:googleads/screens/Metro_lines/polyline_wrapper.dart';
import 'package:googleads/wrapper.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:firebase_core/firebase_core.dart';
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

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
            primaryColor: _primaryColor,
            accentColor: _accentColor ,
            scaffoldBackgroundColor : Colors.grey.shade100 ,
            primarySwatch: Colors.grey ,

      ),
      home:Wrapper()  );
  }
}

