import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgets/authButton.dart';
import '../../../core/widgets/authField.dart';
import '../../../l10n/app_localizations.dart';

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
                    loc.createAccount,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    loc.joinUsToStartClassifyingFruits,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 40),

                  AuthField(
                    hint: loc.chooseUsername,
                    icon: Icons.person_outline,
                    controller: usernameController,
                    validator: Validators.username,
                  ),

                  const SizedBox(height: 18),

                  AuthField(
                    hint: loc.enterYourEmail,
                    icon: Icons.email_outlined,
                    controller: emailController,
                    validator: Validators.email,
                  ),

                  const SizedBox(height: 18),

                  AuthField(
                    hint: loc.createPassword,
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: passwordController,
                    validator: Validators.password,
                  ),

                  const SizedBox(height: 26),

                  AuthButton(
                    text: isLoading ? loc.creating : loc.createAccount,
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

                  Text(loc.or, style: const TextStyle(color: Colors.grey)),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        loc.alreadyHaveAccount,
                        style: const TextStyle(fontSize: 13),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            AppRoutes.loginScreen,
                          );
                        },
                        child: Text(
                          loc.signIn,
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
                    loc.termsAndPrivacy,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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