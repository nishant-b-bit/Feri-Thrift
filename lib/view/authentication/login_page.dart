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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 8),
                _buildLogo(),
                const SizedBox(height: 14),
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 6),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Sign in to discover curated vintage & pre-loved treasures in Nepal.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.muted,
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildToggle(),
                const SizedBox(height: 18),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _useMobile ? 'Mobile Number' : 'Email Address',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                _useMobile ? _buildPhoneField() : _buildEmailField(),
                if (_useMobile) ...[
                  const SizedBox(height: 8),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        'We will send a 6-digit verification code via SMS',
                        style: TextStyle(fontSize: 11.5, color: AppColors.muted),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text(
                          'Fast login with SMS OTP available',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: AppColors.muted,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO: navigate to password login
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Use Password instead',
                          style: TextStyle(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 24),
                _buildPrimaryButton(),
                const SizedBox(height: 24),
                _buildDivider(),
                const SizedBox(height: 18),
                _buildGoogleButton(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------- Widgets ----------

  Widget _buildLogo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.asset(
        'assets/images/logo.png',
        width: 220,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // Shows the real reason in your console if the asset fails to load
          debugPrint('LOGO ERROR: $error');
          return const Icon(
            Icons.checkroom,
            size: 60,
            color: AppColors.primary,
          );
        },
      ),
    );
  }

  Widget _buildToggle() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.field,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _toggleItem('Mobile Number', Icons.smartphone_outlined, true),
          _toggleItem('Email', Icons.mail_outline, false),
        ],
      ),
    );
  }

  Widget _toggleItem(String label, IconData icon, bool mobile) {
    final selected = _useMobile == mobile;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _useMobile = mobile),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 11),
          decoration: BoxDecoration(
            color: selected ? AppColors.card : Colors.transparent,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: AppColors.primary),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.field,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Text('🇳🇵', style: TextStyle(fontSize: 18)),
          const SizedBox(width: 6),
          const Text(
            '+977',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          const SizedBox(width: 10),
          Container(width: 1, height: 20, color: AppColors.muted),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                hintText: '9841234567',
                border: InputBorder.none,
                errorStyle: TextStyle(height: 0.8),
              ),
              validator: (v) {
                if (v == null || v.length != 10 || !v.startsWith('9')) {
                  return 'Enter a valid 10-digit number';
                }
                return null;
              },
            ),
          ),
          const Icon(
            Icons.verified_user_outlined,
            size: 20,
            color: AppColors.muted,
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.field,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'you@example.com',
          prefixIcon: Icon(Icons.mail_outline, color: AppColors.muted),
          border: InputBorder.none,
        ),
        validator: (v) {
          final ok = RegExp(
            r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
          ).hasMatch(v?.trim() ?? '');
          return ok ? null : 'Enter a valid email address';
        },
      ),
    );
  }

  Widget _buildPrimaryButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: _sendOtp,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _useMobile ? 'Send OTP Code' : 'Send Login Code',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.login, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: const [
        Expanded(child: Divider(color: AppColors.chip)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'OR CONTINUE WITH',
            style: TextStyle(
              fontSize: 11.5,
              letterSpacing: 1,
              color: AppColors.muted,
            ),
          ),
        ),
        Expanded(child: Divider(color: AppColors.chip)),
      ],
    );
  }

  Widget _buildGoogleButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: () {
          // TODO: Google sign-in (google_sign_in package)
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.card,
          side: const BorderSide(color: AppColors.chip),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'G',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Color(0xFF4285F4),
              ),
            ),
            SizedBox(width: 8),
            Text(
              'Google',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}