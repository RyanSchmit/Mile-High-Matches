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
        height: 1000,
        width: 1000,
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              ),
            ),
          ),
          backgroundColor: Colors.blue,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.name, style: const TextStyle(color: Colors.white, fontSize: 25),),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
