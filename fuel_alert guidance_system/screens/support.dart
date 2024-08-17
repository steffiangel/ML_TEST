/*
import 'package:flutter/material.dart';
import 'package:testproject/screens/nav.dart';
import 'package:url_launcher/url_launcher.dart';
import '../reusable widgets/reusable.dart';

import 'home_screen.dart';
class support extends StatefulWidget {
  const support({super.key});

  @override
  State<support> createState() => _supportState();
}

class _supportState extends State<support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,appBar: AppBar(backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text("Support Center",
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
                height: 20,
              ),
              navigateButton(context, "Steff", (){_makingPhoneCall2();}),
            const SizedBox(
                height: 40,
              ),
              navigateButton(context, "Helan", (){_makingPhoneCall1();}),
               
            const SizedBox(
                height: 40,
              ),
              userButton(context,"Back",(){Navigator.push(context, MaterialPageRoute(builder: (context) =>navigate1()));}),
             const SizedBox(
                height: 40,
              ),

              
            ],
              ),
    )),
    ),);
  }

   _makingPhoneCall1() async {
    var url = Uri.parse("tel:8590833213");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _makingPhoneCall2() async {
    var url = Uri.parse("tel:9025914373");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
*/