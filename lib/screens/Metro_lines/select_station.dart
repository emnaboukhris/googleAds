import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:direct_select/direct_select.dart';
import 'package:hexcolor/hexcolor.dart';



class Select_Metro extends StatefulWidget {
  const Select_Metro({Key? key}) : super(key: key);

  @override
  State<Select_Metro> createState() => _Select_MetroState();
}

class _Select_MetroState extends State<Select_Metro> {
  InputDecoration textInputDecoration([String lableText = "", String hintText = ""]) {
    return InputDecoration(
      labelText : lableText ,
      hintText : hintText,
      fillColor: Colors.white.withOpacity(0.4) ,
      filled : true ,
      contentPadding : EdgeInsets.fromLTRB(40,10,20,10) ,
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0),borderSide:BorderSide(color : Colors.black, width: 3.0) ),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0),borderSide:BorderSide(color : Colors.green,width: 3.0) ),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0),borderSide:BorderSide(color : Colors.red , width: 5.0) ),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0),borderSide:BorderSide(color : Colors.red) ),

    );
  }
  final elements1 = [
    " ariana ",
    " fell",
    " passage",
    " jeune",
    " cite ",
    " 10 december ",
    "mohamed il 5",
    "barchalouna"  ,
    " jeune",
    " cite ",
    " 10 december ",
    "mohamed il 5",
    "barchalouna"  ,




  ];





  int selectedIndex1 = 0,
      selectedIndex2 = 0,
      selectedIndex3 = 0,
      selectedIndex4 = 0;

  List<Widget> _buildItems1() {
    return elements1
        .map((val) => MySelectionItem(
      title: val,

    ))
        .toList();
  }

  Color _primaryColor = HexColor('#80FF72');
  Color _accentColor = HexColor('#7EE8FA') ;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child:
          Padding(
          padding: EdgeInsets.only(right: 15.0,left:15.0),
          child:
      Column(

      children: [
        Container(
          width: 200,
          child:TextField(decoration: textInputDecoration('Station' ,'Enter your Station' ),), ) ,

        SizedBox(height:25),





Container(


          )
    ]
    ))
    ) ;


  }
}

//You can use any Widget
class MySelectionItem extends StatelessWidget {
  final  String title;
  final bool isForList;

  const MySelectionItem({  Key? key, required this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: isForList ? Padding(
        child: _buildItem(context),
        padding: EdgeInsets.all(5.0),
      )
          : Card(
        child: Stack(
          children: <Widget>[
            _buildItem(context),
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.arrow_drop_down),
            )
          ],
        ),
      ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
height: 50,
      alignment: Alignment.center,
      color: Color(0xD71F9BD2),
      child: Text(title),
    );
  }
}
