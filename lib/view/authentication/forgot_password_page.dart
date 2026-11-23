//forget paswword page


import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAF3),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAF3),
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),

        title: const Text(
          "● FERITHRIFT",
          style: TextStyle(
            color: Color(0xFF073D2E),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 70),

            // Lock Icon
            const Center(
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Color(0xFFE5E8DE),
                child: Icon(
                  Icons.lock_reset,
                  size: 45,
                  color: Color(0xFF073D2E),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Heading
            const Center(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Description
            const Text(
              "Don't worry! Enter the Gmail address associated with your account and we'll send you a password reset link.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            const Text(
              "Email Address",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 8),

            // Email Field
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter your registered Gmail",
                prefixIcon: const Icon(Icons.email_outlined),
                filled: true,
                fillColor: const Color(0xFFF2F3EA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Send Reset Link Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF244F3E),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Send Reset Link →",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Back to Login
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back to Login",
                  style: TextStyle(
                    color: Color(0xFF073D2E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}