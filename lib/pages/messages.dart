import 'package:flutter/material.dart';
import 'package:milehighmatch/pages/chat.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    // Make infinite scroll possible
    return const Padding(
      padding: EdgeInsets.only(top: 60.0),
      child: Column(
        children: [
          Text("New Matches", style: TextStyle(fontSize: 40)),
          Row(
            children: [
              NewMatch(name: "Ava"),
              NewMatch(name: "Licy"),
              NewMatch(name: "Mae"),
              NewMatch(name: "Sonny"),
              NewMatch(name: "Anna"),
            ],
          ),
          Text("Messages", style: TextStyle(fontSize: 40)),
          MessageRow(name: 'Jonna', messageBody: 'hiii'),
          MessageRow(name: 'Diane', messageBody: 'hello'),
          // MessageRow(name: 'Youm', messageBody: 'How are you doing?'),
        ],
      ),
    );
  }
}

class MessageRow extends StatelessWidget {
  final String name;
  final String messageBody;
  const MessageRow({super.key, required this.name, required this.messageBody});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatPage(name: name)),
      ),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: (Row(
            children: [
              Image.asset('assets/images/match.png'),
              Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 7.0),
                  child: Text("$name: ", style: const TextStyle(fontSize: 30))),
              Text(messageBody,
                  style: const TextStyle(fontSize: 25),
                  overflow: TextOverflow.ellipsis)
            ],
          )),
        ),
      ),
    );
  }
}

class NewMatch extends StatelessWidget {
  final String name;
  const NewMatch({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            child: Image.asset('assets/images/match.png'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatPage(name: name)),
            ),
          ),
          Text(name)
        ],
      ),
    );
  }
}
