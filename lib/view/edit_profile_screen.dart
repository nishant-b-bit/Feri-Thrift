
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  TextEditingController nameController =
  TextEditingController(text: "Pemba Sherpa");

  TextEditingController usernameController =
  TextEditingController(text: "pemba_ktm");

  TextEditingController bioController =
  TextEditingController(text: "Love finding unique thrift pieces.");

  TextEditingController locationController =
  TextEditingController(text: "Lazimpat, Kathmandu");

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
          "Edit Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF073D2E),
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Profile Picture
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Color(0xFFE5E8DE),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Change Profile Photo",
                    style: TextStyle(
                      color: Color(0xFF073D2E),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Full Name
            const Text(
              "Full Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter your full name",
                filled: true,
                fillColor: const Color(0xFFF2F3EA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Username
            const Text(
              "Username",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Enter username",
                filled: true,
                fillColor: const Color(0xFFF2F3EA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Bio
            const Text(
              "Bio",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: bioController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Write something about yourself",
                filled: true,
                fillColor: const Color(0xFFF2F3EA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Location
            const Text(
              "Location",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: locationController,
              decoration: InputDecoration(
                hintText: "Enter your location",
                prefixIcon: const Icon(Icons.location_on_outlined),
                filled: true,
                fillColor: const Color(0xFFF2F3EA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 35),

            // Save Changes Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    "name": nameController.text,
                    "username": usernameController.text,
                    "bio": bioController.text,
                    "location": locationController.text,
                  });
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF073D2E),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),

                child: const Text(
                  "Save Changes",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Cancel Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF073D2E),
                  side: const BorderSide(
                    color: Color(0xFF073D2E),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Cancel"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
