import 'package:flutter/material.dart';
import 'package:googleads/Layout/footer.dart';
import 'package:googleads/Layout/header_widget.dart';
import 'package:googleads/screens/Metro_lines/select_station.dart';
import 'package:progress_timeline/progress_timeline.dart';

import 'package:hexcolor/hexcolor.dart';
import 'dart:ui';

class Gradiant_background extends StatefulWidget {
  const Gradiant_background({Key? key}) : super(key: key);

  @override
  State<Gradiant_background> createState() => _Gradiant_backgroundState();
}

class _Gradiant_backgroundState extends State<Gradiant_background> {
  late ProgressTimeline progressTimeline ;
  late ProgressTimeline progressTimelineNotif ;

  static const IconData train = IconData(0xe675, fontFamily: 'MaterialIcons');

  List<SingleState> states =[
    SingleState(stateTitle: 'passage',) ,
    SingleState(stateTitle: 'mohamed 5') ,
    SingleState(stateTitle: 'palastine') ,
    SingleState(stateTitle: 'jeune') ,
    SingleState(stateTitle: 'cite') ,
    SingleState(stateTitle: '10 december') ,

    SingleState(stateTitle: 'fell') ,
    SingleState(stateTitle: 'lpA') ,
    SingleState(stateTitle: 'Ariana') ,
    SingleState(stateTitle: 'wsolt') ,


  ];
  @override
  void initState(){
    super.initState() ;

    progressTimeline =
        ProgressTimeline(states: states,

      iconSize: 35.0 ,
      checkedIcon: Icon(Icons.check_circle_outline),
      connectorColor: Colors.black,
      connectorWidth: 8.0,
      currentIcon: Icon(Icons.train),





    );
    progressTimelineNotif =
        ProgressTimeline(states: states,

          iconSize: 35.0 ,
          checkedIcon: Icon(Icons.check_circle_outline),





        );
  }
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
        SizedBox(height: 70.0,),
    Expanded(child:Container(
    decoration: BoxDecoration(
    borderRadius:  BorderRadius.only(
    topLeft: Radius.circular(50),
    topRight: Radius.circular(50)
    ),
      color: Colors.white.withOpacity(0.3),
    ),

      child: Row(

        children: [

          SizedBox(height: 40,),

          Padding(padding: EdgeInsets.symmetric(vertical: 0),
            child:      Transform.rotate(angle: - 3.14 / 2, child: progressTimeline)
            ,
          ),
          SizedBox(width: 50.0,),

          Padding(padding: EdgeInsets.only(right: 40),
            child:      Transform.rotate(angle: - 3.14 / 2, child: progressTimelineNotif)
            ,
          ),
          SizedBox(height: 10.0,),
          RaisedButton(
            padding: EdgeInsets.all(10.0),
            child: Text("go to the next stage")  ,
            color: Colors.cyan ,
            onPressed: (){
              progressTimeline.gotoNextStage();
            },
          ),
          RaisedButton(
            padding: EdgeInsets.all(10.0),
            child: Text("Failed stage")  ,
            color: Colors.cyan ,
            onPressed: (){
              progressTimeline.failCurrentStage();
            },
          ),
          RaisedButton(
            padding: EdgeInsets.all(10.0),
            child: Text("Go to previous Stage")  ,
            color: Colors.cyan ,
            onPressed: (){
              progressTimeline.gotoPreviousStage();
            },
          ),


        ],
      ),
    ),flex: 1),

    ]
          ),
    Transform.rotate(angle: 3.14, child: HeaderWidget(100 , true , Icons.login_rounded)) ,

    Footer()]
    )
    ,);
  }
}
