/*import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:fluttertoast/fluttertoast.dart';

void startBackgroundTask(BluetoothConnection connection) async {
  // create a receive port to receive messages from the isolate
  ReceivePort receivePort = ReceivePort();

  // spawn a new isolate and pass the receive port and the BluetoothConnection object to it
  Isolate.spawn(runBackgroundTask, {'receivePort': receivePort.sendPort, 'connection': connection});

  // listen for messages from the isolate
  receivePort.listen((message) {
    if (message is String) {
      Fluttertoast.showToast(
      msg: "distance is : $message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
    );
      // show a toast message with the received data
      // use a plugin like fluttertoast to display the message
    }
  });
}

void runBackgroundTask(Map<String, dynamic> message) async {
  SendPort sendPort = message['receivePort'];
  BluetoothConnection connection = message['connection'];

  connection.input?.listen((data) {
    // send the data to the main isolate
    sendPort.send(data);
  });
}
*/