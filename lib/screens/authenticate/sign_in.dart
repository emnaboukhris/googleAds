
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleads/Layout/header_widget.dart';
import 'package:googleads/Layout/theme_helper.dart';
import 'package:googleads/screens/google_ads/googleAds.dart';
import 'package:googleads/Layout/layout.dart';
import 'package:googleads/screens/line_choice/metro_choice.dart';
import 'package:googleads/screens/map/Google_Maps.dart';
import 'package:googleads/screens/sign_up/profile_page.dart';

class SignIn extends StatefulWidget {


  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController() ;
  bool isLoggingIn = false ;
   var loading =false ;

  _logIn() async {
    setState((){
      isLoggingIn = true ;
    });
    try {
 await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text , password: _passwordController.text) ;
  } on FirebaseAuthException catch(e) {
      var message= '' ;
switch(e.code){
  case 'invalid-email' :
    message = 'The email you entered was invalid' ;
    break ;
  case 'user-disabled' :
    message = 'The user you tried to log into is disabled' ;

    break ;
  case 'user-not' :
    message = 'he user you tried to log into is not found' ;

    break ;
  case 'wrong-password' :
    message = 'incorrect password' ;

    break ;
}
await showDialog(context: context, builder: (context){
  return AlertDialog(
    title : Text('Log in failed') ,
    content: Text(message),
    actions: [
      TextButton(onPressed:(){
        Navigator.of(context).pop() ;
      }, child : Text('Ok')),
    ],
  );
}) ;
} finally {
      setState(() {
        isLoggingIn = false ;
      });
    }


  }

double _headerHeight = 250 ;
Key _formKey = GlobalKey<FormState>() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child : Column(
          children: [
            Container(
              height: _headerHeight ,
              child : HeaderWidget(_headerHeight , true , Icons.login_rounded),

            ) ,
            SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(20,10,20,10),
                margin: EdgeInsets.fromLTRB(20,10,20,10),
              child : Column(
                children: [
                  Text('Hello' , style: TextStyle(fontSize: 60 , fontWeight: FontWeight.bold)),
                  Text('Sign in into your account ' , style: TextStyle(color: Colors.grey)),

                  SizedBox(height: 30.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 30.0),
                                TextField(decoration: ThemeHelper().textInputDecoration('User Name' ,'Enter your user name' )),
                                SizedBox(height: 30.0),
                                TextField(obscureText: true,
                                    decoration: ThemeHelper().textInputDecoration('Password' ,'Enter your password' )),
                                SizedBox(height: 20.0),
                        Container(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: (){
                              setState(() {
                                _logIn() ;
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>Google_Maps()));

                              });
                            },
                            shape: ThemeHelper().Shape(),
                            padding: EdgeInsets.all(0.0),
                            child:ThemeHelper().inkStyle(context,"Log In ") ,
                          ),
                        ),
                        if(isLoggingIn)
Center(child: CircularProgressIndicator(),) ,
                          SizedBox(height: 10.0),
                        Container(
                          margin: EdgeInsets.fromLTRB(10,20,10,20),
                            child: Text('Dont have an account? Create ?')) ,

                              ],
                            )

                    ),
                ],
            ),
        ),
      ) ,

          ]
    )
    )
    );




  }
}
