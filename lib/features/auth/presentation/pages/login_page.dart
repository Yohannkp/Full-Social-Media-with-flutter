import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:socialmedia/features/auth/presentation/component/MyTextField.dart';
import 'package:socialmedia/features/auth/presentation/cubits/auth_cubit.dart';
import '../component/my_button.dart';
import 'register_page.dart';
import 'forgot_password_page.dart';


class LoginPage extends StatefulWidget {
  final void Function()? togglePages;
  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  void login(){
    final authCubit = context.read<Authcubit>();
    final String email = emailController.text;
    final String psw = passwordController.text;

    if(email.isNotEmpty && psw.isNotEmpty){
      authCubit.login(email, psw);
    }
    else{

      IconSnackBar.show(context,snackBarType: SnackBarType.fail, label: 'Ces champs ne peuvent pas être vide');

    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("LOGIN",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 30),),

            SizedBox(height: 100,),

            Mytextfield(controller: emailController, hintText: "email", obscureText: false),
            SizedBox(height: 20,),
            Mytextfield(controller: passwordController, hintText: "password", obscureText: true),
            const SizedBox(height: 20),
            my_button(onTap: (){
              login();
            }, text: "Se connecter"),
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage())),
              child: const Text('Forgot Password?'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? ",style: TextStyle(color: Colors.grey),),
                GestureDetector(
                    onTap: (){
                      widget.togglePages!();

                    },
                    child: const Text("Register now",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

