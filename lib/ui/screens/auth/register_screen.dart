import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgets/authButton.dart';
import '../../../core/widgets/authField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
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
                    'Create Account',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Join us to start classifying fruits',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 40),

                  AuthField(
                    hint: 'Choose a username',
                    icon: Icons.person_outline,
                    controller: usernameController,
                    validator: Validators.username,
                  ),

                  const SizedBox(height: 18),

                  AuthField(
                    hint: 'Enter your email',
                    icon: Icons.email_outlined,
                    controller: emailController,
                    validator: Validators.email,
                  ),

                  const SizedBox(height: 18),

                  AuthField(
                    hint: 'Create a password',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: passwordController,
                    validator: Validators.password,
                  ),

                  const SizedBox(height: 26),

                  AuthButton(
                    text: isLoading ? 'Creating...' : 'Create Account',
                    onPressed: isLoading
                        ? null
                        : () async {
                      if (!_formKey.currentState!.validate()) return;

                      setState(() => isLoading = true);

                      await AuthService.register(
                        username:
                        usernameController.text.trim(),
                        email: emailController.text.trim(),
                        password:
                        passwordController.text.trim(),
                      );

                      setState(() => isLoading = false);

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
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(fontSize: 13),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            AppRoutes.loginScreen,
                          );
                        },
                        child: const Text(
                          'Sign in',
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
                    'By creating an account, you agree to our Terms & Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
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
