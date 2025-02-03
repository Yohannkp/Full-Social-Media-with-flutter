import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:socialmedia/features/auth/data/firebase_auth_repo.dart';
import 'package:socialmedia/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:socialmedia/features/auth/presentation/cubits/auth_states.dart';
import 'package:socialmedia/themes/light_mode.dart';

import 'features/Post/presentation/pages/home_page.dart';
import 'features/auth/presentation/pages/auth_page.dart';
class MyApp extends StatelessWidget {
  final authrepo = FirebaseAuthRepo();
  MyApp({super.key});
  
  
  


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => Authcubit(authRepo: authrepo)..checkAuth(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: BlocConsumer<Authcubit,AuthState>(builder: (context,authState){
        if(authState is Unauthenticated){
          return const AuthPage();
        }

        if(authState is Authenticated){
          return const HomePage();
        }

        else{
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        //Il ecoute toutes les erreurs du projet
      }, listener: (context,state){
        if(state is AuthError){
          IconSnackBar.show(context,snackBarType: SnackBarType.fail, label: '${state.message}');

           }

        if(state is Unauthenticated){

        }if(state is Authenticated){

          IconSnackBar.show(context,snackBarType: SnackBarType.success, label: 'Connecté');

        }
      }),
    ),);
  }
}