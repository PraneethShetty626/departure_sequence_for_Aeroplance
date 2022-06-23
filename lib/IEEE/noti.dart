// import 'package:crimdetect/map.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class Notify extends StatefulWidget {
//   const Notify({Key? key}) : super(key: key);

//   @override
//   State<Notify> createState() => _NotifyState();
// }

// class _NotifyState extends State<Notify> {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   AndroidInitializationSettings initializationSettingsAndroid =
//       const AndroidInitializationSettings('@mipmap/ic_launcher');

//   void intiNot() async {
//     final InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onSelectNotification:(mv)=>selectNotification(mv!)
//     );
//   }

//   /////
//   void selectNotification(String payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//     await Navigator.push(
//       context,
//       MaterialPageRoute<void>(
//           builder: (context) => MStram()),
//     );
//   }

//   void display() async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails('your channel id', 'your channel name',
//             channelDescription: 'your channel description',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticker');
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//         0, 'plain title', 'plain body', platformChannelSpecifics,
//         payload: 'item x');
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     intiNot();

//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(floatingActionButton: FloatingActionButton(onPressed: (){
//       display();
//     }),);
//   }
// }



// // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project

