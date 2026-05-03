import 'package:flutter/material.dart';

class AppButton extends StatelessWidget{

  final String title;
  final VoidCallback onTap;
  final double? height;

  const AppButton({
    super.key, 
    required this.title, 
    required this.onTap,
     this.height
     });

  

  @override
  Widget build(BuildContext context) {
    
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height ?? 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff0C6B3F),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: Text(
          title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        ),
      )
    ),
  );
  }
}