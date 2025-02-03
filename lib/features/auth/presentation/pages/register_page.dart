import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:socialmedia/features/auth/presentation/pages/login_page.dart';

import '../component/MyTextField.dart';
import '../component/my_button.dart';
import '../cubits/auth_cubit.dart';
import 'forgot_password_page.dart';
class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  const RegisterPage({super.key, required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController comfirmpasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();


  void register(){
    final authCubit = context.read<Authcubit>();
    final String email = emailController.text;
    final String psw = passwordController.text;
    final String name = nameController.text;
    final String confirmpassword = passwordController.text;

    if(email.isNotEmpty && psw.isNotEmpty && name.isNotEmpty && confirmpassword.isNotEmpty){

      //S'assurer que les mots de passes correspondent
      if(psw == confirmpassword){
        authCubit.register(name, email, psw);
      }

      //Si les mots de passes de concorde pas
      else{
        IconSnackBar.show(context,snackBarType: SnackBarType.fail, label: 'Les mots de passe doivent être identique');

      }

    }
    else{
      IconSnackBar.show(context,snackBarType: SnackBarType.fail, label: 'Vous devez remlir tous les champs');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    comfirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('register')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("REGISTER",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 30),),

            SizedBox(height: 100,),


            Mytextfield(controller: nameController, hintText: "name", obscureText: false),
            SizedBox(height: 20,),
            Mytextfield(controller: emailController, hintText: "email", obscureText: false),
            SizedBox(height: 20,),
            Mytextfield(controller: passwordController, hintText: "password", obscureText: true),
            SizedBox(height: 20,),
            Mytextfield(controller: comfirmpasswordController, hintText: "Comfirm password", obscureText: true),
            const SizedBox(height: 20),
            my_button(onTap: (){
              register();
            }, text: "S'insrire"),
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage())),
              child: const Text('Forgot Password?'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? ",style: TextStyle(color: Colors.grey),),
                GestureDetector(
                    onTap: (){
                      widget.togglePages!();

                    },
                    child: const Text("login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
