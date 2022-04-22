import 'package:flutter/material.dart';
import 'package:googleads/Layout/footer.dart';
import 'package:googleads/Layout/header_widget.dart';
import 'package:hexcolor/hexcolor.dart';


class Layout_base extends StatefulWidget {
  const Layout_base({Key? key}) : super(key: key);

  @override
  State<Layout_base> createState() => _Layout_baseState();
}

class _Layout_baseState extends State<Layout_base> {
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
