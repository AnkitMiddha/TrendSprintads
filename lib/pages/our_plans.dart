import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/pages/privacy_policy.dart';

class OurPlans extends StatelessWidget {
  const OurPlans({super.key});
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
            decoration: const BoxDecoration
            ( color:  Color.fromARGB(255, 42, 55, 83),
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text("Our Campaigns",style: GoogleFonts.lato(color: Colors.yellow,fontSize:26),),
                 const SizedBox(height: 15,),
                 Text("MIX",style: GoogleFonts.lato(fontSize: 22,color: Colors.yellow),),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                    Text("Social Media Ads",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                    Text("Rates",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                                     ],),
                  ),
                     Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                    Text("Social Media Ads(10000)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                    Text("₹5,500",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                                     ],),
                                     
                  ),
                    Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                    Text("Social Media Ads(20000)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                    Text("₹10,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                                     ],),
                    ),
                     Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                    Text("Social Media Ads(1Lac)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                    Text("₹45,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                                     ],),
                    ),
                     Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                    Text("Social Media Ads(5 Lac)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                    Text("₹2,00,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                                     ],),
                    ),
                     Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                    Text("Social Media Ads(10 Lac)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                    Text("₹3,50,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                                     ],),
                    ),
                      Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                    Text("Social Media Ads(Unlimited)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                    Text("₹5,00,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                                     ],),
                    ),
                     Text("SEPARATE",style: GoogleFonts.lato(fontSize: 22,color: Colors.yellow),),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                    Text("Facebook Ads(100000)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                    Text("₹50,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                                     ],),
                  ),
                     Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                    Text("Instagram Ads(10000)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                    Text("₹50,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                                     ],),
                                     
                  ),
                    Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                    Text("WhatsApp Ads(20000)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                    Text("₹50,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                                     ],),
                    ),
                     Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                    Text("SMS Ads(20000)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                    Text("₹20,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                                     ],),
                    ),
                     Text("EXTRAS",style: GoogleFonts.lato(fontSize: 22,color: Colors.yellow),),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                    Text("Basic Campaign Combo Ads",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                    Text("₹1,00,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                                     ],),
                  ),
                     Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                    Text("Smart Campaign Combo",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                    Text("₹3,50,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                                     ],),
                                     
                  ),
                    Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                    Text("Campaign Ad Pro",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                    Text("₹5,00,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                                     ],),
                    ),




                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Refer to our',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const PrivacyPolicy()));}, 
                      child: const Text(
                        'Privacy Policy',
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
      
    );
  }
}
