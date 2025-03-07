import 'package:ecomerce/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const AppLogoWidget(
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 24),
              Text(
                'Sign Up Profile',
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
              _buildForm(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onTapNextButton,
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _firstNameTEController,
            decoration: const InputDecoration(hintText: 'First Name'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter valid your first name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _lastNameTEController,
            decoration: const InputDecoration(hintText: 'Last Name'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter valid your last name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            maxLength: 11,
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _mobileTEController,
            decoration: const InputDecoration(hintText: 'Mobile Number'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter valid your phone number';
              }
              if (!RegExp(r'^(?:\+88|88)?(01[3-9]\d{8})$').hasMatch(value!)) {
                return 'Enter valid phone number';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _cityTEController,
            decoration: const InputDecoration(hintText: 'City'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your valid city name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _passwordTEController,
            decoration: const InputDecoration(hintText: 'Password'),
            validator: (String? value) {
              if ((value?.isEmpty ?? true) || value!.length < 6) {
                return 'Enter your password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  void _onTapNextButton() {
    if (_formKey.currentState!.validate()) {}
  }

  // TODO: Module 26 and Video no 1 and i am more modify the sign up params code and not change the signup controller code

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _emailTEController.dispose();
    super.dispose();
  }
}
