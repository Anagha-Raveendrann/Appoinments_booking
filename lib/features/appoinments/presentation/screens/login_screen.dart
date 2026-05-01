import 'dart:ui';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
    
    final emailController = TextEditingController();
    final passordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // image section 
          Expanded(
             flex: 4,
             child: Stack(
              children: [
                SizedBox.expand(
                  child: Image.asset('assets/Placed-Images8.jpg',
                  fit: BoxFit.cover,
                  ),
                ),
                // Blur effect 
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 8,
                    sigmaY: 8,
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  ),

                  // logo center 
                  Center(
                    child: Image.asset('assets/healthlogo.jpg',
                    width: 120,
                    ),
                  ),
              ],
             ),
          ),
          // Bottom Form section
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Column(
                children: [
                  Text("Login Or Register To Book\n Appointments",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  )
                ],
              ),
            ),
            
             ),
        ],
      ),
    );
  }
}