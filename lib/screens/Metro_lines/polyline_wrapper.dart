import 'package:flutter/material.dart';
import 'package:googleads/Layout/footer.dart';
import 'package:googleads/screens/Metro_lines/process_timeline_notif.dart';
import 'package:googleads/screens/Metro_lines/select_station.dart';
import 'package:progress_timeline/progress_timeline.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:ui';
import 'package:lottie/lottie.dart';

import '../../data/station_list.dart';


class Polyline_wrapper extends StatefulWidget {
  final linge_num ligne  ;

  const Polyline_wrapper( this.ligne,{Key? key}) : super(key: key);

  @override
  State<Polyline_wrapper> createState() => _Polyline_wrapperState(this.ligne);
}

class _Polyline_wrapperState extends State<Polyline_wrapper> {

  late linge_num ligne ;
  _Polyline_wrapperState(this.ligne);


  Color _primaryColor = HexColor('#80FF72');
  Color _accentColor = HexColor('#7EE8FA') ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children : [
          Center(
            child: Container(

              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,colors: [_primaryColor,_accentColor,_accentColor,Colors.white]),
              ),
            ),
          ),
          Column(
      children: <Widget>[
        SizedBox(height: 30,),
    Expanded(
    child:Container(
    decoration: BoxDecoration(
    borderRadius:  BorderRadius.only(
    topLeft: Radius.circular(0),
    topRight: Radius.circular(350)
    ),
      color: Colors.white.withOpacity(0.4),
    ),

    ),flex: 1),
       ]

    ),
          Positioned(left:200,top: 250,

child: Column(

  children: [

    Container(
        child:Lottie.asset('assets/train_background.json',
          height:150,
          width: 150,
        )
    ),
    SizedBox(height: 30,),

    Text("Metro "+ligne.metro_num,  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)
        ,)
,
    SizedBox(height: 20,),
    Text("time left : 10 min",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
    ,    SizedBox(height: 20,),

    Select_Metro()


  ],
),),

ProcessTimelinePage(ligne),

          Footer(),
        ],
    )
         );
  }
}
