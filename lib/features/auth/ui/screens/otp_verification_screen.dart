import 'package:ecomerce/app/app_colors.dart';
import 'package:ecomerce/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  static const String name = '/otp-verification';

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 45),
                const AppLogoWidget(),
                const SizedBox(height: 24),
                Text(
                  'Enter OTP Code',
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  'A 4 Digit OTP Code has been sent',
                  style: textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
            PinCodeTextField(
              keyboardType: TextInputType.number,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                inactiveFillColor: Colors.white,
                inactiveColor: AppColors.themeColor,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor:Colors.green,
                selectedColor: AppColors.themeColor,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.white,
              enableActiveFill: true,
              controller: _otpTEController,
              appContext: context,
            ),
                const SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: _onTapNextButton,
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _onTapNextButton(){
    // if(_formKey.currentState!.validate()){
    // }
}
}
