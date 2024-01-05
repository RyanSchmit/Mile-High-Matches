import 'package:flutter/material.dart';
import 'package:milehighmatch/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatPage extends StatefulWidget {
  final String name;
  const ChatPage({super.key, required this.name});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;

  Future addMessageData() async {
    // Is it unsafe to do this?
    await FirebaseFirestore.instance.collection('messages').doc(user.uid).set({
      'messagesFrom': [_messageController.text.trim()],
      'messagesTo': []
    });
  }

  Future getMessagesToData() async {
    var messagesToArray =
        FirebaseFirestore.instance.collection("messages").doc(user.uid);
    return await messagesToArray.get().then((snapshot) => snapshot.data());
  }

  Future getMessagesFromData() async {
    var messagesFromArray =
        FirebaseFirestore.instance.collection("messages").doc(user.uid);
    return await messagesFromArray.get().then((snapshot) => snapshot.data());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 1010,
        width: 1000,
        child: Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                Image.asset('assets/images/match.png', scale: 2.0),
                Text(widget.name),
              ],
            ),
            leading: BackButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(221, 55, 55, 55),
          body: const SentMessage(messageBody: "How are you?", received: false),
          bottomNavigationBar: Padding(
            padding:
                const EdgeInsets.only(bottom: 140.0, left: 16.0, right: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: Colors.blue,
                    controller: _messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Type Message',
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await addMessageData();
                    _messageController.text = "";
                  },
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SentMessage extends StatelessWidget {
  final String messageBody;
  final bool received;
  const SentMessage(
      {super.key, required this.messageBody, required this.received});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, right: 12.0, left: 12.0),
      child: Align(
        alignment: received ? Alignment.bottomLeft : Alignment.bottomRight,
        child: Container(
          decoration: BoxDecoration(
            color: received ? Colors.grey : Colors.blue,
            borderRadius: const BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Text(
            messageBody,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
