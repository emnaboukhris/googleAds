import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timelines/timelines.dart';


class myTimeLine extends StatefulWidget {
  const myTimeLine({Key? key}) : super(key: key);

  @override
  State<myTimeLine> createState() => _myTimeLineState();
}
const kTileHeight = 50.0;

const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);
const todoColor = Color(0xffd1d2d7);
class _myTimeLineState extends State<myTimeLine> {

  final _processes = [
    'Prospect',
    'Tour',
    'Offer',
    'Contract',
    'Settled',
    'Settled',
    'Settled',

    'Settled',
    'Settled',
    'Settled',


  ];
  int _processIndex = 2;

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
    return Scaffold(
      body: Container(
        child :
Row(
  children: [
Timeline.tileBuilder(
  theme: TimelineThemeData(
      direction: Axis.vertical,
      connectorTheme: ConnectorThemeData(
        space: 30.0,
        thickness: 5.0,
      ),
  ),

  builder: TimelineTileBuilder.connected(
      connectionDirection: ConnectionDirection.before,
      itemExtentBuilder: (_, __) =>
      MediaQuery.of(context).size.width / _processes.length*2,
      oppositeContentsBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Icon(Icons.notifications),
        );
      },

      contentsBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            _processes[index],
            style: TextStyle(
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
  ),),
      Text("1"),
      Text("2")
  ],
)

      ),
    );
  }
}
