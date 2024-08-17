import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../reusable widgets/reusable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'nav.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
 // final CollectionReference _products=FirebaseFirestore.instance.collection("users");
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
 String hel123=" ";

Future<String?> _getData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('username127');
}
//final TextEditingController _emailController = TextEditingController(text: _auth.currentUser?.email);
String mail123 = '';
  String name123 = '';
  String email123 = '';
  String password123 = '';
  String userEmail = '';
  double num = 0.0;
  
  @override
  void initState() {
    super.initState();
    _getData().then((value) {
    setState(() {
      hel123 = value ?? "";
    });
  });

    
    if (_auth.currentUser != null) {
      
      String uid = _auth.currentUser!.uid;
      DocumentReference userRef = _db.collection('users').doc(uid);
      userRef.get().then((userSnapshot) {
        if (userSnapshot.exists) {
          setState(() {
            name123 = userSnapshot['Name'] ?? '';
            email123 = userSnapshot['volume']?.toString() ?? '';
            password123 = userSnapshot['height']?.toString() ?? '';
          });
        }
      });
      setState(() {
        userEmail = _auth.currentUser!.email!;
      });
    } else {
      Fluttertoast.showToast(
        msg: "User is not logged in",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.grey[600],
        textColor: Colors.white,
      );
    }
  }



  TextEditingController _mail1TextController=TextEditingController();
  
  TextEditingController _username1TextController = TextEditingController();
  

  @override
  Widget build(BuildContext context)
  {
    TextEditingController _emailTextController;
    return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: AppBar(backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text("User profile",
    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,decoration:TextDecoration.underline),
    ),
    ),
    body: Container(width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
         gradient: LinearGradient(colors:[
        hexStringToColor("FFC107"),
        //hexStringToColor("000000"),
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
                height: 30,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(  " NAME:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
               reusableTextField(name123, Icons.lock_outline, true, _username1TextController),
              const  SizedBox(
                height: 30,
              ),
               const Text(  " MAIL ID:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              reusableTextField(userEmail, Icons.lock_outline, true, _mail1TextController),
              const SizedBox(
                height: 5,
              ),
              
            
              ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                 return Colors.black26.withOpacity(0.8);}
      return Color.fromARGB(255, 189, 180, 136).withOpacity(0.9);}),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  ),
  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>navigate1()));
  },
child: const Text('Back')),
          
            ],
              ),
    )
    ),
    ),
    );
  }

  
}