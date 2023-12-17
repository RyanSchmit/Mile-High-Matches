import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
          Padding(padding: const EdgeInsets.all(12.0), 
            child: Image.asset('assets/images/profilePhoto.png')),
            const Text("About", style: TextStyle(fontSize: 60)),
            const Text("Full Name:", style: TextStyle(fontSize: 20, color: Colors.grey)),
            const Text("Bill Jones", style: TextStyle(fontSize: 25, color: Colors.black)),
            const Text("Bio:", style: TextStyle(fontSize: 20, color: Colors.grey)),
            const Text("I love to fly and meet new people", style: TextStyle(fontSize: 25, color: Colors.black)),
            const Text("Email:", style: TextStyle(fontSize: 20, color: Colors.grey)),
            const Text("rtscd@gmail.com", style: TextStyle(fontSize: 25, color: Colors.black))
    ]));
  }
}