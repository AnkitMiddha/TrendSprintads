
import 'package:flutter/widgets.dart';
import 'package:loginpage/pages/login_page.dart';
import 'package:loginpage/pages/register_page.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
bool showLoginPage = true;
 void togglePages() {
  setState(() {
    showLoginPage = !showLoginPage;
  });

 }
 
   @override
  Widget build(BuildContext context) {
    if(showLoginPage)
    {
      return LoginPage(onTap: ()
      {togglePages();
    });
    }
    else {
      return RegisterPage(onTap: () {
        togglePages();
      } );
    }
  }
  }
 