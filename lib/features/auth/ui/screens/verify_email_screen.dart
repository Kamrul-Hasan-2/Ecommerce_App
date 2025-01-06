import 'package:ecomerce/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecomerce/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  static const String name = '/email-verification';

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
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
                  'Welcome Back',
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  'Please Enter your Email Address',
                  style: textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your Email address';
                    }
                    if (!EmailValidator.validate(value!)) {
                      return 'Enter a valid Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
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

  void _onTapNextButton() {
    Navigator.pushReplacementNamed(context, OTPVerificationScreen.name);
    // if(_formKey.currentState!.validate()){
    // }
  }
}
