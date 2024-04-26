import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/widgets/extras_card.dart';

class Extras extends StatelessWidget {
  const Extras({super.key});
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
      body: Container(
         padding: const EdgeInsets.only(top: 15),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 42, 55, 83),
        ),
        child:SingleChildScrollView(
          child: Column(
            children: [
              Text("Extras",style: GoogleFonts.lato(fontSize: 22,color: Colors.yellow,fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
                ExtrasCard(headline: "Basic Campaign Combo", content: content[0], costs:'₹100000'),
                ExtrasCard(headline: "Smart Campaign Combo", content: content[1], costs:'₹350000'),
                ExtrasCard(headline: "Campaign Ad Pro", content: content[2], costs:'₹100000'),
          
          
                
            ],
          ),
        ),
        ),
  
    
    );
  }
 
}
final List<String> content = [
  "Costs 1 lack and in it we boost business with full force everywhere on digital platforms so that it comes in eye of everyone.",
  "Costs 3 lack 50 thousand and in it we boost business with full force everywhere on digital platforms and also track customers to business. Also we promote it by our partner influencers.",
  "Costs 5 lack and in it we just create whole advertising ecosystem and businesses can Target every type of advertising services and also smart campaign combo ads features also included in it."
];