import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/components/bottom_navigationbar.dart';
import 'package:loginpage/pages/login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  StreamBuilder<User?> (
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot)
        {
          if(snapshot.hasData)
          { 
            return const BottomBar();
          }
          else {
            return  const LoginRegisterPage();
          }
        },
      ),
      
    
    
    );
}
}
