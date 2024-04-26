import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/pages/ourplans/extras.dart';
import 'package:loginpage/pages/ourplans/mix.dart';
import 'package:loginpage/pages/ourplans/separate.dart';
import 'package:loginpage/pages/privacy_policy.dart';
import 'package:loginpage/widgets/custom_plans_card.dart';

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
                 Text("Our Campaigns",style: GoogleFonts.lato(color: Colors.yellow,fontSize:26,fontWeight: FontWeight.w900),),
                 const SizedBox(height: 15,),
              CustomPlansCard(headline:"Mix" ,  subheading: subheading[0], route: const Mix(),),
                 const SizedBox(height: 15,),
              CustomPlansCard(headline:"Separate" , subheading: subheading[1], route: const Separate(), ),
              CustomPlansCard(headline: "Extras", subheading: subheading[2], route: const Extras()),
             
                //  Text("MIX",style: GoogleFonts.lato(fontSize: 22,color: Colors.yellow),),
                //   Padding(
                //     padding: const EdgeInsets.all(12.0),
                //     child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                      children: [
                //     Text("Social Media Ads",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                //     Text("Rates",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                //                      ],),
                //   ),
                //      Padding(
                //     padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                //     child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                      children: [
                //     Text("Social Media Ads(10000)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                //     Text("₹5,500",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                //                      ],),
                                     
                //   ),
                //     Padding(
                //     padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                //     child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                      children: [
                //     Text("Social Media Ads(20000)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                //     Text("₹10,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                //                      ],),
                //     ),
                //      Padding(
                //     padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                //     child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                      children: [
                //     Text("Social Media Ads(1Lac)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                //     Text("₹45,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                //                      ],),
                //     ),
                //      Padding(
                //     padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                //     child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                      children: [
                //     Text("Social Media Ads(5 Lac)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                //     Text("₹2,00,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                //                      ],),
                //     ),
                //      Padding(
                //     padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                //     child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                      children: [
                //     Text("Social Media Ads(10 Lac)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                //     Text("₹3,50,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                //                      ],),
                //     ),
                //       Padding(
                //     padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                //     child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                      children: [
                //     Text("Social Media Ads(Unlimited)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                //     Text("₹5,00,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                //                      ],),
                //     ),
                //      Text("SEPARATE",style: GoogleFonts.lato(fontSize: 22,color: Colors.yellow),),
                //   Padding(
                //     padding: const EdgeInsets.all(12.0),
                //     child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                      children: [
                //     Text("Facebook Ads(100000)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                //     Text("₹50,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                //                      ],),
                //   ),
                //      Padding(
                //     padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                //     child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                      children: [
                //     Text("Instagram Ads(10000)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                //     Text("₹50,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                //                      ],),
                                     
                //   ),
                //     Padding(
                //     padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                //     child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                      children: [
                //     Text("WhatsApp Ads(20000)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                //     Text("₹50,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                //                      ],),
                //     ),
                //      Padding(
                //     padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                //     child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                      children: [
                //     Text("SMS Ads(20000)",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                //     Text("₹20,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                //                      ],),
                //     ),
                //      Text("EXTRAS",style: GoogleFonts.lato(fontSize: 22,color: Colors.yellow),),
                //   Padding(
                //     padding: const EdgeInsets.all(12.0),
                //     child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                      children: [
                //     Text("Basic Campaign Combo Ads",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                //     Text("₹1,00,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                //                      ],),
                //   ),
                //      Padding(
                //     padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                //     child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                      children: [
                //     Text("Smart Campaign Combo",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                //     Text("₹3,50,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                //                      ],),
                                     
                //   ),
                //     Padding(
                //     padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                //     child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                      children: [
                //     Text("Campaign Ad Pro",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),),
                //     Text("₹5,00,000",style: GoogleFonts.lato(fontSize: 16,color: Colors.white),)
                //                      ],),
                //     ),




                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                    
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
                                   ),
                 )
                
              ],
            ),
          ),
        ),
      
    );
  }
}
List<String> subheading = [
    "In this category we campaign at all platforms, providing comprehensive social media marketing solutions tailored to your business needs. it's type is given below",
    "In this category we campaign at specific platform to create targeted marketing strategies that align with the unique features and user demographics of each social media network it's type is given below",
    "it include campaigns designed for specific time and businesses  require careful planning and a deep understanding of industry trends, seasonal opportunities, and business objectives.",
  ];
// List<String> content =[
//  """SOCIAL MEDIA ADS with 10 thousand engagement Costs Rs 5500 

// SOCIAL MEDIA ADS with 20 thousand engagement Costs Rs 10000

// SOCIAL MEDIA ADS with 1 lack engagement Costs Rs 45000

// SOCIAL MEDIA ADS with 5 lack engagement Costs Rs 200000

// SOCIAL MEDIA ADS with 10 lack engagement Costs Rs 350000

// SOCIAL MEDIA ADS with unlimited engagement Costs Rs 500000""",
// """ 
// Facebook ADS with 1 lack engagement Costs RS 50000

// Instagram ADS with 1 lack engagement Costs RS 50000

// Whatsapp ADS (api non api) with 1 lack engagement Costs RS 50000

// SMS ADS (specific dlt) with 1 lack engagement Costs RS 20000
// """


// ];