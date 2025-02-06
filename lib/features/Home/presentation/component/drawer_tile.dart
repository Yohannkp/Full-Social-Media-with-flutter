import 'package:flutter/material.dart';
class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const DrawerTile({super.key, required this.title,required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: TextStyle(color: Colors.black),),
      leading: Icon(icon,color: Colors.black,),
      onTap: onTap,
    );
  }
}
