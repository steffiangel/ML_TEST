

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../reusable widgets/reusable.dart';
import 'nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _vnameTextController = TextEditingController();
  final TextEditingController _vheightTextController = TextEditingController();
  final TextEditingController _vwidthTextController = TextEditingController();
  final TextEditingController _vlengthTextController = TextEditingController();
  final TextEditingController _fuelTypeTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();
  //bool? check1 = false, check2 = false, check3 = false;
 
  late String kname="Enter your Name",kheight=" Enter height",kkpl=" Enter KPL",kvolume,kwidth="Enter width",klength="Enter length";
    final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  double res = 0.0; String result = " "; 

Future<void> _saveData(String data1, String data2,String data3, String data4, String data5) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('height127', data1);
  await prefs.setString('width127', data2);
  await prefs.setString('length127', data3);
  await prefs.setString('name127', data4);
  await prefs.setString('username127', data5);
}

Future<String?> _getData() async {
  final prefs = await SharedPreferences.getInstance();
  final data = prefs.getString('my_data_key');
  return data;
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,appBar: AppBar(backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text("Vechilce info",
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
              reusableTextField(kname, Icons.emoji_emotions_outlined, false, _usernameTextController),
            const SizedBox(
                height: 30,
              ),
                  reusableTextField1(kheight, Icons.arrow_upward_sharp, false, _vheightTextController),
            const SizedBox(
                height: 20,
              ),
              reusableTextField1(kwidth, Icons.architecture_outlined , false, _vwidthTextController),
              const SizedBox(
                height: 30,
              ),
              reusableTextField1(klength, Icons.arrow_right_alt_sharp, false, _vlengthTextController),
            const SizedBox(
                height: 20,
              ),
              reusableTextField1(kkpl, Icons.emoji_emotions_outlined, false, _vnameTextController),
              const SizedBox(
                height: 20,
              ),
              TextButton(
             onPressed: () {
               setState(() {
                  res = (double.parse(_vlengthTextController.text) *
                     double.parse(_vwidthTextController.text)*double.parse(_vheightTextController.text))/231;
                  double b = double.parse(res.toStringAsFixed(3)); 
                  result=res.toString();
               });
              },
              child: Text('Calculate'),
            ),
            ElevatedButton(child: const Text("Finished"),
        onPressed:(){if(
              _vheightTextController.text.isNotEmpty && _vwidthTextController.text.isNotEmpty && _vlengthTextController.text.isNotEmpty && 
              _vnameTextController.text.isNotEmpty)
             {
              addUser();
              print("Created new account in real time");
              
              _saveData(_vheightTextController.text, _vwidthTextController.text,_vlengthTextController.text, _vnameTextController.text, _usernameTextController.text);}
          Navigator.push(context,
          MaterialPageRoute(builder: (context) =>const navigate1()));
        }),
            
            
             //Text("THE VOLUME IS:${result.toString()}"),
             const SizedBox(
                height: 20,
              ),

              /*ElevatedButton(onPressed: (){
               update(); 
               Navigator.push(context, MaterialPageRoute(builder: (context) =>navigate1()));
              },child: Text("Save"),),*/
              
              
              //child:
              ],
      ),),),)
    );
  }
  void addUser() async {
  User? user = _auth.currentUser;
  if (user != null) {
    String uid = user.uid;
    await storeUserInfo(uid, {"height":_vheightTextController.text,'kpl':_vnameTextController.text,"width":_vwidthTextController.text,"length":_vlengthTextController.text,'volume':result,'Name':_usernameTextController.text});
    
    final userStream = getUserInfo(uid);
    userStream.listen((userInfo) {
      print('User info: $userInfo');
    });
  }
}

// Function to store user information
Future<void> storeUserInfo(String userId, Map<String, dynamic> userInfo) async {
  // Reference to the document for the user
  final reference = FirebaseFirestore.instance.collection('users').doc(userId);

  // Store the user information in the document
  await reference.set(userInfo);
}
// Function to retrieve user information
Stream<Map<String, dynamic>> getUserInfo(String userId) {
  // Reference to the document for the user
  final reference = FirebaseFirestore.instance.collection('users').doc(userId);

  // Query to retrieve the user information from the document
  final query = reference.snapshots().map((snapshot) => snapshot.data() ?? {});

  return query;
}

/*Future<void>saveinfo()async{
  final SharedPreferences pref=await SharedPreferences.getInstance();
  pref.setString('name', _usernameTextController.text);
  pref.setString('height', _vheightTextController.text);
  pref.setString('kpl', _vnameTextController.text);
  pref.setString('volume', result);
  if(_vheightTextController.text.isNotEmpty && _vwidthTextController.text.isNotEmpty && _vlengthTextController.text.isNotEmpty && 
              _vnameTextController.text.isNotEmpty){
                kname=_usernameTextController.text;
                kheight=_vheightTextController.text;
                kkpl=_vnameTextController.text;
                kvolume=result;
              }
  else{
  Fluttertoast.showToast(
      msg: "No changes",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
    );
  } //if(_usernameTextController.text==" " &&_vheightTextController.text==" "&&)
}*/

Future<void> update() async {
  User? user = _auth.currentUser;
  if (user != null) {
    String uid = user.uid;
    DocumentReference userRef = _db.collection('users').doc(uid);
    userRef.update({'Name': _usernameTextController.text,'height': _vheightTextController.text,'kpl': _vnameTextController,"volume":result})
.then((value) {Fluttertoast.showToast(
      msg: "Update Suceeded",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
    );})
.catchError((error) {
  String errorMessage;
  if (error.code == 'permission-denied') {
    errorMessage = 'You do not have permission to update this document.';
  } else {
    errorMessage = 'An error occurred while updating the document.';
  }
  Fluttertoast.showToast(
    msg: errorMessage,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: Color.fromARGB(255, 229, 204, 91),
    textColor: Colors.white,
  );
});}
   else {
    Fluttertoast.showToast(
      msg: "Update failed",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
    );
  }
}

}

