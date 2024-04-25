import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:loginpage/otpauth/phone_auth.dart';
import 'package:loginpage/pages/auth_page.dart';
import 'package:pinput/pinput.dart';
import 'package:telephony/telephony.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

 class _OtpScreenState extends State<OtpScreen> {
  final Telephony telephony = Telephony.instance;
 final TextEditingController _otpController = TextEditingController();
  String textRecevied = '';
  void onSubmit( BuildContext context) async {
       try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: PhoneAuth.verify, smsCode: _otpController.text);

                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                      if (!context.mounted) {
                        return;
                      }
                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const AuthPage()), (route) => false);
                    } catch (e) {
                     // Get.snackbar('wrong otp',e.toString());
                       print("wrong otp");
                    }
  }
  
  void startListening () {
    telephony.listenIncomingSms(
		onNewMessage: (SmsMessage message) {
      if(message.body!.contains('loginpage-9c51e')){
        String otpCode = message.body!.substring(0,6);
        setState(() {
			  _otpController.text = otpCode;
        Future.delayed(const Duration(seconds: 1),() {
     onSubmit(context);
        });
			});
      }
		},
		listenInBackground: false,
	);
  }
  @override
  void initState() {
   startListening();
    super.initState();
  }
  final FirebaseAuth auth = FirebaseAuth.instance;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 35, 47, 136)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  late final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: const Color.fromARGB(255, 110, 178, 241)),
    borderRadius: BorderRadius.circular(8),
  );

  late final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: const Color.fromRGBO(234, 239, 243, 1),
    ),
  );

  @override
  Widget build(BuildContext context)  {
  // var code = "";
   startListening();
    return Scaffold(
       backgroundColor: Colors.grey[300],
      appBar: AppBar(
         backgroundColor: Colors.grey[300],
        title: const Text(
          "Login Page",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/img1.png',
                height: 250,
                width: 250,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Phone Verfication',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              Pinput(
                 controller: _otpController,
                // onChanged: (value) {
                
                // setState(() {
                //   code = value;
                // }); 
                
                // },
             
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
              ),
              const SizedBox(
                height: 25,
              ),
              
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                 onPressed: () => onSubmit(context),
                  //() async {
                  //   try {
                  //     PhoneAuthCredential credential =
                  //         PhoneAuthProvider.credential(
                  //             verificationId: PhoneAuth.verify, smsCode: _otpController.text);

                  //     // Sign the user in (or link) with the credential
                  //     await auth.signInWithCredential(credential);
                  //     if (!context.mounted) {
                  //       return;
                  //     }
                  //    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const AuthPage()), (route) => false);
                  //   } catch (e) {
                  //    // Get.snackbar('wrong otp',e.toString());
                  //      print("wrong otp");
                  //   }
                  // },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'phone', (route) => true);
                  },
                  child: const Text('Edit Phone Number?'))
            ],
          ),
        ),
      ),
    );
  }
}

