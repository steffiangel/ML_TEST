

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testproject/screens/nav.dart';
import 'package:testproject/screens/reset.dart';
import 'package:testproject/screens/signup_screen.dart';


import '../reusable widgets/reusable.dart';




// ignore: camel_case_types
class signinscreen extends StatefulWidget {
  const signinscreen({super.key});

  @override
  State<signinscreen> createState() => _signinscreenState();
}


// ignore: camel_case_types
class _signinscreenState extends State<signinscreen> {
   TextEditingController _passwordTextController=TextEditingController();
   TextEditingController _emailTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
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
            20, MediaQuery.of(context).size.height *0, 20,0),
          child:Column(
            children:<Widget> [
              logoWidget("assets/images/ea1.png"),
              const SizedBox(
                height: 30,
              ),
              reusableTextField("Enter Username", Icons.person_outline, false, _emailTextController),
           const  SizedBox(
                height: 30,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
            const SizedBox(
                height: 5,
              ),
              forgetPassword(context),
            signInSignUpButton(context, true, () {
  FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailTextController.text,
    password: _passwordTextController.text,
  ).then((value) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => navigate1()));
  }).catchError((error) {
    String errorMessage = error.code == 'user-not-found' ? 'User not found' : 'Invalid email or password';
    Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Color.fromARGB(255, 229, 204, 91),
      textColor: Colors.white,
    );
  });//
}),
            signUpOption()
            ],
             
              ),
                ),
                ),
        ),
        );
       
       
  }
  Row signUpOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [const Text("Don't have an account?",style: TextStyle(color:Colors.white70)),
    GestureDetector(onTap: () {
      Navigator.push(context,
         MaterialPageRoute(builder: (context) => SignUpscreen()));
    },
    child: const Text(
      " Sign Up",
      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
    ),
    )
    ],
    );
  }
 Widget forgetPassword(BuildContext context){
  return Container(width: MediaQuery.of(context).size.width,
  height: 35,
  alignment: Alignment.bottomRight,
  child:TextButton(child:Text("Forgot Password?",
  style:TextStyle(color: Colors.white70),
  textAlign: TextAlign.right,),
  onPressed: ()=>
Navigator.push(context, MaterialPageRoute(builder: (context) =>resetscreen())),
  ),);
 }
}