import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // look for document that has the same id as the current users uid

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset('assets/images/profilePhoto.png')),
      const Text("About", style: TextStyle(fontSize: 60)),
      const Text("Full Name:",
          style: TextStyle(fontSize: 20, color: Colors.grey)),
      const Text("Bill Jones",
          style: TextStyle(fontSize: 25, color: Colors.black)),
      const Text("Bio:", style: TextStyle(fontSize: 20, color: Colors.grey)),
      const Text("I love to fly and meet new people",
          style: TextStyle(fontSize: 25, color: Colors.black)),
      const Text("Email:", style: TextStyle(fontSize: 20, color: Colors.grey)),
      Text(user.email!,
          style: const TextStyle(fontSize: 25, color: Colors.black)),
      MaterialButton(onPressed: () {
        FirebaseAuth.instance.signOut();
      }, 
      color: Colors.lightGreen,
      child: const Text("Sign out"),)
    ]));
  }
}
