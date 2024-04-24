import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/widgets/policy.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});
  void signUserOut() {
    GoogleSignIn().signOut();
    FacebookAuth.instance.logOut();
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
          padding: const EdgeInsets.only(top: 15),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 42, 55, 83),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text('Privacy Policy',
                    style: GoogleFonts.lato(
                        fontSize: 22,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text(Policy.content,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
