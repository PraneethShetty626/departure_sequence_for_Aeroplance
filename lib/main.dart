import 'package:crimdetect/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main(List<String> args)async {
    const firebaseConfig = FirebaseOptions(
                  apiKey: "AIzaSyAGtaNzEiR1aoV7ce-_ma3zHs0wn0uDIFw",
                  authDomain: "crimedetect-f51eb.firebaseapp.com",
                  databaseURL: "https://crimedetect-f51eb-default-rtdb.firebaseio.com",
                  projectId: "crimedetect-f51eb",
                  storageBucket: "crimedetect-f51eb.appspot.com",
                  messagingSenderId: "1032149594475",
                  appId: "1:1032149594475:web:fc07d4c1406cec83a59c2e"
    );
    await Firebase.initializeApp(options:firebaseConfig);
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());  
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
        );
  }
}