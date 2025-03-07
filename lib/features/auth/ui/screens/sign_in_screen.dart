import 'package:ecomerce/features/auth/ui/controller/sign_in_controller.dart';
import 'package:ecomerce/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecomerce/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:ecomerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecomerce/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecomerce/features/common/ui/widgets/snack_bar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/email-verification';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  final SignInController _signInController = Get.find<SignInController>();

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
                  textInputAction: TextInputAction.next,
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
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: _obscurePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordTEController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Must be 6 characters or more';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<SignInController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: _onTapNextButton,
                    child: const Text('Sign in'),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      bool isSuccess = await _signInController.signIn(
          _emailTEController.text.trim(), _passwordTEController.text);
      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(
            context,
            MainBottomNavScreen.name,
            arguments: _emailTEController.text.trim(),
          );
        }
      } else {
        if (mounted) {
          snackBarMessage(context, _signInController.errorMessage!);
        }
      }
      //
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _emailTEController.dispose();
    super.dispose();
  }
}
