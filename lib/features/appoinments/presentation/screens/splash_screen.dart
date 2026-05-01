import 'dart:ui';

import 'package:appoinments_booking/features/appoinments/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
 

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
   Future.delayed(const Duration(seconds: 3), () {
   Navigator.pushReplacement(context, 
   MaterialPageRoute(builder: (_)=> LoginScreen())
   );
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background image

          SizedBox.expand(
            child: Image.asset("assets/Placed-Images8.jpg",
            fit: BoxFit.cover,
            ),
          ),
          // blure effect 
          SizedBox.expand(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 12,
                sigmaY: 12
              ),
              child: Container(color: Colors.transparent,),
              ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:[
                    const Color.fromARGB(255, 216, 211, 211).withOpacity(0.6),
                ] 
                )
            ),
          ),
          Center(
            child: Image.asset('assets/download.png',width: 200,),
          ),
        ],
      ),
    );
  }
}