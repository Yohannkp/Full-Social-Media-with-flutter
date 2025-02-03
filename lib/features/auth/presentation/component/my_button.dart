import 'package:flutter/material.dart';
class my_button extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const my_button({
    super.key,
    required this.onTap,
    required this.text
});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
           borderRadius: BorderRadius.circular(12),   
        ),
        child: Center(child: Text(text,style: TextStyle(color: Colors.black),)),
      ),
    );
  }
}
