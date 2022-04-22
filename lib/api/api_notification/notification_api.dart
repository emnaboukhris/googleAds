import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
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
  Widget build(BuildContext context) {
    return Container(
        child:Center(
          child: RaisedButton(
            onPressed: showNotification,
            child: Text("notification"),
          ),
        )

    );
  }
}
