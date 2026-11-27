
import 'package:flutter/material.dart';

class SellerDashboardScreen extends StatefulWidget {
  const SellerDashboardScreen({super.key});

  @override
  State<SellerDashboardScreen> createState() =>
      _SellerDashboardScreenState();
}

class _SellerDashboardScreenState
    extends State<SellerDashboardScreen> {

  int selectedIndex = 0;

  String verificationStatus = "Not Submitted";

  final Color primary = const Color(0xFF073D2E);
  final Color background = const Color(0xFFFAFAF3);
  final Color cardColor = const Color(0xFFF2F3EA);

  Widget header(String title) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const Text(
            "Feri",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF073D2E),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.circle, size: 6, color: Colors.grey),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontSize: 20)),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, size: 27),
          ),
        ],
      ),
    );
  }

  Widget statCard(String value, String label, IconData icon) {
    return Expanded(
      child: Container(
        height: 105,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: primary, size: 21),
            const SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget actionTile(
      IconData icon,
      String title,
      String subtitle, {
        VoidCallback? onTap,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: primary, size: 25),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  // IDENTITY VERIFICATION CARD

  Widget verificationCard() {
    Color statusColor;

    if (verificationStatus == "Verified") {
      statusColor = Colors.green;
    } else if (verificationStatus == "Pending") {
      statusColor = Colors.orange;
    } else if (verificationStatus == "Rejected") {
      statusColor = Colors.red;
    } else {
      statusColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.verified_user_outlined,
                color: Color(0xFF073D2E),
                size: 25,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  "Seller Verification",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              Text(
                verificationStatus,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          const Text(
            "Verify your identity to receive the Feri Verified Seller badge.",
            style: TextStyle(fontSize: 13, color: Colors.black54),
          ),

          const SizedBox(height: 15),

          if (verificationStatus == "Verified")
            const Row(
              children: [
                Icon(Icons.verified, color: Color(0xFF073D2E)),
                SizedBox(width: 8),
                Text("Your seller account is verified."),
              ],
            )
          else
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: verificationStatus == "Pending"
                    ? null
                    : showVerificationDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                  elevation: 0,
                ),
                child: Text(
                  verificationStatus == "Pending"
                      ? "Waiting for Admin Review"
                      : verificationStatus == "Rejected"
                      ? "Resubmit Verification"
                      : "Verify My Identity",
                ),
              ),
            ),
        ],
      ),
    );
  }

  void showVerificationDialog() {
    final nameController = TextEditingController();
    String documentType = "Citizenship Card";

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, updateDialog) {
            return AlertDialog(
              backgroundColor: background,
              title: const Text("Identity Verification"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Provide your identity details for admin review.",
                      style: TextStyle(fontSize: 13),
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Full Legal Name",
                        filled: true,
                        fillColor: cardColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    DropdownButtonFormField<String>(
                      value: documentType,
                      decoration: InputDecoration(
                        labelText: "Document Type",
                        filled: true,
                        fillColor: cardColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "Citizenship Card",
                          child: Text("Citizenship Card"),
                        ),
                        DropdownMenuItem(
                          value: "National ID",
                          child: Text("National ID"),
                        ),
                        DropdownMenuItem(
                          value: "Passport",
                          child: Text("Passport"),
                        ),
                      ],
                      onChanged: (value) {
                        updateDialog(() {
                          documentType = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 15),

                    Container(
                      padding: const EdgeInsets.all(18),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5E8DE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            size: 35,
                            color: Color(0xFF073D2E),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Upload Identity Document",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Document upload will be connected later.",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (nameController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(this.context).showSnackBar(
                        const SnackBar(
                          content: Text("Enter your legal name."),
                        ),
                      );
                      return;
                    }

                    setState(() {
                      verificationStatus = "Pending";
                    });

                    Navigator.pop(dialogContext);
                  },
                  child: const Text("Submit Request"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // SELLER OVERVIEW

  Widget overviewPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: Color(0xFFE5E8DE),
                  child: Icon(
                    Icons.person,
                    size: 35,
                    color: Color(0xFF073D2E),
                  ),
                ),
                const SizedBox(width: 13),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pemba Sherpa",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "@pemba_ktm",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Seller Account",
                        style: TextStyle(
                          color: Color(0xFF073D2E),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.storefront_outlined,
                  color: Color(0xFF073D2E),
                  size: 28,
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            "Seller Overview",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              statCard("8", "Active Listings", Icons.inventory_2_outlined),
              const SizedBox(width: 8),
              statCard("3", "Orders", Icons.shopping_bag_outlined),
              const SizedBox(width: 8),
              statCard("12K", "Earnings (Rs.)", Icons.wallet_outlined),
            ],
          ),

          const SizedBox(height: 25),

          verificationCard(),

          const SizedBox(height: 25),

          const Text(
            "Quick Actions",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          actionTile(
            Icons.add_box_outlined,
            "Create New Listing",
            "Add a thrift product for sale",
            onTap: () => setState(() => selectedIndex = 1),
          ),

          actionTile(
            Icons.inventory_2_outlined,
            "Manage Listings",
            "Edit or mark products as sold",
            onTap: () => setState(() => selectedIndex = 1),
          ),

          actionTile(
            Icons.local_shipping_outlined,
            "Manage Orders",
            "View customer orders",
            onTap: () => setState(() => selectedIndex = 2),
          ),

          const SizedBox(height: 25),

          const Text(
            "Recent Sales",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          actionTile(
            Icons.checkroom,
            "Vintage Denim Jacket",
            "Order #FT-1024 • Rs. 1,500",
          ),

          actionTile(
            Icons.shopping_bag_outlined,
            "Classic Leather Bag",
            "Order #FT-1023 • Rs. 2,000",
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }

  // LISTINGS

  Widget listingsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Listings",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Create New Listing"),
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(14),
              ),
            ),
          ),

          const SizedBox(height: 15),

          actionTile(
            Icons.checkroom,
            "Vintage Denim Jacket",
            "Rs. 1,500 • Active",
          ),

          actionTile(
            Icons.shopping_bag_outlined,
            "Classic Leather Bag",
            "Rs. 2,000 • Active",
          ),

          actionTile(
            Icons.snowshoeing,
            "Retro Sneakers",
            "Rs. 1,200 • Sold",
          ),
        ],
      ),
    );
  }

  // ORDERS

  Widget ordersPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Orders & Sales",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          actionTile(
            Icons.local_shipping_outlined,
            "Order #FT-1024",
            "Vintage Denim Jacket • Processing",
          ),

          actionTile(
            Icons.inventory_2_outlined,
            "Order #FT-1023",
            "Classic Leather Bag • Shipped",
          ),

          actionTile(
            Icons.check_circle_outline,
            "Order #FT-1022",
            "Retro Sneakers • Delivered",
          ),

          const SizedBox(height: 20),

          const Text(
            "Earnings Summary",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                Text("Total Earnings"),
                SizedBox(height: 8),
                Text(
                  "Rs. 12,000",
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF073D2E),
                  ),
                ),
                Text(
                  "Sample earnings data",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // SETTINGS

  Widget settingsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Seller Settings",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          actionTile(
            Icons.verified_user_outlined,
            "Identity Verification",
            "View your verification status",
            onTap: showVerificationDialog,
          ),

          actionTile(
            Icons.lock_outline,
            "Privacy & Security",
            "Manage personal information visibility",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SellerPrivacyScreen(),
                ),
              );
            },
          ),

          actionTile(
            Icons.person_outline,
            "Edit Seller Profile",
            "Update your seller information",
          ),

          actionTile(
            Icons.notifications_none,
            "Notifications",
            "Manage order and sale notifications",
          ),

          actionTile(
            Icons.help_outline,
            "Help & Support",
            "Get help with your seller account",
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: () {
                // Buyer screen is the previous screen.
                Navigator.pop(context);
              },
              icon: const Icon(Icons.shopping_bag_outlined),
              label: const Text("Go to Buyer Mode"),
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                foregroundColor: Colors.white,
                elevation: 0,
              ),
            ),
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final pages = [
      overviewPage(),
      listingsPage(),
      ordersPage(),
      settingsPage(),
    ];

    final titles = [
      "Seller Hub",
      "My Listings",
      "Orders",
      "Settings",
    ];

    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: Column(
          children: [
            header(titles[selectedIndex]),
            Expanded(child: pages[selectedIndex]),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: "Overview",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            label: "Listings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}


// SELLER PRIVACY SCREEN

class SellerPrivacyScreen extends StatelessWidget {
  const SellerPrivacyScreen({super.key});

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
        title: const Text("Privacy & Security"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          const Text(
            "Personal Information",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Your personal information is protected and "
                "will not be displayed on your public seller profile.",
            style: TextStyle(color: Colors.black54),
          ),

          const SizedBox(height: 20),

          privacyTile(
            Icons.phone_outlined,
            "Phone Number",
            "Hidden from other users",
          ),

          privacyTile(
            Icons.location_on_outlined,
            "Home Address",
            "Hidden from public profiles",
          ),

          privacyTile(
            Icons.email_outlined,
            "Email Address",
            "Not publicly visible",
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.shield_outlined, color: primary, size: 28),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Your contact and residential details are kept private. "
                        "Required delivery information should only be shared "
                        "through authorized order and delivery processes.",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget privacyTile(
      IconData icon,
      String title,
      String subtitle,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3EA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF073D2E)),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.lock_outline,
          color: Color(0xFF073D2E),
        ),
      ),
    );
  }
}
