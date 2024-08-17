/*
import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testproject/reusable%20widgets/reusable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/nav.dart';
//import 'background_service.dart';
class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}
class _BluetoothPageState extends State<BluetoothPage> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  List<BluetoothDevice> _devicesList = [];
  BluetoothDevice? _device = null;
  
  String _receivedData =" ";
  TextEditingController _sendController=TextEditingController();
 
 final FirebaseFirestore _db = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
String height117 = '';
  String width117 = '';
  String length117= '';
  String vol117= '';
  String userEmail = '';
  String kpl117= '';
 late BluetoothConnection connection;
 late String height124=" ",width124=" ",length124=" ",kpl124=" ",volume124=" ";
 


Future<String?> _getData1() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('height');
}
Future<String?> _getData2() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('width');
}
Future<String?> _getData3() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('length');
}
Future<String?> _getData4() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('kpl');
}
Future<String?> _getData5() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('volume');
}

  @override
  void initState() {
    super.initState();
   
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });
    _getDevices();

     _getData1().then((value) {
    setState(() {
      height124= value ?? "";
    });
  });
    
    _getData2().then((value) {
    setState(() {
      width124= value ?? "";
    });
  });

  _getData3().then((value) {
    setState(() {
      length124= value ?? "";
    });
  });

  _getData4().then((value) {
    setState(() {
      kpl124= value ?? "";
    });
  });

  _getData5().then((value) {
    setState(() {
      volume124= value ?? "";
    });
  });

    if (_auth.currentUser != null) {
      
      String uid = _auth.currentUser!.uid;
      DocumentReference userRef = _db.collection('users').doc(uid);
      userRef.get().then((userSnapshot) {
        if (userSnapshot.exists) {
          setState(() {
            length117= userSnapshot['length'] ?? '';
           width117 = userSnapshot['width']?.toString() ?? '';
            height117 = userSnapshot['height']?.toString() ?? '';
            vol117= userSnapshot['volume']?.toString() ?? '';
            kpl117= userSnapshot['kpl']?.toString() ?? '';
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
  void _getDevices() {
    FlutterBluetoothSerial.instance
        .getBondedDevices()
        .then((List<BluetoothDevice> bondedDevices) {
      setState(() {
        _devicesList = bondedDevices;
      });
    });
  }
  void _connect() async {
    if (_device == null) {
      Fluttertoast.showToast(
      msg: "connect to device",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
    );
      return;
    }
    try {
      connection = await BluetoothConnection.toAddress(_device?.address);
       SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('bluetooth_connection', _connect.toString());
  
      Fluttertoast.showToast(
      msg: "Connected to the device",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
       
      
    );

    _receiveData();
    
    
    } catch (e) {
      Fluttertoast.showToast(
      msg: "Error connecting to device: $e",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
    );
    }
   
  }


  void _disconnect() async {
  if (connection != null) {
    connection.dispose();
    connection.close();
    _showSnackbar('Disconnected from the device');
  }
}
 sendData(String data) async {
    if (connection.isConnected) {
      connection.output.add(Uint8List.fromList(data.codeUnits));
      //connection.output.add(utf8.encode(data + "\r\n"));
      await connection.output.allSent;
      _showSnackbar('Sent data: $data');
      //startBackgroundTask(connection);
    } else {
      _showSnackbar('Not connected to device');
    }
  }
void _receiveData() {
  connection.input!.listen((data) {
    String receivedData = utf8.decode(data).trim(); // convert the incoming data to a String
    setState(() {
      _receivedData = receivedData;
      print(receivedData);
      _showSnackbar('Received data: $receivedData');
      
    });
    
  });
}




dfg()async{
  var numbers = [height117, width117, length117, vol117,kpl117];
                    for (int i = 0; i < numbers.length; i++) {
                        await Future.delayed(Duration(seconds: 2));
                        sendData(numbers[i]);
    }

}
  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
    appBar: AppBar(backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text("Bluetooth",
    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,decoration:TextDecoration.underline),
    ),
    ),
      body: Container(width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
         gradient: LinearGradient(colors:[
        hexStringToColor("FFC107"),
        
        hexStringToColor("9E9E9E")],
      begin:Alignment.topCenter,end: Alignment.bottomCenter)),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
            Text('Bluetooth State: $_bluetoothState'),
            SizedBox(height: 16.0),
            Text('Devices:'),
            Expanded(
              child: ListView.builder(
                itemCount: _devicesList.length,
                itemBuilder: (context, index) {
                  final device = _devicesList[index];
                  return ListTile(
                    title: Text(device.name.toString()),
                    subtitle: Text(device.address),
                    onTap: () {
                      setState(() {
                        _device = device;
                      });
                    },
                    selected: _device == device,
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  child: Text('Connect'),
                  onPressed: _connect,
                ),
                ElevatedButton(
                  child: Text('Disconnect'),
                  onPressed: _disconnect,
                ),
                
              ],
            ),
            
            const SizedBox(height: 25),
            SizedBox(height: 16.0),
           /* TextField(
              controller: _sendController,
              decoration: InputDecoration(
                labelText: 'Data to send',
                border: OutlineInputBorder(),
              ),
            ),*/
         
               Center(
  child: ElevatedButton(
    child: Text('check my distance'),
    onPressed: () async { 
      await dfg(); //_receiveData();
    },
  ),),


                
               const SizedBox(height: 25),
               Center(
           child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
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
child: const Text('Back')),),
           // Text('Received data: $_receivedData'),
            ],
            ),
            ),
          
        );
      
    
  }
}

*/