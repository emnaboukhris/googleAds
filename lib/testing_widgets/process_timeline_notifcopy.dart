import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:googleads/data/station_list.dart';
import 'package:timelines/timelines.dart';


const completeColor =  Color(0xD71F9BD2);
const inProgressColor = Color(0xff42aa5f);
const todoColor = Color(0xD7000000);
class ProcessTimelinePage extends StatefulWidget {
  @override
  _ProcessTimelinePageState createState() => _ProcessTimelinePageState();
}

class _ProcessTimelinePageState extends State<ProcessTimelinePage> {
  late FlutterLocalNotificationsPlugin fltrNotification ;
  @override
  void initState(){
    super.initState() ;
    var androidInitilize = new AndroidInitializationSettings('app_icon') ;
    var iOSinitilize = new IOSInitializationSettings() ;
    var initializationSettings = InitializationSettings(android: androidInitilize,
        iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin() ;
    fltrNotification.initialize(initializationSettings,onSelectNotification: notificationSelected);
  }
  var pressed = false ;
void notify(index) {
    if((pressed)&&(index == _processIndex)){
      showNotification() ;
    }
}

  Future showNotification() async {
    var androidDetails = AndroidNotificationDetails(
        "Channel ID", "Desi programmer",
        importance: Importance.max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
    new NotificationDetails(android: androidDetails, iOS: iSODetails);

    await fltrNotification.show(
        0, "Yeyy ", "the metro is here hurry up !!!",
        generalNotificationDetails, payload: "enjoy");
  }

  Future notificationSelected(String? payload) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("have a nice trip : $payload"),
      ),
    );
  }
  final _processes =Stations_list.stations_linge1 ;
  int _processIndex = 0;
       List pressedNotif = [] ;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(

          child: Padding(
            padding: const EdgeInsets.only( right:220,top: 5,bottom: 80),
            child: Container(
              width: 180,
              child: Timeline.tileBuilder(

                theme: TimelineThemeData(
                  direction: Axis.vertical,
                  connectorTheme: ConnectorThemeData(
                    space: 50.0,
                    thickness: 5.0,
                  ),
                ),

                builder: TimelineTileBuilder.connected(
                  connectionDirection: ConnectionDirection.before,
                  itemExtentBuilder: (_, __) => 80,
                  oppositeContentsBuilder: (context, index) {
                    var child ;
                    if(index<= _processIndex){
                      child =    IconButton(
                          icon: Icon(Icons.notifications_off ,color:Colors.grey),
                          iconSize: 30,
                          onPressed: () {
                            setState(() {
                              })  ;
                          }
                      );
                    }
                    else {
                      if( pressedNotif.contains(index)){
                      child = IconButton(
                          icon: Icon(Icons.notifications_active, color: Colors.red),
                          iconSize: 30,
                          onPressed: () {
                            setState(() {
                              pressed=!pressed ;
                              if (index >= _processIndex) {
                                pressedNotif.remove(index);


                              }
                            });
                          }
                      );
                    }

                    else {
      child = IconButton(
      icon: Icon(Icons.notifications, color: Colors.black),
      iconSize: 30,
      onPressed: () {
      setState(() {
        pressed=!pressed ;

        if (index >= _processIndex) {
      pressedNotif.add(index);
      pressedNotif = pressedNotif.toSet().toList();
      }
      });
      }
      );
      }
                      }


                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: child



                    );
                  },

                  contentsBuilder: (context, index) {
                    return
                      Container(
                        color: Colors.red,
                        child: Text(

                          _processes[index],
                          style: TextStyle(

                            overflow:TextOverflow.visible,
                            fontWeight: FontWeight.bold,
                            color: getColor(index),
                          ),
                        ),
                    );
                  },
                  indicatorBuilder: (_, index) {
                    var color;
                    var child;
                    if (index == _processIndex) {
                      color = inProgressColor;
                      child = Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          strokeWidth: 3.0,
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      );
                    } else if (index < _processIndex) {
                      color = completeColor;
                      child = Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15.0,
                      );
                    } else {
                      color = todoColor;
                    }

                    if (index <= _processIndex) {
                      return Stack(
                        children: [

                          DotIndicator(
                            size: 30.0,
                            color: color,
                            child: child,
                          ),
                        ],
                      );
                    } else {
                      return Stack(
                        children: [
                          CustomPaint(
                            size: Size(15.0, 15.0),
                            painter: _BezierPainter(
                              color: color,
                              drawEnd: index < _processes.length - 1,
                            ),
                          ),
                          OutlinedDotIndicator(
                            borderWidth: 4.0,
                            color: color,
                          ),

                        ],
                      );
                    }
                  },



                  connectorBuilder: (_, index, type) {
                    if (index > 0) {
                      if (index == _processIndex) {
                        final prevColor = getColor(index - 1);
                        final color = getColor(index);
                        List<Color> gradientColors;
                        if (type == ConnectorType.start) {
                          gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
                        } else {
                          gradientColors = [
                            prevColor,
                            Color.lerp(prevColor, color, 0.5)!
                          ];
                        }
                        return DecoratedLineConnector(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                            ),
                          ),
                        );
                      } else {
                        return SolidLineConnector(
                          color: getColor(index),
                        );
                      }
                    } else {
                      return null;
                    }
                  },
                  itemCount: _processes.length,
                ),
              ),
            ),
          )
          ,

        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: FloatingActionButton(
            child: Icon(FontAwesomeIcons.chevronRight),
            onPressed: () {
              setState(() {
                _processIndex = (_processIndex + 1) % _processes.length;
                var test = pressedNotif.contains(_processIndex) ;
if(test){
  showNotification();
  bool result = pressedNotif.remove(_processIndex);


} ;
              });
            },
            backgroundColor: CupertinoColors.inactiveGray,
          ),
        ),
      ),
    );
  }
}

/// hardcoded bezier painter
/// TODO: Bezier curve into package component
class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}

