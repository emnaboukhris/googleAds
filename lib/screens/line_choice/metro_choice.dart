import 'package:flutter/material.dart';
import 'package:googleads/Layout/Frostedglass.dart';
import 'package:googleads/Layout/footer.dart';
import 'package:googleads/Layout/header_widget.dart';
import 'package:googleads/Layout/theme_helper.dart';
import 'package:googleads/data/station_list.dart';
import 'package:googleads/screens/Metro_lines/polyline_wrapper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';


class Metro_choice extends StatefulWidget {
  const Metro_choice({Key? key}) : super(key: key);

  @override
  State<Metro_choice> createState() => _Metro_choiceState();

}
class _Metro_choiceState extends State<Metro_choice> {
  @override
  Key _formKey = GlobalKey<FormState>() ;
late  String depart ;
  late  String end ;
  List metros =[] ;

    bool visibility = false ;
  find_stations(depart,destination){
    metros =[] ;
    Stations_list.metro_list.forEach((lignes) =>
    {
      if((lignes.stations.contains(depart))&&(lignes.stations.contains(destination))) {

        metros.add(lignes)

      }

    }
    );

   return metros ;
  }

  Widget build(BuildContext context) {
    List<String> options= Stations_list.All_Stations ;
    Color _primaryColor = HexColor('#80FF72');
    Color _accentColor = HexColor('#7EE8FA') ;
    print(options);
    return Scaffold(
resizeToAvoidBottomInset: false,
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
            Container( height: 150,
                child : HeaderWidget(150, false,Icons.train_outlined )),

            Form(

              key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                    Align(child: Text("where do you want to go ? ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)))
                    , Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Autocomplete<String>(
                        optionsBuilder:  (TextEditingValue textEditingValue) {
                         return options.where((String option) => option.toLowerCase().startsWith(textEditingValue.text.toLowerCase())).toList();
                        },
                        fieldViewBuilder: (
                        BuildContext context,
                        TextEditingController departController,
                        FocusNode fieldFocusNode,
                        VoidCallback onFieldSubmitted
                        ) {
                      return TextField(
                        controller: departController,
                        focusNode: fieldFocusNode,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              labelText: 'Depart Station'
                          )                    );
                           },


                      optionsViewBuilder: (
                          BuildContext context,
                          AutocompleteOnSelected<String> onSelected,
                          Iterable<String> options

                          ) {
                        return Align(
                          alignment: Alignment.topLeft,

                          child: Material(
                            child: Container(
                              width: 350,
                              child: ListView.builder(
                                padding: EdgeInsets.all(0.0),
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final String option = options.elementAt(index);

                                  return GestureDetector(
                                    onTap: () {
                                      onSelected(option);
                                      depart=option ;

                                    },
                                    child: ListTile(
                                      title: Text(option),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },



                    ),

                    )
,Padding(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: Autocomplete<String>(

                        optionsBuilder:  (TextEditingValue textEditingValue) {
                          return options.where((String option) => option.toLowerCase().startsWith(textEditingValue.text.toLowerCase())).toList();

                        },fieldViewBuilder: (
                          BuildContext context,
                          TextEditingController finalController,
                          FocusNode fieldFocusNode,
                          VoidCallback onFieldSubmitted
                          ) {
                        return TextField(
                            controller: finalController,
                            focusNode: fieldFocusNode,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                labelText: 'Final Station'
                            )                    );
                      },


                        optionsViewBuilder: (
                            BuildContext context,
                            AutocompleteOnSelected<String> onSelected,
                            Iterable<String> options

                            ) {
                          return Align(
                            alignment: Alignment.topLeft,

                            child: Material(
                              child: Container(
                                width: 350,
                                child: ListView.builder(
                                  padding: EdgeInsets.all(0.0),
                                  itemCount: options.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final String option = options.elementAt(index);

                                    return GestureDetector(
                                      onTap: () {

                                        onSelected(option);
                                        end=option ;
                                      },
                                      child: ListTile(
                                        title: Text(option),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },



                      ),
                    )
,
                    SizedBox(height: 30,),
    Container(
    height: 50.0,
    child: RaisedButton(
    onPressed: (){
    setState(() {
    visibility=true ;
    metros = find_stations( depart, end);
    print(end);

    });
    },
      shape: ThemeHelper().Shape(),
    padding: EdgeInsets.all(0.0),
    child:ThemeHelper().inkStyle(context,"Submit") ,
    ),
    ),














    Visibility( visible:visibility ,child:


        Column(

          children: [
            SizedBox(height: 30,),

            Container(
              height: 130,
              child:  ListView.builder(

                shrinkWrap: true,

                scrollDirection: Axis.horizontal,
    itemCount: metros.length,
    itemBuilder: (BuildContext context, int index) {return    Column(
      children: [

        GestureDetector(
          child: FrostedGlassBox(      // theWidth is the width of the frostedglass
            theWidth: 130.0,
            // theHeight is the height of the frostedglass
            theHeight: 130.0,
            // theChild is the child of the frostedglass
            theChild:  Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    child:Lottie.asset('assets/train_background.json',
                      height:80,
                      width: 80,
                    )),
                Text("Metro " + metros[index].metro_num,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)
              ],
            ),


          ),
          onTap:(){


            Navigator.push(context, MaterialPageRoute(builder: (context) => Polyline_wrapper(metros[index])));
            setState(() {
              visibility=false;
            });
          }
        ),
      ],
    );  }

              ),
            )],
        ))
                  ],
                ),
              ),

            Footer(),
          ],


       )


    );
  }
}
