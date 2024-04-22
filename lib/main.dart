import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/firebase_options.dart';
import 'package:loginpage/pages/splash_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
   theme: ThemeData.light(),
    debugShowCheckedModeBanner: false,
    
    home:
    const SplashScreen(),
  )
  );
}

