import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AuthField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;

  const AuthField({
    required this.hint,
    required this.icon,
    this.isPassword = false,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(fontSize: 13),


        prefixIcon: Icon(
          widget.icon,
          color: const Color(0xFF34A853),
        ),

        /// EYE ICON (RIGHT)
        suffixIcon: widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: Colors.green,
          ),
        )
            : null,

        filled: true,
        fillColor: const Color(0xFFE9F8EE),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
