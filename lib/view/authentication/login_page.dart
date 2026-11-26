import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static const background = Color(0xFFF0E6D6); // cream
  static const primary = Color(0xFF234E3C); // deep green
  static const field = Color(0xFFE3D3B8); // light tan (input fields)
  static const muted = Color(0xFF6B6354); // warm grey-brown text
  static const chip = Color(0xFFD9C4A5); // tan
  static const accent = Color(0xFFB76E4B); // terracotta
  static const card = Color(0xFFFAF5EB); // soft white-cream
}
// >>> COMMIT 01: chore: add imports and AppColors theme palette

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _useMobile = true;
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }
  // >>> COMMIT 02: feat: create LoginScreen widget with state and controllers

  void _sendOtp() {
    if (!_formKey.currentState!.validate()) return;
    // TODO: call your OTP API here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _useMobile
              ? 'OTP sent to +977 ${_phoneController.text}'
              : 'Code sent to ${_emailController.text}',
        ),
      ),
    );
  }
  // >>> COMMIT 03: feat: add _sendOtp with form validation and snackbar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.maybePop(context),
        ),
        // Title removed: the logo already contains "FERI THRIFT"
      ),
    );
  }
}