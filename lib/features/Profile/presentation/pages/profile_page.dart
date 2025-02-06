import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmedia/app.dart';
import 'package:socialmedia/features/Profile/presentation/cubits/profil_cubit.dart';
import 'package:socialmedia/features/auth/domain/entities/AppUser.dart';
import 'package:socialmedia/features/auth/presentation/cubits/auth_cubit.dart';
class ProfilePage extends StatefulWidget {

  final String uid;
  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  //On recupere le cubits
  late final authCubit = context.read<Authcubit>();
  late final profileCubit = context.read<ProfileCubit>();

  //On recupere l'utilsateur conncté
  late AppUser? currentUser = authCubit.currentUser;

  //Au demarrage
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    profileCubit.fetchuserprofile(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(currentUser!.email,style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
