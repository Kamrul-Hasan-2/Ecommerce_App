import 'package:ecomerce/app/app_theme_data.dart';
import 'package:ecomerce/features/auth/ui/screens/splash_screen.dart';
import 'package:ecomerce/features/auth/ui/screens/verify_email_screen.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppThemeData.lightThemeData,
      initialRoute: '/',
      routes: {
        SplashScreen.name : (context)=> const SplashScreen(),
        VerifyEmailScreen.name : (context)=> const VerifyEmailScreen(),
      },
    );
  }
}
