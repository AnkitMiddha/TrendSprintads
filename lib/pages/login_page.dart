

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/components/my_button.dart';
import 'package:loginpage/components/my_text_field.dart';
import 'package:loginpage/components/square_tile.dart';
import 'package:loginpage/googleauth/google_auth.dart';
import 'package:loginpage/pages/facebook_auth.dart';
import 'package:loginpage/pages/forgot_password.dart';

class LoginPage extends StatefulWidget {

 final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
      //bool login = false;

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn(BuildContext
   context ) async {
    if (!_formKey.currentState!.validate()) {
      return; // If validation fails, do not attempt login
    }
    showDialog(context:context , builder: (context)=>const Center(child: CircularProgressIndicator(),),);
   try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text,);
       
   }
     
  on FirebaseAuthException catch (e) {
    Navigator.pop(context);
  if (e.code == 'wrong-password') {
  
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:   Text('Password did not match')));

  } else if (e.code == 'user-not-found') {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:   Text('Email is already in use')));
  }
  Navigator.pop(context);
} 
  }

  void showErrorMessage(BuildContext context,String message )
  {


     showDialog(context: context, builder: (( BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(message,style: const TextStyle(
            color: Colors.white
          ),),
        ),
      );

    })
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
            
                // logo
                const Icon(
                  Icons.lock,
                  color: Colors.black,
                  size: 80,
                ),
            
                const SizedBox(height: 30),
            
                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
            
                const SizedBox(height: 25),
            
                // username textfield
                Form(
                  key: _formKey,
                  
                  child: Column(
                    children: [
                      MyTextField(
             
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                         validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // return null;
                  },
                      ),
                   
                  
                
            
                const SizedBox(height: 10),
            
                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                     validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  //  return null;
                },
                ),
                 ],
                  ),
                ),
            
                const SizedBox(height: 10),
            
                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () async{
  try {
      await sendPasswordResetEmail(emailController.text);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset email sent successfully.'),
          backgroundColor: Colors.green,
        ),
      );
      // Show success message or navigate to login page
    } catch (error) {
      // Show error message to the user
    }
  },                        
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 25),
            
                // sign in button
                MyButton(
                  color: Colors.black,
                  onTap:() {
                    _formKey.currentState!.validate();
                    signUserIn(context);}, text: 'Sign In',
                    
                ),
            
                const SizedBox(height: 30),
            
                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 30),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(
                        imagePath: 'assets/images/google.png', onTap:
                        () { Authentication().signInWithGoogle();
  }),
            
                    const SizedBox(width: 20),
            
                    // apple button
                    SquareTile(
                      imagePath: 'assets/images/facebook.png',
                      onTap: () {signInWithFacebook();},
                    ),
                  ],
                ),
            
                const SizedBox(height: 30),
            
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap, 
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
