import 'package:chat_app/data/message_line.dart';
import 'package:chat_app/data/message_stream_bilder.dart';
import 'package:chat_app/utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final fireStore = FirebaseFirestore.instance;
late User signInUser; //this will give email

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String? messageText; // this will give text اللى هو الرسايل ف الصفحه

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
        automaticallyImplyLeading: false,
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
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.close, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            MessageStreamBuilder(),
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
                      onChanged: (value) {
                        messageText = value;
                      },
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
                    onPressed: () async {
                      if (messageText == null || messageText!.trim().isEmpty) {
                        print(
                            "Cannot send empty message"); // تأكيد أن الرسالة فارغة
                        return;
                      }
                      try {
                        DocumentReference docRef =
                            await fireStore.collection('message').add({
                          'text': messageText,
                          'sender': signInUser.email,
                          'timestamp': FieldValue.serverTimestamp(),
                        });
                        print(
                            "Message sent successfully! Document ID: ${docRef.id}"); // تأكيد نجاح العملية
                        messageController.clear();
                      } catch (e, stackTrace) {
                        print('Error sending message: $e');
                        print('Stack trace: $stackTrace'); // طباعة تفاصيل الخطأ
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
