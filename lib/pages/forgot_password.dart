import 'package:firebase_auth/firebase_auth.dart';

Future<void> sendPasswordResetEmail(String email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    // Show a success message to the user
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for the provided email.');
      // Show an error message to the user indicating email not found
    } else {
      print(e.message);
      // Handle other exceptions
    }
  }
}