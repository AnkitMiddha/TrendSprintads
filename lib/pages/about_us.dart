import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/widgets/about.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});
    void signUserOut() {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 42, 55, 83),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text("TrendSprint",
            style: GoogleFonts.lato(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 42, 55, 83),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),

          child: Column(
            children: [
               Text('About TrendSprint',
                    style: GoogleFonts.lato(
                        fontSize: 22,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10,),
                        Image.asset('assets/images/about.png'),
                        const SizedBox(height: 10,),
                         Text(About.content,
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      color: Colors.white,
                    )),

            ],
          ),
        ),
      ) ,
    );
  }
}