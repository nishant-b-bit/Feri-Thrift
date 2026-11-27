
import 'package:flutter/material.dart';
import 'admin_privacy_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() =>
      _AdminDashboardScreenState();
}

class _AdminDashboardScreenState
    extends State<AdminDashboardScreen> {

  int selectedIndex = 0;

  final Color primary = const Color(0xFF073D2E);
  final Color background = const Color(0xFFFAFAF3);
  final Color cardColor = const Color(0xFFF2F3EA);

  // Temporary sample verification requests.

  final List<Map<String, String>> requests = [
    {
      "name": "Pemba Sherpa",
      "username": "@pemba_ktm",
      "document": "Citizenship Card",
      "date": "27 Nov 2026",
      "status": "Pending",
      "reason": "",
    },
    {
      "name": "Salina Tamang",
      "username": "@salina_ktm",
      "document": "National ID",
      "date": "26 Nov 2026",
      "status": "Pending",
      "reason": "",
    },
    {
      "name": "Biraj Lama",
      "username": "@biraj_store",
      "document": "Citizenship Card",
      "date": "25 Nov 2026",
      "status": "Approved",
      "reason": "",
    },
  ];

  final List<Map<String, String>> users = [
    {
      "name": "Pemba Sherpa",
      "username": "@pemba_ktm",
      "role": "Buyer & Seller",
      "status": "Active",
    },
    {
      "name": "Salina Tamang",
      "username": "@salina_ktm",
      "role": "Seller",
      "status": "Active",
    },
    {
      "name": "Biraj Lama",
      "username": "@biraj_store",
      "role": "Seller",
      "status": "Active",
    },
    {
      "name": "Riyush Awal",
      "username": "@riyush_awal",
      "role": "Buyer",
      "status": "Active",
    },
  ];

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

  // ADMIN OVERVIEW

  Widget overviewPage() {
    final pendingCount =
        requests.where((r) => r["status"] == "Pending").length;

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
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Color(0xFFE5E8DE),
                  child: Icon(
                    Icons.admin_panel_settings_outlined,
                    size: 35,
                    color: Color(0xFF073D2E),
                  ),
                ),
                SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Feri Administrator",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "admin@ferithrift.com",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Administrator Account",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF073D2E),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.shield_outlined,
                  color: Color(0xFF073D2E),
                  size: 28,
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            "Marketplace Overview",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              statCard("1,250", "Total Users", Icons.people_outline),
              const SizedBox(width: 8),
              statCard("340", "Sellers", Icons.storefront_outlined),
              const SizedBox(width: 8),
              statCard("820", "Listings", Icons.inventory_2_outlined),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              statCard(
                pendingCount.toString(),
                "Pending Reviews",
                Icons.pending_actions,
              ),
              const SizedBox(width: 8),
              statCard("24", "Reported Items", Icons.flag_outlined),
              const SizedBox(width: 8),
              statCard("18", "Reported Users", Icons.person_off_outlined),
            ],
          ),

          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Pending Verifications",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() => selectedIndex = 1);
                },
                child: Text(
                  "View All",
                  style: TextStyle(color: primary),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          if (pendingCount == 0)
            const Text("No pending verification requests.")
          else
            ...requests
                .where((r) => r["status"] == "Pending")
                .map((request) => verificationTile(request)),

          const SizedBox(height: 25),

          const Text(
            "Recent Admin Activities",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          actionTile(
            Icons.verified_user_outlined,
            "New verification request",
            "Seller identity submission received",
          ),

          actionTile(
            Icons.flag_outlined,
            "New listing reported",
            "Vintage Jacket",
          ),

          actionTile(
            Icons.person_add_alt_1_outlined,
            "New seller registered",
            "New seller account created",
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }

  // VERIFICATION LIST

  Widget verificationTile(Map<String, String> request) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFE5E8DE),
          child: Icon(
            Icons.person_outline,
            color: Color(0xFF073D2E),
          ),
        ),
        title: Text(
          request["name"]!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "${request["document"]} • ${request["date"]}",
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Color(0xFF073D2E),
        ),
        onTap: () => openVerificationDetails(request),
      ),
    );
  }

  // VERIFICATION DETAILS

  void openVerificationDetails(Map<String, String> request) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: background,
          title: const Text("Verification Review"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Center(
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFFE5E8DE),
                    child: Icon(
                      Icons.person,
                      size: 38,
                      color: Color(0xFF073D2E),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                detailRow("Seller Name", request["name"]!),
                detailRow("Username", request["username"]!),
                detailRow("Document", request["document"]!),
                detailRow("Submitted", request["date"]!),
                detailRow("Status", request["status"]!),

                const SizedBox(height: 15),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E8DE),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.image_outlined,
                        size: 45,
                        color: Color(0xFF073D2E),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Identity Document Preview",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Uploaded document will appear here.",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                if (request["status"] == "Rejected")
                  Text(
                    "Rejection reason: ${request["reason"]}",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),

                const Text(
                  "This is a demonstration. Actual document review "
                      "will require uploaded identity documents.",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          actions: [
            if (request["status"] == "Pending") ...[
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                  showRejectionDialog(request);
                },
                child: const Text(
                  "Reject",
                  style: TextStyle(color: Colors.red),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    request["status"] = "Approved";
                  });

                  Navigator.pop(dialogContext);

                  ScaffoldMessenger.of(this.context).showSnackBar(
                    const SnackBar(
                      content: Text("Seller approved (demo only)."),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Approve"),
              ),
            ] else
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text("Close"),
              ),
          ],
        );
      },
    );
  }

  // REJECTION DIALOG

  void showRejectionDialog(Map<String, String> request) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: background,
          title: const Text("Reject Verification"),
          content: TextField(
            controller: controller,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Enter rejection reason",
              filled: true,
              fillColor: cardColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
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
                if (controller.text.trim().isEmpty) {
                  ScaffoldMessenger.of(this.context).showSnackBar(
                    const SnackBar(
                      content: Text("Enter a rejection reason."),
                    ),
                  );
                  return;
                }

                setState(() {
                  request["status"] = "Rejected";
                  request["reason"] = controller.text.trim();
                });

                Navigator.pop(dialogContext);
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  Widget detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // VERIFICATION PAGE

  Widget verificationPage() {
    final pending = requests
        .where((r) => r["status"] == "Pending")
        .toList();

    final reviewed = requests
        .where((r) => r["status"] != "Pending")
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Seller Verification",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Review seller identity submissions and manage verification badges.",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.pending_actions,
                  color: Color(0xFF073D2E),
                  size: 30,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    "Pending Requests",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "${pending.length}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF073D2E),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Awaiting Review",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          if (pending.isEmpty)
            const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text("No pending requests."),
              ),
            )
          else
            ...pending.map((request) => verificationTile(request)),

          const SizedBox(height: 20),

          const Text(
            "Reviewed Requests",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          if (reviewed.isEmpty)
            const Text("No reviewed requests yet.")
          else
            ...reviewed.map((request) => verificationTile(request)),

          const SizedBox(height: 25),
        ],
      ),
    );
  }

  // USER MANAGEMENT

  Widget usersPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "User Management",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Search users...",
                icon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),

          const SizedBox(height: 15),

          ...users.map((user) => actionTile(
            Icons.person_outline,
            user["name"]!,
            "${user["username"]} • ${user["role"]} • ${user["status"]}",
          )),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ADMIN SETTINGS

  Widget settingsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Admin Settings",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          actionTile(
            Icons.shield_outlined,
            "Privacy Protection",
            "Review marketplace privacy controls",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AdminPrivacyScreen(),
                ),
              );
            },
          ),

          actionTile(
            Icons.category_outlined,
            "Catalog Management",
            "Manage product categories and listings",
          ),

          actionTile(
            Icons.flag_outlined,
            "Reports & Moderation",
            "Review reported users and products",
          ),

          actionTile(
            Icons.account_balance_wallet_outlined,
            "Commission & Payments",
            "Manage marketplace commission",
          ),

          actionTile(
            Icons.history,
            "Admin Activity Logs",
            "Review administrator activities",
          ),

          actionTile(
            Icons.help_outline,
            "Help & Support",
            "Admin support and documentation",
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 52,
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

          const SizedBox(height: 25),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final pages = [
      overviewPage(),
      verificationPage(),
      usersPage(),
      settingsPage(),
    ];

    final titles = [
      "Admin Dashboard",
      "Verification",
      "Users",
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
            icon: Icon(Icons.verified_user_outlined),
            label: "Verification",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: "Users",
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
