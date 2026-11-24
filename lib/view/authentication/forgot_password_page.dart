
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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

  String completePhoneNumber = '';

  final green = const Color(0xFF15583F);
  final grey = const Color(0xFF60717A);
  final background = const Color(0xFFFAFAF3);

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  // RESET BUTTON
  void sendReset() {
    if (isEmail) {
      final email = emailController.text.trim();

      if (email.isEmpty || !email.contains('@')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter a valid email address'),
          ),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Reset link requested for $email'),
        ),
      );
    } else {
      if (phoneController.text.trim().isEmpty ||
          completePhoneNumber.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter your phone number'),
          ),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Reset code requested for $completePhoneNumber'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      // APP BAR
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        toolbarHeight: 50,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
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

              // FERI THRIFT LOGO
              Container(
                height: 105,
                width: 105,
                decoration: const BoxDecoration(
                  color: Color(0xFFE7EADD),
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.checkroom,
                      color: Color(0xFF15583F),
                      size: 50,
                    );
                  },
                ),
              ),

              const SizedBox(height: 22),

              // HEADING
              const Text(
                'Reset Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF171717),
                ),
              ),

              const SizedBox(height: 10),

              // DESCRIPTION
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

              // EMAIL / PHONE TOGGLE
              Container(
                height: 52,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F1E9),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _tab('Email', Icons.mail_outline, true),
                    _tab('Phone Number', Icons.phone_outlined, false),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ANIMATED INPUT FIELD
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
                    ? _emailInput()
                    : _phoneInput(),
              ),

              const SizedBox(height: 30),

              // SEND RESET BUTTON
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: sendReset,
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

              // SECURITY ICON
              Icon(
                Icons.verified_user_outlined,
                color: green,
                size: 95,
              ),

              const SizedBox(height: 12),

              // BOTTOM INFORMATION
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

  // TOGGLE BUTTON
  Widget _tab(String title, IconData icon, bool email) {
    final selected = isEmail == email;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () {
            setState(() {
              isEmail = email;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            alignment: Alignment.center,
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
                  size: 18,
                ),
                const SizedBox(width: 7),
                Flexible(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: selected ? Colors.white : grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // EMAIL INPUT
  Widget _emailInput() {
    return Container(
      key: const ValueKey('email'),
      height: 64,
      decoration: _inputDecoration(),
      child: TextField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your email address',
          hintStyle: TextStyle(
            color: Color(0xFFAAAAAA),
            fontSize: 12,
          ),
          prefixIcon: Icon(
            Icons.mail_outline,
            color: Color(0xFF15583F),
            size: 21,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 22),
        ),
      ),
    );
  }

  // INTERNATIONAL PHONE INPUT
  Widget _phoneInput() {
    return Container(
      key: const ValueKey('phone'),
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: _inputDecoration(),
      child: IntlPhoneField(
        controller: phoneController,
        initialCountryCode: 'NP',
        showDropdownIcon: true,
        dropdownIconPosition: IconPosition.trailing,
        flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 5),
        disableLengthCheck: true,
        style: const TextStyle(fontSize: 13),
        dropdownTextStyle: TextStyle(
          color: green,
          fontSize: 13,
        ),
        decoration: const InputDecoration(
          hintText: 'Enter your phone number',
          hintStyle: TextStyle(
            color: Color(0xFFAAAAAA),
            fontSize: 12,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 18),
        ),
        onChanged: (phone) {
          completePhoneNumber = phone.completeNumber;
        },
      ),
    );
  }

  // REUSABLE INPUT DECORATION
  BoxDecoration _inputDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(40),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}
