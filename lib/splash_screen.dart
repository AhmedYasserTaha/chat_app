import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/welcom_screen.dart';
import 'package:chat_app/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (_auth.currentUser != null) {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
      } else {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => WelcomScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.p1Color, // لون الخلفية مثل واتساب
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: screenWidth * 0.3, // 30% من عرض الشاشة
            ),
            SizedBox(height: screenHeight * 0.02), // 2% من ارتفاع الشاشة
            Text(
              "Chat App",
              style: TextStyle(
                color: AppColors.p2Color,
                fontSize: screenWidth * 0.1, // 10% من عرض الشاشة
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
