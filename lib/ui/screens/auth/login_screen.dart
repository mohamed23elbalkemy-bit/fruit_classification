import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgets/authButton.dart';
import '../../../core/widgets/authField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFE1F8E5),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
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
                    child: const Icon(
                      Icons.apple,
                      color: Color(0xFF34A853),
                      size: 28,
                    ),
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

                  AuthField(
                    hint: 'Enter your email',
                    icon: Icons.email_outlined,
                    controller: emailController,
                    validator: Validators.email,
                  ),

                  const SizedBox(height: 18),

                  AuthField(
                    hint: 'Enter your password',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: passwordController,
                    validator: Validators.password,
                  ),

                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Color(0xFF34A853),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  AuthButton(
                    text: isLoading ? 'Logging in...' : 'Login',
                    onPressed: isLoading
                        ? null
                        : () async {
                      if (!_formKey.currentState!.validate()) return;

                      setState(() => isLoading = true);

                      final success = await AuthService.login(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );

                      setState(() => isLoading = false);

                      if (success) {
                        Navigator.pushReplacement(
                          context,
                          AppRoutes.homeScreen,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                            Text('Invalid email or password'),
                          ),
                        );
                      }
                    },
                  ),

                  const SizedBox(height: 30),

                  const Text('or', style: TextStyle(color: Colors.grey)),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account? ',
                        style: TextStyle(fontSize: 13),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            AppRoutes.registerScreen,
                          );
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

                  const SizedBox(height: 30),

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
        ),
      ),
    );
  }
}
