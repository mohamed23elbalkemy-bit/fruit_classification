import 'package:flutter/material.dart';
import 'package:fruit_classification/l10n/app_localizations.dart';
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

    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.apple,
                      color: Color(0xFF34A853),
                      size: 28,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    loc.welcomeBack,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    loc.loginSubtitle,
                    style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color),
                  ),

                  const SizedBox(height: 40),

                  AuthField(
                    hint: loc.enterEmail,
                    icon: Icons.email_outlined,
                    controller: emailController,
                    validator: Validators.email,
                  ),

                  const SizedBox(height: 18),

                  AuthField(
                    hint: loc.enterPassword,
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
                      child: Text(
                        loc.forgotPassword,
                        style: const TextStyle(
                          color: Color(0xFF34A853),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  AuthButton(
                    text: isLoading ? loc.loggingIn : loc.login,
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
                          SnackBar(
                            content:
                            Text(loc.invalidLogin),
                          ),
                        );
                      }
                    },
                  ),

                  const SizedBox(height: 30),

                  Text(loc.or, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color)),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        loc.noAccount,
                        style: const TextStyle(fontSize: 13),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            AppRoutes.registerScreen,
                          );
                        },
                        child: Text(
                          loc.createAccount,
                          style: const TextStyle(
                            color: Color(0xFF34A853),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Text(
                    loc.termsPrivacy,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color),
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