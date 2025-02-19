import 'package:chat_app/screens/regstraion_screen.dart';
import 'package:chat_app/screens/sign_in_screen.dart';
import 'package:chat_app/utils/app_colors.dart';
import 'package:chat_app/widget/my_button.dart';
import 'package:flutter/material.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset("assets/images/logo.png"),
                ),
                Text(
                  "MessageMe",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: AppColors.p2Color,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            MyBoutton(
              color: AppColors.p1Color,
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SingInScreen()));
              },
              titleButton: "Sign in",
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            MyBoutton(
              color: AppColors.p2Color,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RegstraionScreen()),
                );
              },
              titleButton: "Register",
            ),
          ],
        ),
      ),
    );
  }
}
