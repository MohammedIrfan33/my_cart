import 'package:flutter/material.dart';
import 'package:my_cart/core/common/widgets/button/basic_button.dart';
import 'package:my_cart/core/configs/asset/app_images.dart';

class SiginScreen extends StatefulWidget {
  const SiginScreen({super.key});

  @override
  State<SiginScreen> createState() => _SiginScreenState();
}

class _SiginScreenState extends State<SiginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const sizedBox = const SizedBox(height: 20);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0), // Horizontal padding 20
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              _siginText(),
              sizedBox,
              _emailField(),
              sizedBox,
              _continueButton(),
              sizedBox,
              _createAccount(),
              SizedBox(height: 70,),
             
              _authButton(
                title: 'Continue with Apple',
                icon: AppImages.appleIcon,
                action: () {
                  print('Google Sign-In Clicked');
                },
              ),
              _authButton(
                title: 'Continue with Google',
                icon: AppImages.googleIcon,

                action: () {
                  print('Google  Clicked');
                },
              ),
              _authButton(
                title: 'Continue with Facebook',
                icon: AppImages.fbIcon,

                action: () {
                  print('Google Sign-In Clicked');
                },
              ),
            
            ],
          ),
        ),
      ),
    );
  }

  Widget _siginText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _continueButton() {
    return BasicAppButton(
      title: 'Continue',
      action: () {
        if (_formKey.currentState!.validate()) {
          print('Valid email, proceed further');
        }
      },
    );
  }

  Widget _authButton({required String title, required VoidCallback action,required  String icon}) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff342F3F), // Background color
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              icon, // Replace with actual image path
              height: 20,
              width: 20,
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createAccount() {
    return RichText(
      text: TextSpan(
        text: "Don't have an account? ",
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
        children: [
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                print('Navigate to Create Account');
              },
              child: const Text(
                'Create one',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Clickable color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
