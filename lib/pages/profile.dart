import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  Future getUserInfo() async {
    var userDoc =
        FirebaseFirestore.instance.collection("profiles").doc(user.uid);
    return await userDoc.get().then((snapshot) => snapshot.data());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 65.0),
      child: Center(
          child: FutureBuilder(
              future: getUserInfo(),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset('assets/images/profilePhoto.png')),
                    const Text("About", style: TextStyle(fontSize: 60)),
                    const Text("Full Name:",
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                    Text(snapshot.data['name'],
                        style: TextStyle(fontSize: 25, color: Colors.black)),
                    const Text("Bio:",
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                    Text(snapshot.data['bio'],
                        style: TextStyle(fontSize: 25, color: Colors.black)),
                    const Text("Email:",
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                    Text(user.email!,
                        style:
                            const TextStyle(fontSize: 25, color: Colors.black)),
                    MaterialButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      color: Colors.lightGreen,
                      child: const Text("Sign out"),
                    )
                  ],
                );
              })),
    );
  }
}
