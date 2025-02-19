import 'package:chat_app/screens/sign_in_screen.dart';
import 'package:chat_app/utils/app_colors.dart';
import 'package:chat_app/widget/my_button.dart';
import 'package:chat_app/widget/my_text_feild.dart';
import 'package:flutter/material.dart';

class RegstraionScreen extends StatefulWidget {
  const RegstraionScreen({super.key});

  @override
  State<RegstraionScreen> createState() => _RegstraionScreenState();
}

class _RegstraionScreenState extends State<RegstraionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Image.asset("assets/images/logo.png"),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          MyTextField(hintText: "Enter Your Email"),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          MyTextField(hintText: "Enter your password", isPassword: true),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          MyBoutton(
            titleButton: "Register",
            onPressed: () {},
            color: AppColors.p2Color,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

          // إضافة نص يحتوي على رابط لتسجيل الدخول
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SingInScreen()));
              },
              child: Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign in",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.p2Color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
