import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/pages/facebook_auth.dart';
import 'package:loginpage/components/my_button.dart';
import 'package:loginpage/components/my_text_field.dart';
import 'package:loginpage/components/square_tile.dart';
import 'package:loginpage/googleauth/google_auth.dart';

class RegisterPage extends StatefulWidget {
  
 final  void Function() onTap;
  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   

  final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();



  // sign user in method
  void signUserUp( BuildContext context ) async {
       if (!_formKey.currentState!.validate()) {
      return; // If validation fails, do not attempt login
    }
       // showDialog(context:context , builder: (context)=>const Center(child: CircularProgressIndicator(),));

   try {  
    if (passwordController.text==confirmPasswordController.text)
    {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text,);
        if(!context.mounted)
        {
          return;
        }
          Navigator.pop(context);
    }
    else {
           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password did not match")));
      
     // showErrorMessage(context, "Password does not match!");
    }
     
   }
  on FirebaseAuthException catch (e) {
      Navigator.pop(context);
  if (e.code == 'weak-password') {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password is too weak')));
  } else if (e.code == 'email-already-in-use') {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email- already in use')));
    
   // print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
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
                  'Let\'s Create an Account for you!' ,
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
               validator:  (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Regular expression for email validation
                  const emailPattern =
                      r'^[^@]+@[^@]+\.[^@]+$';
                  if (!RegExp(emailPattern).hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                //  return null;
                },
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
            
                const SizedBox(height: 10),
            
                // password textfield
                MyTextField(
                  
                 validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                 // return null;
                },
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height:10 ,),
                  MyTextField(
                            validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
              //    return null;
                },
                  controller: confirmPasswordController,
                  hintText: ' Confirm Password',
                  obscureText: true,
                ),
      ],
                ),),
                
            
            
                const SizedBox(height: 25),
            
                // sign in button
                MyButton(
                  onTap: () {  _formKey.currentState!.validate();

                  signUserUp(context);}, text: 'Sign Up',
                  
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
                        imagePath: 'assets/images/google.png', onTap:() { Authentication().signInWithGoogle();
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
                      'Already have an Account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap, 
                      child: const Text(
                        'Login now',
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
