import 'dart:ui';

import 'package:appoinments_booking/features/appoinments/presentation/widgets/app_textfield.dart';
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
                    color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 30,),

                  // Email label

                  const Text(
                    "Email",
                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8,),

                  // Reusable Email Field
                  AppTextfield(
                    hintText: "Enter your email",
                     controller: emailController,
                       KeyboardType: TextInputType.emailAddress,
                       prefixIcon: Icons.email,
                       ),
                    const SizedBox(height: 20,
                    ),

                    // password label

                    Text("Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  // Reusable password field
                  AppTextfield(
                    hintText: "Enter password", 
                    controller: passordController,
                    isPassword: true,
                    prefixIcon: Icons.lock,
                    ),
                    const SizedBox(height: 40,),

                    // login button 
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff0E6B3E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(14)
                          )
                        ),
                        onPressed: (){}, 
                        child: Text("Login",
                        style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                     
                    // terms & privacy text
                    const Center(
                      child: Text.rich(
                        TextSpan(
                          text: "By creating or logging into an account you are agreeing\nwith our ",
                          style: TextStyle(color: Colors.black45),
                          children: [
                            TextSpan(
                              text: "Terms and Conditions",
                              style: TextStyle(color: Colors.blue)
                            ),
                            TextSpan(text: "and",
                            style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(color: Colors.blue)
                            ),
                          ]
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
            
             ),
        ],
      ),
    );
  }
}