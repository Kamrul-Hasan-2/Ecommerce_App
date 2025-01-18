import 'package:ecomerce/app/app_theme_data.dart';
import 'package:ecomerce/app/controller_binder.dart';
import 'package:ecomerce/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecomerce/features/auth/ui/screens/splash_screen.dart';
import 'package:ecomerce/features/auth/ui/screens/verify_email_screen.dart';
import 'package:ecomerce/features/categories/ui/screen/categorie_list_screen.dart';
import 'package:ecomerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/auth/ui/screens/complete_profile_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: AppThemeData.lightThemeData,
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinders(),
      initialRoute: '/',
      routes: {
        SplashScreen.name : (context)=> const SplashScreen(),
        VerifyEmailScreen.name : (context)=> const VerifyEmailScreen(),
        OTPVerificationScreen.name : (context)=> const OTPVerificationScreen(),
        CompleteProfileScreen.name : (context)=> const CompleteProfileScreen(),
      //  HomeScreen.name : (context)=> const HomeScreen(),
        MainBottomNavScreen.name : (context)=> const MainBottomNavScreen(),
        CategorieListScreen.name : (context)=> const CategorieListScreen(),
      },
    );
  }
}
