
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isEmail = true;

  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final green = const Color(0xFF15583F);
  final grey = const Color(0xFF60717A);

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAF3),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAF3),
        elevation: 0,
        toolbarHeight: 50,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          '● FERI THRIFT',
          style: TextStyle(
            color: green,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              const SizedBox(height: 12),

              // Feri Thrift Logo
              Container(
                height: 105,
                width: 105,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFFE7EADD),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/feri_logo.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(
                    Icons.checkroom,
                    color: Color(0xFF15583F),
                    size: 50,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // Heading
              const Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF171717),
                ),
              ),

              const SizedBox(height: 10),

              // Description
              Text(
                'Enter your registered email address\n'
                    'or phone number to receive a reset link/code.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: grey,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 25),

              // Email / Phone Toggle
              Container(
                height: 52,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F1E9),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    _tab('Email', Icons.mail_outline, true),
                    _tab('Phone Number', Icons.phone_outlined, false),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Animated Input Field
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor: animation,
                      axisAlignment: -1,
                      child: child,
                    ),
                  );
                },
                child: isEmail
                    ? _input(
                  key: const ValueKey('email'),
                  controller: emailController,
                  hint: 'Enter your email address',
                  icon: Icons.mail_outline,
                  type: TextInputType.emailAddress,
                )
                    : _input(
                  key: const ValueKey('phone'),
                  controller: phoneController,
                  hint: 'Enter your phone number',
                  icon: Icons.phone_outlined,
                  type: TextInputType.phone,
                ),
              ),

              const SizedBox(height: 30),

              // Send Reset Button
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {
                    if (isEmail) {
                      // Email reset action
                      final email = emailController.text.trim();
                      debugPrint('Reset email: $email');
                    } else {
                      // Phone reset action
                      final phone = phoneController.text.trim();
                      debugPrint('Reset phone: $phone');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isEmail
                            ? 'Send Reset Link'
                            : 'Send Reset Code',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Icon(
                        Icons.arrow_forward,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // Security Illustration
              Icon(
                Icons.verified_user_outlined,
                color: green,
                size: 95,
              ),

              const SizedBox(height: 12),

              // Bottom Information
              Text(
                isEmail
                    ? 'ⓘ  You’ll receive a reset link in your email\n'
                    'shortly.'
                    : 'ⓘ  You’ll receive a verification code on your\n'
                    'phone shortly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: grey,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  // Email / Phone Toggle
  Widget _tab(String title, IconData icon, bool email) {
    final selected = isEmail == email;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            isEmail = email;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: selected ? green : Colors.transparent,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: selected ? Colors.white : green,
                size: 17,
              ),
              const SizedBox(width: 7),
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: selected ? Colors.white : grey,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Input Field
  Widget _input({
    required Key key,
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required TextInputType type,
  }) {
    return Container(
      key: key,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xFFAAAAAA),
            fontSize: 12,
          ),
          prefixIcon: Icon(
            icon,
            color: green,
            size: 21,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 22),
        ),
      ),
    );
  }
}
