import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmedia/features/Profile/presentation/pages/profile_page.dart';
import '../../../auth/presentation/cubits/auth_cubit.dart';
import 'drawer_tile.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Icon(Icons.person,size: 100,
                color: Theme.of(context).colorScheme.primary,),
              ),

              Divider(),

              DrawerTile(title: "H O M E", onTap: (){
                Navigator.of(context).pop();
              }, icon: Icons.home),
              DrawerTile(title: "P R O F I L E", onTap: (){
                Navigator.of(context).pop();

                //Get current user
                final user = context.read<Authcubit>().currentUser;
                String? uid = user!.uid;
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage(uid: uid,)));
              }, icon: Icons.person),
              DrawerTile(title: "S E A R C H", onTap: (){}, icon: Icons.search),
              DrawerTile(title: "S E T T I N G S", onTap: (){}, icon: Icons.settings),
              const  Spacer(),
              DrawerTile(title: "L O G O U T", onTap: (){
                context.read<Authcubit>().logout();
              }, icon: Icons.logout),
            ],
          ),
        ),
      ),
    );
  }
}
