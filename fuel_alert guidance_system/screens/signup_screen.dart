
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../reusable widgets/reusable.dart';

import 'home_screen.dart';



class SignUpscreen extends StatefulWidget {
  const SignUpscreen({super.key});


  @override
  State<SignUpscreen> createState() => _SignUpscreenState();
}


class _SignUpscreenState extends State<SignUpscreen> {
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _confirmpasswordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //double result=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,appBar: AppBar(backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text("Sign up",
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
              reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
            const SizedBox(
                height: 20,
              ),
              reusableTextField("confirm Password", Icons.emoji_emotions_outlined, true,_confirmpasswordTextController),
            const SizedBox(
                height: 30,
              ),
             // TextButton(
             // onPressed: () {
              //  setState(() {
               //   result = (double.parse(_vlengthTextController.text) *
                //      double.parse(_vwidthTextController.text)*double.parse(_vheightTextController.text))/231;
               // });
             // },
            //  child: Text('Calculate'),
           // ),
            signInSignUpButton(context, false, () {
  if (_emailTextController.text.isNotEmpty &&
      _passwordTextController.text.isNotEmpty &&
      _confirmpasswordTextController.text.isNotEmpty) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text)
        .then((value) {
      print("Created new account");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }).catchError((error) {
      if (error.code == 'weak-password') {
        Fluttertoast.showToast(
      msg: "weak password",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Color.fromARGB(255, 229, 204, 91),
      textColor: Colors.white,
    );
      } else {
        Fluttertoast.showToast(
      msg: error.message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Color.fromARGB(255, 229, 204, 91),
      textColor: Colors.white,
    );
        print('Error creating user account: ${error.message}');
      }
    });
  }
}),

              
            
            ],
              ),
    )),
    ),);
  }
}
