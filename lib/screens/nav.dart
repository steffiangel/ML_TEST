import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testproject/reusable%20widgets/blue1.dart';
import 'package:testproject/reusable%20widgets/noti.dart';

import 'package:testproject/screens/profile.dart';
import 'package:testproject/screens/signin_screen.dart';
import 'package:testproject/screens/support.dart';
//import 'package:url_launcher/url_launcher.dart';
import '../reusable widgets/reusable.dart';

import 'home_screen.dart';

class navigate1 extends StatefulWidget {
  const navigate1({super.key});

  @override
  State<navigate1> createState() => _navigate1State();
}

class _navigate1State extends State<navigate1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,appBar: AppBar(backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text("Homescreen",
    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,decoration:TextDecoration.underline),
    ),
    ),
    body: Container(width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
         gradient: LinearGradient(colors:[
        hexStringToColor("FFC107"),
       // hexStringToColor("000000"),
        hexStringToColor("9E9E9E")],
      begin:Alignment.topCenter,end: Alignment.bottomCenter)),
       child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20, MediaQuery.of(context).size.height *0.2, 20,0),
          child:Column(
            children:<Widget> [
              logoWidget("assets/images/ea1.png"),
              const SizedBox(
                height: 40,
              ),
              //navigateButton(context, "My fuel Capacity",(){Navigator.push(context, MaterialPageRoute(builder: (context) =>BluetoothPage()));}),
              const SizedBox(
                height: 40,
              ),
              /*navigateButton(context, "noti",(){Navigator.push(context, MaterialPageRoute(builder: (context) =>notiful()));}),
            const SizedBox(
                height: 40,
              ),*/
              //navigateButton(context, "Gmap",(){_launchURL();}),
            const SizedBox(
                height: 40,
              ),
              navigateButton(context, "User Profile",(){Navigator.push(context, MaterialPageRoute(builder: (context) =>profile()));}),
            const SizedBox(
                height: 40,
              ),
              //navigateButton(context, "Support Center",(){Navigator.push(context, MaterialPageRoute(builder: (context) =>support()));}),
              const SizedBox(
                height: 40,
              ),
              
             /*navigateButton(context, "Change Vechicle info",(){Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen()));}), 
             const SizedBox(
                height: 40,
              ),*/

              userButton(context,"Logout",(){
        /*  Map<String,dynamic> data={"height":_vheightTextController.text,'kpl':_vnameTextController.text,'volume':result};
        Firebase.instance.collection('users').add(data);*/
        FirebaseAuth.instance.signOut().then((value) {
         print("Signed out");
          Navigator.push(context,
          MaterialPageRoute(builder: (context) =>const signinscreen()));
        });

          
         }),
            ],
              ),
    )),
    ),);
  }
}
/*
_launchURL() async {
  const url = 'https://maps.app.goo.gl/jPTP8yAQFgPxJd6N9';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}*/