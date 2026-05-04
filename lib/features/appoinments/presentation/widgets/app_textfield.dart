import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
   
    final String hintText;
    final TextEditingController controller;
    final bool isPassword;
    final TextInputType KeyboardType;
    final IconData? prefixIcon;

   AppTextfield({
    super.key, 
    required this.hintText,
     required this.controller, 
     this.isPassword = false,
      this.KeyboardType = TextInputType.text,
       this.prefixIcon, required TextInputType keyboardType});

  @override
  Widget build(BuildContext context) {
   
    return TextField(
      controller: controller ,
      obscureText: isPassword,
      keyboardType:KeyboardType,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
      hintText: hintText,

        // Background color
        filled: true,
        fillColor: Colors.white,

        // prefix icon 
        prefixIcon : prefixIcon != null ? Icon(prefixIcon, color: Colors.grey,) : null,
        
         // padding 
         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),

          // Border style
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),

          // focus border 
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xff0E6B3E), ),
          ),
      ),
    );
  }
}