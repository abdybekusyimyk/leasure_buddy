import 'package:flutter/material.dart';

class TextFormFieldWalledWidget extends StatelessWidget {
  const TextFormFieldWalledWidget({
    super.key,
    required this.hintText,
    this.keyboardType,
    required this.controller,
  });

  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: Colors.white,
        style: const TextStyle(
          color: Color(0xff828282),
          fontFamily: 'SF-Pro-Display',
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          fillColor: const Color(0xff17036b),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xff828282),
            fontFamily: 'SF-Pro-Display',
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff2D72F8),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
