import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  Future signUp() async {
    if (_confirmPasswordController.text.trim() ==
        _passwordController.text.trim()) {
      String? docId = "";
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim())
          .then((snapShot) => docId = snapShot.user?.uid);

      // Add user data
      addUserData(docId, _nameController.text.trim(),
          _bioController.text.trim(), _genderController.text.trim());
    }
  }

  Future addUserData(
      String? docID, String name, String bio, String gender) async {
        // Is it unsafe to do this?
    await FirebaseFirestore.instance.collection('profiles').doc(docID).set({
      'name': name,
      'bio': bio,
      'gender': gender,
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _bioController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 115, 115, 1),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 6.0, bottom: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign Up", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            const Text("Register with your info below",
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 50),

            // Input info
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

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white)),
              child: TextField(
                cursorColor: Colors.black,
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(height: 32.0),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white)),
              child: TextField(
                // Make a show password boolean
                obscureText: true,
                cursorColor: Colors.black,
                controller: _passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(height: 32.0),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white)),
              child: TextField(
                obscureText: true,
                cursorColor: Colors.black,
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(height: 32.0),

            // Change to buttons for male, female of non-binary
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

            Container(
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
              onPressed: () {
                signUp();
              },
              child: const Text('Register'),
            ),
            Column(
              children: [
                const Text("Already a member?"),
                GestureDetector(
                    onTap: () => widget.showLoginPage(),
                    child: const Text("Login",
                        style: TextStyle(color: Colors.blue)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
