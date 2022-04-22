import 'package:flutter/material.dart';
import 'package:googleads/Layout/footer.dart';
import 'package:googleads/Layout/header_widget.dart';
import 'package:googleads/data/station_list.dart';
import 'package:googleads/screens/Metro_lines/process_timeline_notif.dart';
import 'package:googleads/screens/Metro_lines/select_station.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:ui';
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    Color _primaryColor = HexColor('#80FF72');
    Color _accentColor = HexColor('#7EE8FA') ;
    return Scaffold(
      body:Stack(

        children: [
          Center(
            child: Container(

              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topLeft,
                    end: Alignment.bottomRight,colors: [Colors.white,Colors.white,_accentColor]),
              ),
            ),
          ),
          Container(child: HeaderWidget(250, false,Icons.notifications_active )),
          ProcessTimelinePage(linge_num(Stations_list.stations_linge1,'1')),
          Positioned(left:200,top: 270,

            child: Column(

              children: [

                FloatingActionButton.large(
                  backgroundColor: Colors.lightBlueAccent,
                  onPressed: () {},
                  child: Icon(
                    Icons.train,
                    size: 70,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30,),

                Text("Metro 2",  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)
                  ,)
                ,
                SizedBox(height: 25,),
                Text("time left : 10 min",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                ,    SizedBox(height: 15,),

                Select_Metro(),


              ],
            ),),
          Footer()
        ],
      )
    );
  }
}
