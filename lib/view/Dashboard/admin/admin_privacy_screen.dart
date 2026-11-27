
import 'package:flutter/material.dart';

class AdminPrivacyScreen extends StatelessWidget {
  const AdminPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {

    const primary = Color(0xFF073D2E);
    const cardColor = Color(0xFFF2F3EA);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAF3),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAF3),
        foregroundColor: primary,
        elevation: 0,
        title: const Text("Privacy Protection"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          const Text(
            "Marketplace Privacy",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Monitor the privacy protection policies "
                "applied across the Feri marketplace.",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          privacyCard(
            Icons.phone_outlined,
            "Phone Number Protection",
            "Personal phone numbers are hidden from public profiles.",
          ),

          privacyCard(
            Icons.location_on_outlined,
            "Address Protection",
            "Residential addresses are not publicly displayed.",
          ),

          privacyCard(
            Icons.email_outlined,
            "Email Protection",
            "Personal email addresses are kept private.",
          ),

          privacyCard(
            Icons.security_outlined,
            "Personal Data Security",
            "Access to sensitive information is restricted "
                "to authorized personnel.",
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.shield_outlined, color: primary),
                    SizedBox(width: 10),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                SizedBox(height: 12),

                Text(
                  "Feri protects personal contact and residential "
                      "information from unauthorized public access. "
                      "Delivery information should only be available "
                      "to authorized parties when required for an order.",
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget privacyCard(
      IconData icon,
      String title,
      String description,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3EA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF073D2E),
            size: 26,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.lock_outline,
            color: Color(0xFF073D2E),
          ),
        ],
      ),
    );
  }
}
