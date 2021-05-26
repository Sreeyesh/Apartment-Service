import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final TextInputType inputType;

  const LoginTextField({
    Key key,
    this.icon,
    this.hintText,
    this.inputType,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: inputType,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.blue[400],
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(
              color: Colors.grey[400],
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey[350],
          ),
        ),
      ),
    );
  }
}
