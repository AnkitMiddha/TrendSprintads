import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/widgets/extras_card.dart';

class Mix extends StatelessWidget {
  const Mix({super.key});
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
        title: Text("TrendSprint Ads",
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
      alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 42, 55, 83),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Mix",
                style: GoogleFonts.lato(fontSize: 22, color: Colors.yellow,fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Social Media Ads",
                style: GoogleFonts.lato(fontSize: 22, color: Colors.yellow,fontWeight: FontWeight.bold)
                ),
              const SizedBox(
                height: 12,
              ),
              const ExtrasCard(
                  headline: 'Social Media Ads with 10 Thousand Engagement',
                  content: '',
                  costs: '₹5500'),
              const ExtrasCard(
                  headline: 'Social Media Ads with 20 Thousand Engagement',
                  content: '',
                  costs: '₹10000'),
              const ExtrasCard(
                  headline: 'Social Media Ads with 1 Lac Engagement',
                  content: '',
                  costs: '₹45000'),
              const ExtrasCard(
                  headline: 'Social Media Ads with 5 lac Engagement',
                  content: '',
                  costs: '₹200000'),
              const ExtrasCard(
                  headline: 'Social Media Ads with 10 lac Engagement',
                  content: '',
                  costs: '₹350000'),
              const ExtrasCard(
                  headline: 'Social Media Ads with  Unlimited Engagement',
                  content: '',
                  costs: '₹500000'),
             
            ],
          ),
        ),
      ),
    );
  }
}
