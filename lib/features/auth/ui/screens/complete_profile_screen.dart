import 'package:ecomerce/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';


class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const String name = '/complete-profile';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController = TextEditingController();
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
                'Complete Profile',
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
                child: const Text('Complete'),
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
      child:  Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _firstNameTEController,
            decoration: const InputDecoration(
              hintText: 'First Name'
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter valid your first name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8,),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _lastNameTEController,
            decoration: const InputDecoration(
              hintText: 'Last Name'
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter valid your last name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8,),
          TextFormField(
            maxLength: 11,
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _mobileTEController,
            decoration: const InputDecoration(
              hintText: 'Mobile Number'
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter valid your phone number';
              }
              if(!RegExp(r'^(?:\+88|88)?(01[3-9]\d{8})$').hasMatch(value!)){
                return 'Enter valid phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 8,),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _cityTEController,
            decoration: const InputDecoration(
              hintText: 'City'
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter your valid city name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8,),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _shippingAddressTEController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Shipping Address'
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter your valid shipping address';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  void _onTapNextButton() {
     // if(_formKey.currentState!.validate()){
     // }
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shippingAddressTEController.dispose();
    super.dispose();
  }
}
