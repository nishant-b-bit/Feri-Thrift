import 'package:flutter/material.dart';
import '../../edit_profile_screen.dart';
import '../seller/seller_dashboard_screen.dart';

class BuyerProfileScreen extends StatefulWidget {
  const BuyerProfileScreen({super.key});

  @override
  State<BuyerProfileScreen> createState() =>
      _BuyerProfileScreenState();
}

class _BuyerProfileScreenState extends State<BuyerProfileScreen> {
  bool notifications = true;

  // User information
  String name = "Pemba Sherpa";
  String username = "pemba_ktm";
  String bio = "Love finding unique thrift pieces.";
  String location = "Lazimpat, Kathmandu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAF3),

      body: SafeArea(
        child: Column(
          children: [

            // Top Header
            Padding(
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

                  const Icon(
                    Icons.circle,
                    size: 6,
                    color: Colors.grey,
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    "Profile",
                    style: TextStyle(fontSize: 20),
                  ),

                  const Spacer(),

                  const Icon(
                    Icons.notifications_none,
                    size: 28,
                  ),
                ],
              ),
            ),

            // Scrollable Profile Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Profile Information
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F3EA),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Column(
                        children: [

                          Row(
                            children: [

                              // Empty Profile Picture
                              Container(
                                height: 75,
                                width: 75,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE5E8DE),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SizedBox(width: 15),

                              // User Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [

                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            name,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        const SizedBox(width: 5),

                                        const Icon(
                                          Icons.verified,
                                          color: Color(0xFF073D2E),
                                          size: 18,
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 5),

                                    Text(
                                      "@$username",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      "📍 $location",
                                      style: const TextStyle(fontSize: 12),
                                    ),

                                    Text(
                                      bio,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),

                              // Edit Profile Button
                              IconButton(
                                onPressed: () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const EditProfileScreen(),
                                    ),
                                  );

                                  if (result != null) {
                                    setState(() {
                                      name = result["name"];
                                      username = result["username"];
                                      bio = result["bio"];
                                      location = result["location"];
                                    });
                                  }
                                },
                                icon: const Icon(Icons.edit_outlined),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Seller Mode
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE9ECE3),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            child: Row(
                              children: [

                                const Icon(
                                  Icons.storefront_outlined,
                                  color: Color(0xFF073D2E),
                                ),

                                const SizedBox(width: 10),

                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Seller Mode",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),

                                      Text(
                                        "Manage listings & payouts",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),

                                // Go to Seller Dashboard
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const SellerDashboardScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    const Color(0xFF073D2E),
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text(
                                    "Go to Merchant Hub",
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Statistics
                    Row(
                      children: [

                        Expanded(
                          child: Container(
                            height: 90,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F3EA),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "2",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF073D2E),
                                  ),
                                ),
                                Text("In Transit"),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: Container(
                            height: 90,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F3EA),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "4",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF073D2E),
                                  ),
                                ),
                                Text("Wishlist"),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: Container(
                            height: 90,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F3EA),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "12",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF073D2E),
                                  ),
                                ),
                                Text("Items Saved"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // Recent Activity
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Activity",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "View All",
                          style: TextStyle(
                            color: Color(0xFF073D2E),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F3EA),
                        borderRadius: BorderRadius.circular(18),
                      ),

                      child: Column(
                        children: [

                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Color(0xFFBCEBD8),
                                child: Icon(
                                  Icons.local_shipping_outlined,
                                  color: Color(0xFF073D2E),
                                ),
                              ),

                              const SizedBox(width: 10),

                              const Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "My Purchases & Orders",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "#FT-84920 In Transit",
                                      style: TextStyle(
                                        color: Color(0xFF073D2E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const Icon(Icons.chevron_right),
                            ],
                          ),

                          const SizedBox(height: 15),

                          const Row(
                            children: [
                              Icon(
                                Icons.checkroom,
                                size: 40,
                                color: Colors.grey,
                              ),

                              SizedBox(width: 10),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Yak Wool Heritage Cardigan",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      "Arriving by Oct 26",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Text(
                                "Kathmandu Hub",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF073D2E),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Account Settings
                    const Text(
                      "Account Settings",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F3EA),
                        borderRadius: BorderRadius.circular(18),
                      ),

                      child: Column(
                        children: [

                          const ListTile(
                            leading: Icon(Icons.location_on_outlined),
                            title: Text(
                              "Saved Delivery Addresses",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "Default: Lazimpat, Ward 2, Kathmandu",
                            ),
                            trailing: Icon(Icons.chevron_right),
                          ),

                          const ListTile(
                            leading: Icon(
                              Icons.account_balance_wallet_outlined,
                            ),
                            title: Text(
                              "Payment Methods & Wallets",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text("eSewa   Khalti   Linked"),
                            trailing: Icon(Icons.chevron_right),
                          ),

                          // Notifications
                          ListTile(
                            leading: const Icon(
                              Icons.notifications_active_outlined,
                            ),
                            title: const Text(
                              "Notifications & Price Drops",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: const Text(
                              "Instant alerts for tracked vintage",
                            ),

                            trailing: Switch(
                              value: notifications,
                              activeTrackColor: const Color(0xFF073D2E),
                              onChanged: (value) {
                                setState(() {
                                  notifications = value;
                                });
                              },
                            ),
                          ),

                          const ListTile(
                            leading: Icon(Icons.help_outline),
                            title: Text(
                              "Help Center & Eco-Impact FAQ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "Returns, circular guarantees, support",
                            ),
                            trailing: Icon(Icons.chevron_right),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Log Out Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.logout),
                        label: const Text("Log Out"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFDAD6),
                          foregroundColor: Colors.red,
                          elevation: 0,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Center(
                      child: Text(
                        "Feri Thrift Circular Platform • v2.4.1",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        selectedItemColor: const Color(0xFF073D2E),
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.eco_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}