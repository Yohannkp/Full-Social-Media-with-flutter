import 'package:flutter/material.dart';
import 'package:socialmedia/features/auth/presentation/pages/login_page.dart';
import 'package:socialmedia/features/auth/presentation/pages/register_page.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showloginpage = true;

  void togglePages(){
    print("Toggles");
    setState(() {
      showloginpage = !showloginpage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showloginpage){
      return LoginPage(togglePages: togglePages);
    }else{
      return RegisterPage(togglePages: togglePages);
    }
  }
}
