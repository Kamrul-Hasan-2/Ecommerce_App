import 'dart:async';
import 'package:ecomerce/app/app_colors.dart';
import 'package:ecomerce/app/app_constants.dart';
import 'package:ecomerce/features/auth/ui/controller/verify_otp_controller.dart';
import 'package:ecomerce/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecomerce/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:ecomerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecomerce/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecomerce/features/common/ui/widgets/snack_bar_message.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key, required this.email});

  static const String name = '/otp-verification';
  final String email;

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;
  final RxBool _enableResendCodeButton = false.obs;
  late Timer timer;
  final VerifyOTPController _verifyOTPController =
      Get.find<VerifyOTPController>();

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
                  length: 4,
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
                  validator: (String? value) {
                    if (value?.length != 4) {
                      return 'Enter Your otp';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                GetBuilder<VerifyOTPController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: _onTapNextButton,
                    child: const Text('Next'),
                  );
                }),
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

  Future<void> _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isSuccess = await _verifyOTPController.verifyOTP(
          widget.email, _otpTEController.text);
      if (isSuccess) {
        if (_verifyOTPController.shouldNavigateCompleteProfile) {
          if (mounted) {
            Navigator.pushNamed(context, CompleteProfileScreen.name);
          }
        } else {
          if (mounted) {
            Navigator.pushNamedAndRemoveUntil(
                context, MainBottomNavScreen.name, (predicate) => false);
          }
        }
      } else {
        if (mounted) {
          snackBarMessage(context, _verifyOTPController.errorMessage!);
        }
      }
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
