import 'dart:async';
import 'package:ecomerce/app/app_colors.dart';
import 'package:ecomerce/app/app_constants.dart';
import 'package:ecomerce/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecomerce/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final RxInt _remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;
  final RxBool _enableResendCodeButton = false.obs;
  late Timer timer;

  @override
  void initState() {
    _startResentTimer();
    super.initState();
  }

  void _startResentTimer() {
    _enableResendCodeButton.value = false;
    _remainingTime.value = AppConstants.resendOtpTimeOutInSecs;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      _remainingTime.value--;
      if (_remainingTime.value == 0) {
        t.cancel();
        _enableResendCodeButton.value = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 100),
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
                    activeColor: Colors.green,
                    selectedColor: AppColors.themeColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  controller: _otpTEController,
                  appContext: context,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _onTapNextButton,
                  child: const Text('Next'),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => Visibility(
                    visible: !_enableResendCodeButton.value,
                    child: RichText(
                      text: TextSpan(
                          text: 'The code will be expire in ',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                          children: [
                            TextSpan(
                              text: '${_remainingTime}s',
                              style: const TextStyle(
                                color: AppColors.themeColor,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: _enableResendCodeButton.value,
                    child: TextButton(
                        onPressed: () {
                          _startResentTimer();
                        },
                        child: const Text('Resend Code')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() {
    //Navigator.pushReplacementNamed(context, CompleteProfileScreen.name);
    if(_formKey.currentState!.validate()){
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
