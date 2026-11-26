import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: LoginScreen(),
));

class AppColors {
  static const background = Color(0xFFF9F8EF);
  static const primary = Color(0xFF244D3B);
  static const field = Color(0xFFEFEEE5);
  static const muted = Color(0xFF6F7A73);
  static const chip = Color(0xFFE9DFCB);
}

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

  void _sendOtp() {
    if (!_formKey.currentState!.validate()) return;
    // TODO: call your OTP API here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_useMobile
            ? 'OTP sent to +977 ${_phoneController.text}'
            : 'Code sent to ${_emailController.text}'),
      ),
    );
  }

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
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.circle, size: 7, color: AppColors.primary),
            SizedBox(width: 6),
            Text(
              'FERI THRIFT',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 16),
                _buildLogo(),
                const SizedBox(height: 10),
                _buildBrandRow(),
                const SizedBox(height: 14),
                const Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 6),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Sign in to discover curated vintage & pre-loved treasures in Nepal.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15, color: AppColors.muted, height: 1.4),
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
                        fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 8),
                _useMobile ? _buildPhoneField() : _buildEmailField(),
                const SizedBox(height: 8),
                if (_useMobile) ...[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        'We will send a 6-digit verification code via SMS',
                        style:
                        TextStyle(fontSize: 11.5, color: AppColors.muted),
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
                              fontSize: 11.5, color: AppColors.muted),
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
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 18),
                _buildPrimaryButton(),
                const SizedBox(height: 22),
                _buildDivider(),
                const SizedBox(height: 18),
                _buildGoogleButton(),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? ",
                        style: TextStyle(color: Color(0xFF444444))),
                    GestureDetector(
                      onTap: () {
                        // TODO: navigate to sign up
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------- Widgets ----------

  Widget _buildLogo() {
    return Container(
      width: 78,
      height: 78,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFE6E5DB),
        border: Border.all(color: const Color(0xFFD8D7CB), width: 3),
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Icon(
            Icons.checkroom,
            size: 36,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildBrandRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Feri Thrift',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.chip,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'फेरी',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ],
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
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: Colors.black87),
              const SizedBox(width: 6),
              Text(label,
                  style: const TextStyle(
                      fontSize: 13.5, fontWeight: FontWeight.w600)),
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
          const Text('+977',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
          const SizedBox(width: 10),
          Container(width: 1, height: 20, color: Colors.black26),
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
          const Icon(Icons.verified_user_outlined,
              size: 20, color: AppColors.muted),
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
          final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
              .hasMatch(v?.trim() ?? '');
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
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
        Expanded(child: Divider(color: Colors.black26)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'OR CONTINUE WITH',
            style: TextStyle(
                fontSize: 11.5, letterSpacing: 1, color: AppColors.muted),
          ),
        ),
        Expanded(child: Divider(color: Colors.black26)),
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
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFFEAEAEA)),
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
            Text('Google',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}