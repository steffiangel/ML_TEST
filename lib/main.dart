
//import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:testproject/screens/signin_screen.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:awesome_notifications/awesome_notifications.dart';





 void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 /*await AwesomeNotifications().initialize(
    'resource://drawable/notification_icon',
    [
       NotificationChannel(
            channelGroupKey: 'basic_test',
            channelKey: 'basic',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            channelShowBadge: true,
            importance: NotificationImportance.High,
            enableVibration: true,
        ),
    ],
  );*/
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}):super(key: key);
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: /*FutureBuilder(future: FlutterBluetoothSerial.instance.requestEnable(),
      builder: (context,future){
        if(future.connectionState==ConnectionState.waiting){
          return Scaffold(
            body: Container(
              height: double.infinity,
              child: Center(child: Icon(Icons.bluetooth_disabled,size: 200.0,color: Colors.blue,)
              ),
            ),
          );
        }else{
          return signinscreen();
        }
      },)*/
      const signinscreen(),
    );
  }
}


