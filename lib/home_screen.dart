
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/components/heading.dart';
import 'package:loginpage/widgets/customCard.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void signUserOut() {
    GoogleSignIn().signOut();
    FacebookAuth.instance.logOut();
    FirebaseAuth.instance.signOut();
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("TrendSprint", style: GoogleFonts.lato(fontSize:22,color: Colors.white,fontWeight: FontWeight.bold)),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/t1.png'),
              const SizedBox(height: 20),
              const Heading(title:'About TrendSprint Ads' ),
             // buildSectionTitle('About TrendSprint Ads'),
                customCard(image: 'assets/images/smm.png', headline: 'Why Advertisement?', content: content[3]),
               customCard(image: 'assets/images/home.png', headline: 'Our Vision', content: content[0]),
              customCard(image: 'assets/images/team1.png', headline: 'Our Team', content: content[1]),
              customCard(image: 'assets/images/socialmedia.png', headline: 'Our Services', content: content[2]),
            

             
            ],
          ),
        ),
      ),
    );
  }

 
}
List<String> content =[
 ' Our vision at Trendsprint Ads is to empower businesses worldwide to thrive and expand their social media marketing through strategic and cost-effective digital marketing solutions. In today\'s fast-paced digital landscape, we are committed to providing comprehensive support and innovative strategies that propel our clients towards unparalleled success. Let\'s elevate your brand together with our social media marketing agency and conquer the online realm!'
,'Our team is made up of experienced digital media marketers and web developers who are dedicated to helping businesses to succeed in online campaign. We are passionate about social media and stay up-to-date on the latest trends and best practises to ensure our clients get the best results.'
,'We offer variety of social media advertising and campaigning services, including social media management, advertising, content creation, lead generation and many more. Our services are designed to help businesses increase their online presence and reach their target audience.',
'Advertisements play a crucial role in business by raising awareness about products or services, influencing consumer behavior, and ultimately driving sales. They help companies reach their target audience, differentiate themselves from competitors, and build brand loyalty. Additionally, advertisements can inform consumers about new products, promotions, or special offers, creating demand and generating revenue forbusinesses.'
];
