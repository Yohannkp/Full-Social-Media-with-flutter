import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmedia/app.dart';
import 'package:socialmedia/features/auth/presentation/cubits/auth_cubit.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){
          context.read<Authcubit>().logout();
        }, icon: Icon(Icons.logout,color: Colors.red,))
      ],title: Text("HOME PAGE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30)),centerTitle: true,),
    );
  }
}
