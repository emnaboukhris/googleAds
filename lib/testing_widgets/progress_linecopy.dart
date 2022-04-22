

import 'package:flutter/material.dart';
import 'package:googleads/testing_widgets/header_widget_Fade.dart';
import 'package:progress_timeline/progress_timeline.dart';


class Progress_Line extends StatefulWidget {
  const Progress_Line({Key? key}) : super(key: key);

  @override
  State<Progress_Line> createState() => _Progress_LineState();
}

class _Progress_LineState extends State<Progress_Line> {
  late ProgressTimeline progressTimeline ;
  static const IconData train = IconData(0xe675, fontFamily: 'MaterialIcons');

  List<SingleState> states =[
    SingleState(stateTitle: 'passage') ,
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

    progressTimeline = ProgressTimeline(states: states,
    iconSize: 35.0 ,
    checkedIcon: Icon(Icons.check_circle_outline),
    connectorColor: Colors.black,
      connectorWidth: 8.0,
      currentIcon: Icon(Icons.train),




    );
  }
  @override
  Widget build(BuildContext context) {
    double _headerHeight = 250 ;

    return Container(

      child: Center(

        child: Column(

          children: [
            Container(
              child : HeaderWidget(_headerHeight , true , Icons.login_rounded),

            ) ,
Container(child: progressTimeline,width: 1000,) ,




          ],
        ),
        
      ),

    );
  }
}
