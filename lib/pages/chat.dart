import 'package:flutter/material.dart';
import 'package:milehighmatch/main.dart';

class ChatPage extends StatefulWidget {
  final String name;
  const ChatPage({super.key, required this.name});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 1010,
        width: 1000,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.name),
            leading: BackButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              ),
            ),
          ),
          backgroundColor: Colors.blue,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16.0),
                TextField(
                  cursorColor: Colors.blue,
                  controller: _messageController,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}