/*import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class notiful extends StatefulWidget {
  const notiful({super.key});

  @override
  State<notiful> createState() => _notifulState();
}

class _notifulState extends State<notiful> {
  double fem=1.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Local Notification in Flutter"),
            backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Container( 
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                     ElevatedButton(
                  child: Text('notifiy'),
                  onPressed: () {_showNotification();} 
                ),
                    
              ],
            ),
        ),
        
   /* Container(
  padding: EdgeInsets.fromLTRB(343, 259 * fem, 42 * fem, 290 * fem),
  width: double.infinity,
  height: 564 * fem,
  decoration: BoxDecoration(
    color: Color(0xfff4ece0),
  ),
  child: Text(
    '75%',
    style: (
      'Inter',
      fontSize: 12 * fem,
      fontWeight: FontWeight.w400,
      height: 1.2125 * fem / fem,
      color: Color(0xff000000),
    ),
  ),
)*/

    );
  } 
 void _showNotification() async {
   await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: 1,
        channelKey: 'basic',
        title: 'My Notification Title',
        body: 'This is the body of my notification',
        notificationLayout: NotificationLayout.BigText,
        
    ),
);
}
}
*/