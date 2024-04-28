import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/components/heading.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late Image image1;
  @override
  void initState() {
    image1 = Image.asset('assets/images/cu.png');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(image1.image, context);
  }

  void openMaps() async {
    final url = Uri.parse('https://maps.app.goo.gl/CXaLVkFHSs33F3nY9');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  void signUserOut() {
    GoogleSignIn().signOut();
    FacebookAuth.instance.logOut();
    FirebaseAuth.instance.signOut();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  CollectionReference collRef = FirebaseFirestore.instance.collection('users');
  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // All fields are valid, submit to Firestore
      try {
        await collRef.add({
          'name': _nameController.text,
          'email': _emailController.text,
          'message': _messageController.text,
          'mobile': _mobileController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent!')),
        );
        _formKey.currentState!.reset();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error sending message: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 44, 67),
      appBar: AppBar(
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/cu.png'),
                const SizedBox(
                  height: 10,
                ),
                const Heading(title: "Book Meeting"),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Enter Your Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        fillColor: const Color.fromARGB(255, 42, 55, 83),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey.shade200)),
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        fillColor: const Color.fromARGB(255, 42, 55, 83),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey.shade300)),
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _mobileController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      if (value.length != 10) {
                        return 'Please enter a 10 digit Mobile Number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Enter Your Mobile No.',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        fillColor: const Color.fromARGB(255, 42, 55, 83),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey.shade300)),
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
                        ),
                        fillColor: const Color.fromARGB(255, 42, 55, 83),
                        filled: true,
                        hintText: 'Enter Your Message',
                        hintStyle: TextStyle(color: Colors.grey.shade300)),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a message';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: OutlinedButton(
                      onPressed: () {
                        _formKey.currentState!.validate();
                        _submitForm();
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: const Size(340, 60),
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.yellow,
                        ),
                      ),
                      child: const Text(
                        "Send",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ),
                Text(
                  "Trendsprint ads",
                  style: GoogleFonts.lato(
                      fontSize: 22,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w400),
                ),
                Text("Regd. Off. Vikas Nagar Murlijot ,Basti, UP 272001 ",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                    )),
                const SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                  onPressed: openMaps,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    side: const BorderSide(
                      width: 1.0,
                      color: Colors.yellow,
                    ),
                  ),
                  child: Text(
                    'View in Map',
                    style: GoogleFonts.lato(
                      color: Colors.yellow,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    _makePhoneCall('+916306335096');
                  },
                  child: Text(
                    " Call Us : +91 6306335096",
                    style: GoogleFonts.lato(
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Hours",
                    style: GoogleFonts.lato(
                      color: Colors.yellow,
                      fontSize: 22,
                    )),
                Text("Mon-Fri : 9am to 10pm",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                    )),
                Text("Sat-Sun : 9am to 2am",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
