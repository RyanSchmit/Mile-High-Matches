import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(children: [
          Text("Messages", style: TextStyle(fontSize: 60)),
          MessageRow(),
          MessageRow(),
          MessageRow(),
          MessageRow(),
          MessageRow(),
          MessageRow()
    ]));
  }
}

class MessageRow extends StatelessWidget {
  const MessageRow({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset('assets/images/match.png'),
      const Text("Roma:   ", style: TextStyle(fontSize: 30)),
      const Text("Hi", style: TextStyle(fontSize: 25))]);
  }
}