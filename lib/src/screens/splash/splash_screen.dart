import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width:double.infinity,
         color: Colors.white,
         child:Stack(
          fit:StackFit.expand,
          children: [
            Image.asset('lib/src/assets//pattern.png',
            fit: BoxFit.cover,),
            Center(
              child: Image.asset('lib/src/assets/app_icon.png',
              height: 82,
              width: 183,),
            )
          ],
         )
        ),
      
    );
  }
}
