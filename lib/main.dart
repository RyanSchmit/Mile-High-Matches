import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)),
      title: "Mile High Matches",
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.airplanemode_on)),
                Tab(icon: Icon(Icons.message_rounded)),
                Tab(icon: Icon(Icons.person)),
              ],
            ),
          ),
          body: const Views(),
        ),
      ),
    );
  }
}

class Views extends StatelessWidget {
  const Views({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TabBarView(
        children: [
          MyHomePage(),
          MessagesPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          Center(child: Column(children: [MyTitle(), SubTitle(), Airplane()])),
    );
  }
}

class MyTitle extends StatelessWidget {
  const MyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Mile High Matches",
      style: TextStyle(fontSize: 60),
    );
  }
}

class SubTitle extends StatelessWidget {
  const SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Find love before you fly",
      style: TextStyle(fontSize: 25),
    );
  }
}

class Airplane extends StatelessWidget {
  const Airplane({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.airplane_ticket,
      color: Colors.blue,
      size: 100,
    );
  }
}

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
          MessageRow()
    ]));
  }
}

class MessageRow extends StatelessWidget {
  const MessageRow({super.key});


  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Text("Bob:   ", style: TextStyle(fontSize: 30)),
      Text("Hi", style: TextStyle(fontSize: 25))]);
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
        Image.asset('assets/images/profilePhoto.png'),
        const Text("Ryan Schmitt", style: TextStyle(fontSize: 60)),
        const Text("Bio:", style: TextStyle(fontSize: 20)),
        const Text("I love to fly and meet new people", style: TextStyle(fontSize: 25))
    ]));
  }
}
