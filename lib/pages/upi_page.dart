

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginpage/components/heading.dart';
import 'package:loginpage/components/my_textform_field.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
//import 'package:url_launcher/url_launcher.dart';
class AmountOption {
  final int amount;
  final String label;

  AmountOption(this.amount, this.label);
}

class UpiPage extends StatefulWidget {
  const UpiPage({super.key});
  @override
  State<UpiPage> createState() => _UpiPageState();
}
 late Razorpay _razorpay;
 TextEditingController amtcontroller =TextEditingController();



class _UpiPageState extends State<UpiPage> {
    void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Successful: ${response.paymentId}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Successful: ${response.paymentId}")),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Failed: ${response.code} - ${response.message}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Failed: ${response.code} - ${response.message}")),
    );
   
  }
     void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet: ${response.walletName}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("External Wallet: ${response.walletName}")),
    );
     }
   
     void _openRazorpay(amount) {
      amount = amount*100;

    var options = {
      'key': 'rzp_test_lNF16gy4kIlhqo', // Obtain from Razorpay Dashboard
      'amount': amount, // Amount in paisa (500.00 INR)
      'currency': 'INR',
      'name': 'TrendSprint',
      'description': 'Payment for Services',
      'external' : {
        'wallets'  : ['paytm']
      },
      'theme': {
        'color': '#F37254' // Customize the theme color (optional)
      },
    };

    try {
      _razorpay.open(options); // Open Razorpay payment gateway
    } catch (e) {
      print("Error opening Razorpay: $e");
    }
  }
   
    @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  void pay()
  {
    
       if(selectedOption!.amount.toString().isNotEmpty){
                  setState(() {
                    int amount = int.parse(selectedOption!.amount.toString());
                     _openRazorpay(amount);
                  });
                }
  
  }
   @override
  void dispose() {
    _razorpay.clear(); // Clear all listeners
    super.dispose();
  }
 
 void signUserOut() {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }

  //final _formKey = GlobalKey<FormState>();

  final TextEditingController _businessNamecontroller = TextEditingController();
  final TextEditingController _businessTypecontroller = TextEditingController();
  final TextEditingController _targetAreacontroller = TextEditingController();
  final TextEditingController _targetAudienceController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
   final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _advertisementGoalsController = TextEditingController();
   final TextEditingController _platformController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _additionalCommentsController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  

  CollectionReference collRef = FirebaseFirestore.instance.collection('ClientDetails');
  void _submitForm() async {
    // if (_formKey.currentState!.validate()) {
    //   // All fields are valid, submit to Firestore
      try {
        await collRef.add({
          'Client Name': _nameController.text,
          'Client Email': _emailController.text,
          'Contact Phone Number': _mobileController.text,
          'Business Name':_businessNamecontroller.text,
          'Buisness Type': _businessTypecontroller.text,
          'Target Audience': _targetAudienceController.text,
          'Target Area': _targetAreacontroller.text,
          'Preferred Platforms' : _platformController.text,
          'Budget':_budgetController.text,
          'Additional Comments': _additionalCommentsController.text,
          'Deadline': _deadlineController.text,
          'Advertisement Goals': _advertisementGoalsController.text,        

        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent!')),
        );
      //  _formKey.currentState!.reset();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error sending message: $e')),
        );
      }
   // }
  }
    final List<AmountOption> options = [
    AmountOption(5500, '10k engagment'),
    AmountOption(10000, '20k engagment'),
    AmountOption(45000, '100k engagment'),
    AmountOption(200000, '500k engagment'),
    AmountOption(350000, '1M engagment'),
    AmountOption(500000, 'unlimited engagment'),
    AmountOption(50000, ' facebook ads 100k engagment'),
    AmountOption(50000, ' Whatsapp Ads 100k engagment'),
    AmountOption(50000, ' Instagram Ads 100k engagment'),
    AmountOption(20000, ' SMS Ads 100k engagment'),
    AmountOption(100000, ' Basic Campaign Combo Ads'),
    AmountOption(350000, ' Smart Campaign Combo Ads'),
    AmountOption(500000, ' Campaign Ad Pro'),



  ];

AmountOption? selectedOption;
   
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     backgroundColor: const Color.fromARGB(255, 34, 44, 67),
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
       body: Center(

        
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
          
            children: [
            const Heading(title: "Client Advertisement"),          
            const Heading(title: " Information Form"),
             FormFields(controller:_businessNamecontroller, hintText: "Buisness Name"),
             FormFields(controller:_businessTypecontroller, hintText: "Buisness Type"),
             FormFields(controller:_nameController, hintText: "Name"),
             FormFields(controller:_emailController, hintText: " Email"),
             FormFields(controller:_mobileController, hintText: "Mobile No"),
             FormFields(controller:_platformController, hintText: "Preferred Platforms"),
             FormFields(controller:_targetAreacontroller, hintText: "Target Area"),
             FormFields(controller:_targetAudienceController, hintText: "Target Audience"),
             FormFields(controller:_budgetController, hintText: "Budget"),
             FormFields(controller:_additionalCommentsController, hintText: "Additional Comments"),
             FormFields(controller:_deadlineController, hintText: "Deadline"),
              const SizedBox(height: 20),
              Theme(
              data: Theme.of(context).copyWith(
                canvasColor:const Color.fromARGB(255, 34, 44, 67), // Background color of the dropdown
              ), child:  DropdownButton<AmountOption>(
              value: selectedOption, // Current selected value
              onChanged: (AmountOption? newOption) {
                setState(() {
                  selectedOption = newOption; // Update selected option
                });
              },
              items: options.map<DropdownMenuItem<AmountOption>>((AmountOption option) {
                return DropdownMenuItem<AmountOption>(
                  
                  value: option,
                  child: Text('${option.label} (₹${option.amount})',style: const TextStyle( color: Colors.yellow,),),
                );
              }).toList(),
            ),
              ),
           
            
               OutlinedButton(
                onPressed: () {
                 _submitForm();
                 pay();
                },
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
                  'Submit and Pay',
                  style: GoogleFonts.lato(
                    color: Colors.yellow,
                  ),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}