import 'package:chat_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  MyTextField(
      {super.key,
      required this.hintText,
      this.icon,
      this.isPassword = false,
      this.onChanged,
      this.keyboardType});

  final String? hintText;
  final Widget? icon;
  final bool isPassword;
  void Function(String)? onChanged;
  final TextInputType? keyboardType;
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        textAlign: TextAlign.center,
        obscureText: widget.isPassword
            ? _isObscured
            : false, // إخفاء الباسورد لو كان فيلد باسورد
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.p1Color, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.p2Color, width: 2.5),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          prefixIcon: widget.icon, // أيقونة البداية
          suffixIcon: widget.isPassword // أيقونة الإظهار/الإخفاء
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured; // تغيير حالة الإخفاء
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
