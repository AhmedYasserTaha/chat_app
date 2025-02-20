import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/regstraion_screen.dart';
import 'package:chat_app/utils/app_colors.dart';
import 'package:chat_app/widget/my_button.dart';
import 'package:chat_app/widget/my_text_feild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool isLoading = false; // متغير لحالة التحميل

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            MyTextField(
              keyboardType: TextInputType.emailAddress,
              hintText: "Enter Your Email",
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            MyTextField(
              hintText: "Enter your password",
              isPassword: true,
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            isLoading
                ? Center(
                    child: CircularProgressIndicator()) //  اللودر أثناء التحميل
                : MyBoutton(
                    titleButton: "Sign in",
                    onPressed: () async {
                      setState(() {
                        isLoading = true; //  تشغيل اللودر
                      });

                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                          email: email.trim(),
                          password: password,
                        );

                        if (user != null) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(),
                            ),
                          );
                        }
                      } catch (e) {
                        print("Login Error");

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Error: ${e.toString()}"),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } finally {
                        setState(() {
                          isLoading = false; //  إيقاف اللودر بعد انتهاء العملية
                        });
                      }
                    },
                    color: AppColors.p1Color,
                  ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegstraionScreen()),
                  );
                },
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Register",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.p1Color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
