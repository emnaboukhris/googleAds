import 'package:flutter/material.dart';
import 'package:googleads/Layout/footer.dart';
import 'package:googleads/Layout/header_widget.dart';
import 'package:hexcolor/hexcolor.dart';


class metro_choice extends StatefulWidget {
  const metro_choice({Key? key}) : super(key: key);

  @override
  State<metro_choice> createState() => _metro_choiceState();
}

class _metro_choiceState extends State<metro_choice> {
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
                  gradient: LinearGradient(begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,colors: [_accentColor,Colors.white,Colors.white]),
                ),
              ),
            ),
            Container( height: 250,
                child : HeaderWidget(250, false,Icons.notifications_active )),
            Positioned(
              top: 250,
              child: Column(
                children: [



                ],
              ),
            ),
            Footer(),
          ],


       )


    );
  }
}
