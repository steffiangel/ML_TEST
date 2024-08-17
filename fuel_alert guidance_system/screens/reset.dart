import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testproject/screens/signin_screen.dart';

import '../reusable widgets/reusable.dart';

import 'home_screen.dart';



class resetscreen extends StatefulWidget {
  const resetscreen({super.key});


  @override
  State<resetscreen> createState() => _resetscreenState();
}


class _resetscreenState extends State<resetscreen> {
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //double result=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,appBar: AppBar(backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text("Reset password",
    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,decoration:TextDecoration.underline),
    ),
    ),
    body: Container(width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
         gradient: LinearGradient(colors:[
        hexStringToColor("FFC107"),
        hexStringToColor("000000"),
        hexStringToColor("9E9E9E")],
      begin:Alignment.topCenter,end: Alignment.bottomCenter)),
       child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20, MediaQuery.of(context).size.height *0.2, 20,0),
          child:Column(
            children:<Widget> [
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter mail ID", Icons.person_outline, false, _emailTextController),
            const SizedBox(
                height: 30,
              ),
              resetbutton(context,"Reset Password", (){
                if(_emailTextController.text.isNotEmpty){
                {FirebaseAuth.instance.sendPasswordResetEmail(email: _emailTextController.text).
                then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) =>signinscreen())),);
                }}
                else{
                  Fluttertoast.showToast(
      msg: "Invalid Mail id",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Color.fromARGB(255, 229, 204, 91),
      textColor: Colors.white,
    );
                }
              })
            ],
              ),
    )),
    ),);
  }
Widget resetbutton(BuildContext context,title,Function onTap){
  return Container(
  width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(onPressed: (){onTap();}, child: Text(title, 
      style: const TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 16),
      ),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states){
        if (states.contains(MaterialState.pressed))
        {
          return Colors.black26;
        }
        return Colors.white;
      } ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      ),
    );
}
}
