import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CusttomTextFild extends StatelessWidget {
  CusttomTextFild({super.key, required this.hinttitle, this.onChanged, this.keyboardType});
  final String hinttitle;
  Function(String)? onChanged;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        keyboardType: keyboardType ,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            hintText: hinttitle,
            hintStyle: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}
