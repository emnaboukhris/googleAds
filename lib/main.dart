// @dart=2.9

import 'package:flutter/material.dart';
import 'package:googleads/metro_choice.dart';
import 'package:googleads/polyline_wrapper.dart';
import 'package:googleads/test.dart';
import 'package:hexcolor/hexcolor.dart';



void main() {
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
      home:metro_choice()  );
  }
}

