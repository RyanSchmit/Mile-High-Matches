import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milehighmatch/main.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;

  Future addUserData() async {
    // Is it unsafe to do this?
    await FirebaseFirestore.instance.collection('profiles').doc(user.uid).set({
      'name': _nameController.text.trim(),
      'bio': _bioController.text.trim(),
      'gender': _genderController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 1000,
        width: 1000,
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(255, 115, 115, 1),
          body: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 6.0, bottom: 6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Profile Info", style: TextStyle(fontSize: 24)),
                const SizedBox(height: 10),
                const Text("Complete your profile",
                    style: TextStyle(fontSize: 20)),
                const SizedBox(height: 50),

                // Name
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white)),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: _nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 32.0),

                // Gender
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white)),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: _genderController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Gender",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 32.0),

                // Bio
                Container(
                  // Make bigger
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white)),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: _bioController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Bio",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 32.0),

                // Sign up button
                ElevatedButton(
                  onPressed: () async {
                    await addUserData();
                    setState(() {
                      main();
                    });
                  },
                  child: const Text('Complete Registration'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
