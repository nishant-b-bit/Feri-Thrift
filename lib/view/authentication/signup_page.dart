

import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {

  const SignupScreen({super.key});

  @override

  State<SignupScreen> createState() => _SignupScreenState();

}

class _SignupScreenState extends State<SignupScreen> {

  bool explorerSelected = true;

  bool showPassword = false;

  bool agreed = false;

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFFAFAF3),

      appBar: AppBar(

        backgroundColor: const Color(0xFFFAFAF3),

        elevation: 0,

        leading: const Icon(Icons.arrow_back),

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

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const SizedBox(height: 15),

            // Logo Placeholder

            const CircleAvatar(

              radius: 43,

              backgroundColor: Color(0xFFE5E8DE),

              child: Icon(

                Icons.checkroom,

                size: 40,

                color: Color(0xFF073D2E),

              ),

            ),

            const SizedBox(height: 20),

            const Text(

              "Create Your Account",

              style: TextStyle(

                fontSize: 27,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 8),

            const Text(

              "Buy, sell, and re-wear authentic vintage & pre-loved fashion across Nepal.",

              textAlign: TextAlign.center,

              style: TextStyle(fontSize: 15, color: Colors.grey),

            ),

            const SizedBox(height: 25),

            // Account Type Selection

            Container(

              padding: const EdgeInsets.all(5),

              decoration: BoxDecoration(

                color: const Color(0xFFECEFE5),

                borderRadius: BorderRadius.circular(15),

              ),

              child: Row(

                children: [

                  Expanded(

                    child: ElevatedButton(

                      onPressed: () {

                        setState(() {

                          explorerSelected = true;

                        });

                      },

                      style: ElevatedButton.styleFrom(

                        backgroundColor: explorerSelected

                            ? const Color(0xFF244F3E)

                            : const Color(0xFFECEFE5),

                        foregroundColor: explorerSelected

                            ? Colors.white

                            : Colors.black,

                        elevation: 0,

                      ),

                      child: const Text("Thrift Explorer"),

                    ),

                  ),

                  Expanded(

                    child: ElevatedButton(

                      onPressed: () {

                        setState(() {

                          explorerSelected = false;

                        });

                      },

                      style: ElevatedButton.styleFrom(

                        backgroundColor: !explorerSelected

                            ? const Color(0xFF244F3E)

                            : const Color(0xFFECEFE5),

                        foregroundColor: !explorerSelected

                            ? Colors.white

                            : Colors.black,

                        elevation: 0,

                      ),

                      child: const Text("Wardrobe Seller"),

                    ),

                  ),

                ],

              ),

            ),

            const SizedBox(height: 25),

            // Full Name

            const Align(

              alignment: Alignment.centerLeft,

              child: Text("Full Name"),

            ),

            const SizedBox(height: 8),

            TextField(

              decoration: InputDecoration(

                hintText: "e.g. Salina Shakya",

                prefixIcon: const Icon(Icons.person_outline),

                filled: true,

                fillColor: const Color(0xFFF2F3EA),

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(15),

                  borderSide: BorderSide.none,

                ),

              ),

            ),

            const SizedBox(height: 18),

            // Mobile Number

            const Align(

              alignment: Alignment.centerLeft,

              child: Text("Mobile Number"),

            ),

            const SizedBox(height: 8),

            TextField(

              keyboardType: TextInputType.phone,

              decoration: InputDecoration(

                hintText: "+977 98XXXXXXXX",

                prefixIcon: const Icon(Icons.phone_android),

                filled: true,

                fillColor: const Color(0xFFF2F3EA),

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(15),

                  borderSide: BorderSide.none,

                ),

              ),

            ),

            const SizedBox(height: 18),

            // Email Address

            const Align(

              alignment: Alignment.centerLeft,

              child: Text("Email Address"),

            ),

            const SizedBox(height: 8),

            TextField(

              keyboardType: TextInputType.emailAddress,

              decoration: InputDecoration(

                hintText: "example@gmail.com",

                prefixIcon: const Icon(Icons.email_outlined),

                filled: true,

                fillColor: const Color(0xFFF2F3EA),

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(15),

                  borderSide: BorderSide.none,

                ),

              ),

            ),

            const SizedBox(height: 18),

            // Password

            const Align(

              alignment: Alignment.centerLeft,

              child: Text("Create Password"),

            ),

            const SizedBox(height: 8),

            TextField(

              obscureText: !showPassword,

              decoration: InputDecoration(

                hintText: "Minimum 8 characters",

                prefixIcon: const Icon(Icons.lock_outline),

                suffixIcon: IconButton(

                  onPressed: () {

                    setState(() {

                      showPassword = !showPassword;

                    });

                  },

                  icon: Icon(

                    showPassword

                        ? Icons.visibility_off

                        : Icons.visibility,

                  ),

                ),

                filled: true,

                fillColor: const Color(0xFFF2F3EA),

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(15),

                  borderSide: BorderSide.none,

                ),

              ),

            ),

            const SizedBox(height: 20),

            // Terms and Conditions

            Row(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Checkbox(

                  value: agreed,

                  activeColor: const Color(0xFF073D2E),

                  onChanged: (value) {

                    setState(() {

                      agreed = value!;

                    });

                  },

                ),

                const Expanded(

                  child: Padding(

                    padding: EdgeInsets.only(top: 12),

                    child: Text(

                      "I agree to Feri Thrift Terms of Service, Community Thrift Guidelines & Privacy Policy.",

                      style: TextStyle(fontSize: 13),

                    ),

                  ),

                ),

              ],

            ),

            const SizedBox(height: 15),

            // Create Account Button

            SizedBox(

              width: double.infinity,

              height: 55,

              child: ElevatedButton(

                onPressed: agreed ? () {} : null,

                style: ElevatedButton.styleFrom(

                  backgroundColor: const Color(0xFF244F3E),

                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(30),

                  ),

                ),

                child: const Text(

                  "Create Account & Continue →",

                  style: TextStyle(fontSize: 16),

                ),

              ),

            ),

            const SizedBox(height: 25),

            const Row(

              children: [

                Expanded(child: Divider()),

                Padding(

                  padding: EdgeInsets.symmetric(horizontal: 15),

                  child: Text("OR SIGN UP WITH"),

                ),

                Expanded(child: Divider()),

              ],

            ),

            const SizedBox(height: 20),

            SizedBox(

              width: double.infinity,

              height: 55,

              child: ElevatedButton(

                onPressed: () {},

                style: ElevatedButton.styleFrom(

                  backgroundColor: const Color(0xFFF2F3EA),

                  foregroundColor: Colors.black,

                  elevation: 0,

                ),

                child: const Text("G  Google"),

              ),

            ),

            const SizedBox(height: 25),

            // Navigate to Login

            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                const Text("Already have an account? "),

                GestureDetector(

                  onTap: () {

                    Navigator.pop(context);

                  },

                  child: const Text(

                    "Sign In",

                    style: TextStyle(

                      color: Color(0xFF073D2E),

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                ),

              ],

            ),

            const SizedBox(height: 20),

          ],

        ),

      ),

    );

  }

}

 