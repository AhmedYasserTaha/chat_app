import 'package:flutter/material.dart';

class MyBoutton extends StatelessWidget {
  const MyBoutton({
    super.key,
    required this.titleButton,
    required this.onPressed,
    required this.color,
  });

  final String titleButton;
  final Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        elevation: 5,
        color: color, //Colors.yellow [900],
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 40,
          child: Text(
            titleButton,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
