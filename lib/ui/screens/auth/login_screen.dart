import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/authButton.dart';
import '../../../core/widgets/authField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F8E5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 50),


              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: Color(0xFFE9F8EE),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.apple,
                    color: Color(0xFF34A853), size: 28),
              ),

              const SizedBox(height: 30),

              const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 6),

              const Text(
                'Sign in to continue classifying fruits',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),

              const SizedBox(height: 40),

              /// EMAIL
              AuthField(
                hint: 'Enter your email',
                icon: Icons.email_outlined,
              ),

              const SizedBox(height: 18),

              /// PASSWORD
              AuthField(
                hint: 'Enter your password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: Color(0xFF34A853), fontSize: 13),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              AuthButton(
                text: 'Login',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    AppRoutes.homeScreen,
                  );
                },
              ),


              const SizedBox(height: 30),

              const Text('or', style: TextStyle(color: Colors.grey)),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don’t have an account? ',
                      style: TextStyle(fontSize: 13)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, AppRoutes.registerScreen);
                    },
                    child: const Text(
                      'Create an account',
                      style: TextStyle(
                        color: Color(0xFF34A853),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              const Text(
                'By continuing, you agree to our Terms & Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
