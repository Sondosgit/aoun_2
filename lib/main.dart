
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

//pages:
import 'package:flutter/material.dart';
import 'package:hello_world/home.dart';

import 'package:hello_world/homepage.dart';
import 'package:hello_world/settings.dart';
import 'package:hello_world/checklist.dart';

import 'package:hello_world/openingPages/login.dart';
import 'package:hello_world/openingPages/onbording.dart';
import 'package:hello_world/openingPages/signUp.dart';
import 'package:hello_world/openingPages/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  //  options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

   // runApp(MaterialApp(home: MyApp()));

}


class MyApp extends StatefulWidget{
  
const MyApp ({super.key});

@override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   @override
   void initState(){
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!============');
    } else {
      print('User is signed in!================');
    }
  });

   }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? Welcom() : home(),

      routes: {
        "signUp" : (context) => SignUp(),
       // "HomePage" :  (context) => HomePage(),

        "home" : (context) => home(),

        "logIn" :  (context) => logIn(),
        "checklist" :(context) => Checklist(),
        
        "onbording":(context) => Onbording(),
        "welcome" : (context) => Welcom(),
        
        "settings" : (context) => settings(),
        


      },


      
      
      );}}

