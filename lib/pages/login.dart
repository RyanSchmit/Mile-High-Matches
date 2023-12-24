import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milehighmatch/pages/home.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Change to linear gradient
      backgroundColor: const Color.fromRGBO(255, 115, 115, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MyTitle(),
            const Airplane(),
            TextField(
              cursorColor: Colors.blue,
              controller: _emailController,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 16.0),
            TextField(
              cursorColor: Colors.blue,
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                signIn();
              },
              child: const Text('Login'),
            ),
            Column(
              children: [
                const Text("Not a member?"),
                GestureDetector(
                    onTap: () => widget.showRegisterPage(),
                    child: const Text("Register now",
                        style: TextStyle(color: Colors.blue)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
