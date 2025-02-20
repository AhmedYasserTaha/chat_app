import 'package:chat_app/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  late User signInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCrrentUser();
  }

  void getCrrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signInUser = user;
        print(signInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.p1Color,
        title: Row(
          children: [
            Image.asset("assets/images/logo.png", height: 30),
            SizedBox(width: 10),
            Text('Message Me', style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: أضف دالة تسجيل الخروج هنا
            },
            icon: Icon(Icons.close, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[200], // المساحة التي ستُعرض فيها الرسائل
                child: Center(child: Text("No messages yet!")),
              ),
            ),

            // صندوق إدخال النص وإرسال الرسائل
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.p1Color, width: 2),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        hintText: "Write a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      String message = messageController.text.trim();
                      if (message.isNotEmpty) {
                        print("Message sent: $message");
                        messageController.clear();
                      }
                    },
                    icon: Icon(Icons.send, color: AppColors.p1Color),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
