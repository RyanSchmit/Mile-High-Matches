import 'package:flutter/material.dart';
import 'package:milehighmatch/pages/discover.dart';
import 'package:milehighmatch/pages/home.dart';
import 'package:milehighmatch/pages/messages.dart';
import 'package:milehighmatch/pages/profile.dart';

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
          DiscoverPage(),
          MessagesPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
