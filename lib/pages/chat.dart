import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String name;
  const ChatPage({super.key, required this.name});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Chat with ${widget.name}",
          style: const TextStyle(color: Colors.white),
        ),
        const Text("Hello")
      ],
    );
  }
}
