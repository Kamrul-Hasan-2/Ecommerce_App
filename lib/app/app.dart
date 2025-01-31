import 'package:ecomerce/app/app_theme_data.dart';
import 'package:ecomerce/app/controller_binder.dart';
import 'package:ecomerce/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecomerce/features/auth/ui/screens/splash_screen.dart';
import 'package:ecomerce/features/auth/ui/screens/verify_email_screen.dart';
import 'package:ecomerce/features/categories/ui/screen/categorie_list_screen.dart';
import 'package:ecomerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecomerce/features/product/ui/screens/product_details_screen.dart';
import 'package:ecomerce/features/product/ui/screens/product_list_screen.dart';
import 'package:ecomerce/features/review/ui/screens/create_review_screen.dart';
import 'package:ecomerce/features/review/ui/screens/review_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/auth/ui/screens/complete_profile_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinders(),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if(settings.name == SplashScreen.name){
          widget = const SplashScreen();
        }else if(settings.name == VerifyEmailScreen.name){
          widget = const VerifyEmailScreen();
        }else if(settings.name == OTPVerificationScreen.name){
          widget = const OTPVerificationScreen();
        }else if(settings.name == CompleteProfileScreen.name){
          widget = const CompleteProfileScreen();
        }else if(settings.name == MainBottomNavScreen.name){
          widget = const MainBottomNavScreen();
        }else if(settings.name == CategorieListScreen.name){
          widget = const CategorieListScreen();
        }else if(settings.name == ProductListScreen.name){
          String name = settings.arguments as String;
          widget =  ProductListScreen(categoryName: name);
        }else if(settings.name == ProductDetailsScreen.name){
          int productId = settings.arguments as int;
          widget =  ProductDetailsScreen(productId: productId);
        }else if(settings.name == ReviewListScreen.name){
          widget = const ReviewListScreen();
        }else if(settings.name == CreateReviewScreen.name){
          widget = const CreateReviewScreen();
        }
        return MaterialPageRoute(builder: (ctx){
          return widget;
        });
      },

    );
  }
}
